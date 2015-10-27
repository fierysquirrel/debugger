package fs.debugger;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.TouchEvent;
import fs.screenmanager.console.Console;
import fs.screenmanager.Debugging;
import fs.screenmanager.events.GameEvent;
import fs.screenmanager.events.GameEvents;
import fs.screenmanager.transitions.Transition;

/**
 * 
 * 
 * @author Henry D. Fernández B.
 */
class Debugger
{
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
	
	
	public static function InitInstance(mainSprite : Sprite): Debugger
	{
		if (instance == null)
			instance = new Debugger(mainSprite);
		
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
	private function new(mainSprite : Sprite) 
	{
		//Event dispatcher
		eventDispatcher = new EventDispatcher();
		//Game Container
		container = new Sprite();
		
		//Adding containers to the main sprite (class Main)
		mainSprite.addChild(container);
		
		eventDispatcher.addEventListener(GameEvents.EVENT_TRACE_SCREENS, HandleEvent);
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
	public static function Destroy()
	{
	}
	
	/*
	 * Clean
	 * .
	 */
	public static function Clean()
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
	public static function HandleEvent(event : GameEvent)
	{
		if (currentScreen != null)
		{
			if(currentScreen.GetName() == event.GetSource() || event.GetSource() == Console.NAME)
				currentScreen.HandleEvent(event);
		}		
	}
	
	/*
	 * Handles the event passed from the main.
	 * 
	 * @param event the passed event to be handled.
	 */
	public static function HandleKeyboardEvent(event : KeyboardEvent) : Void
	{
		if (currentScreen != null)
		{
			if (currentScreen.IsActive())
			{
				switch(event.type)
				{
					case KeyboardEvent.KEY_DOWN:
						currentScreen.HandleKeyDownEvent(event.keyCode);
					case KeyboardEvent.KEY_UP:
						currentScreen.HandleKeyUpEvent(event.keyCode);
				}
			}
		}
	}
	
	/*
	 * Handles the event passed from the main.
	 * 
	 * @param event the passed event to be handled.
	 */
	public static function HandleMouseEvent(event : MouseEvent) : Void
	{
		var e : MouseEvent;
		if (currentScreen != null)
		{
			if (currentScreen.IsActive())
			{
				switch(event.type)
				{
					case MouseEvent.MOUSE_DOWN:
						currentScreen.HandleMouseDownEvent(event);
					case MouseEvent.MOUSE_UP:
						currentScreen.HandleMouseUpEvent(event);
					case MouseEvent.MOUSE_MOVE:
						currentScreen.HandleMouseMoveEvent(event);
					case MouseEvent.CLICK:
						currentScreen.HandleMouseClickEvent(event);
				}
			}
		}
	}
	
	/*
	 * Handles the event passed from the main.
	 * 
	 * @param event the passed event to be handled.
	 */
	public static function HandleTouchEvent(event : TouchEvent) : Void
	{
		var e : MouseEvent;
		if (currentScreen != null)
		{
			if (currentScreen.IsActive())
			{
				switch(event.type)
				{
					case TouchEvent.TOUCH_BEGIN:
						currentScreen.HandleTouchDownEvent(event);
					case TouchEvent.TOUCH_END:
						currentScreen.HandleTouchUpEvent(event);
					case TouchEvent.TOUCH_MOVE:
						currentScreen.HandleTouchMoveEvent(event);
					case TouchEvent.TOUCH_TAP:
						currentScreen.HandleTouchTapEvent(event);
				}
			}
		}
	}
	
	/*
	 *
	 */
	private static function TraceScreens(): Void
	{
		trace("/n");
		for (s in screens)
			trace(s.GetName() + " " + s.IsActive());
	}
	
	public static function HandleBackButtonPressed(e : Event) : Void
	{
		currentScreen.HandleBackButtonPressed(e);
	}
	
	public static function HandleBackButtonReleased(e : Event) : Void
	{
		currentScreen.HandleBackButtonReleased(e);
	}
}