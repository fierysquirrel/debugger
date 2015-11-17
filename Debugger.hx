package;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.TouchEvent;
import openfl.display.FPS;

/**
 * 
 * 
 * @author Henry D. Fernández B.
 */
class Debugger
{
	private static var fps : FPS;
	
	private static var screenWidth : Int;
	private static var screenHeight : Int;
	private static var consoleWindow : Console;
	//var inspectorWindow : Inspector;
	
	/*
	 * Screen manager instance.
	 */
	private static var instance : Debugger;
	
	/*
	 * Event dispatcher, fires all the logic events.
	 * */
	public static var eventDispatcher : EventDispatcher;
	
	/*
	 *
	 */
	private static var container : Sprite;
	
	
	public static function InitInstance(cont : Sprite, width : Int, height : Int): Debugger
	{
		if (instance == null)
			instance = new Debugger(cont,width,height);
		
		return instance;
	}
	
	/*
	 * Creates and returns a screen manager instance if it's not created yet.
	 * Returns the current instance of this class if it already exists.
	 */
	public static function GetInstance(): Debugger
	{
		if ( instance == null )
			throw "The Debugging System is not initialized. Use function 'InitInstance'";
		
		return instance;
	}
	
	/*
	 * Constructor
	 */
	private function new(cont : Sprite, width : Int, height : Int) 
	{
		container = cont;
		
		var test : DraggableWindow;
		var con : Console;
		
		screenWidth = width;
		screenHeight = height;
		// Add an FPS counter
        fps = new FPS();
		
		//FPS
		container.addChild(fps);
		fps.visible = false;
		fps.textColor = 0xffffff;
		
		//Event dispatcher
		eventDispatcher = new EventDispatcher();
		
		//test = new DraggableWindow(100, 100, 400, 200, 0x000000, eventDispatcher);
		con = Console.GetInstance(0, screenHeight/2, screenWidth, screenHeight/2, eventDispatcher);
		
		//container.addChild(test);
		//container.addChild(con);
		
		//Console 
		//consoleWindow = Console.GetInstance(GraphicManager.GetWidth() / 2, GraphicManager.GetHeight() / 2, 500, 300, eventDispatcher);
		//inspectorWindow = Inspector.GetInstance(GraphicManager.GetWidth() / 2, GraphicManager.GetHeight() / 2, GraphicManager.GetWidth() / 4, GraphicManager.GetHeight() / 1.5, eventDispatcher);
		
		//eventDispatcher.addEventListener(GameEvents.EVENT_TRACE_SCREENS, HandleEvent);
	}
	
	/*function CloseConsole()
	{
		fixedContainer.removeChild(consoleWindow);
		isDebugging = false;
	}
	
	function CloseInspector()
	{
		fixedContainer.removeChild(inspectorWindow);
		isInspecting = false;
	}*/
	
	public static function Print(text : String) : Void
	{
		Console.Print(text);
	}
	
	public static function ShowFPS() : Void
	{
		fps.visible = true;
	}
	
	public static function GetEventDispatcher() : EventDispatcher
	{
		return eventDispatcher;
	}
	
	public static function AddEvent(event : String, handler : Dynamic -> Void) : Void
	{
		eventDispatcher.addEventListener(event, handler);
	}
	
	public static function RemoveEvent(event : String, handler : Dynamic -> Void) : Void
	{
		eventDispatcher.removeEventListener(event, handler);
	}
	
	/*
	 * This is executed when the object is destroyed.
	 * Usually it handles resources and all programmer's set content.
	 * .
	 */
	public static function Destroy() : Void
	{
	}
	
	/*
	 * Clean
	 * .
	 */
	public static function Clean() : Void
	{
	}
	
	/*
	 * Updates the game screen logic.
	 * 
	 * @param gameTime Current game time
	 */
	public static function Update(gameTime:Float) : Void
	{
	}
	
	/*
	 * Handles the event passed from the main.
	 * 
	 * @param event the passed event to be handled.
	 */
	public static function HandleKeyboardEvent(event : KeyboardEvent) : Void
	{
	}
	
	/*
	 * Handles the event passed from the main.
	 * 
	 * @param event the passed event to be handled.
	 */
	public static function HandleMouseEvent(event : MouseEvent) : Void
	{
	}
	
	/*
	 * Handles the event passed from the main.
	 * 
	 * @param event the passed event to be handled.
	 */
	public static function HandleTouchEvent(event : TouchEvent) : Void
	{
		var e : MouseEvent;
	}
	
	/*
	 *
	 */
	private static function TraceScreens(): Void
	{
		trace("/n");
		//for (s in screens)
			//trace(s.GetName() + " " + s.IsActive());
	}
	
	public static function HandleBackButtonPressed(e : Event) : Void
	{
	}
	
	public static function HandleBackButtonReleased(e : Event) : Void
	{
	}
}