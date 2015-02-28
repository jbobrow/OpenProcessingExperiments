
/**
 * ControlP5 Image as UI element (SpriteButton) 
 *
 * IMPORTANT !!
 * - ControlerSprite is yet experimental and will undergo
 * - changes and modifications.
 *
 * modified and commented by Kasper Kamperman, 2010 
 * used library version 0.4.6
 * ControlP5 by Andreas Schlegel 
 * http://www.sojamo.de/libraries/controlP5/
 *
 */
 
import controlP5.*;
ControlP5 controlP5;

void setup() {
  size(360,260);
  smooth();
    
  controlP5 = new ControlP5(this);
  
  // load an image ( PNG-8 or JPEG ) as a sprite ( transparancy doesn't seem to work with PNG )
  ControllerSprite sprite = new ControllerSprite(controlP5,loadImage("spritebutton-sprite.jpg"),315,60);
  
  // description : a button executes after release
  // parameters  : name, value (float), x, y, width, height
  // width and height are ignored when attaching a sprite
  controlP5.Button b = controlP5.addButton("play",100,20,40,100,100);
   
  // conntent the sprite (image) to the button
  b.setSprite(sprite);    
  
  // if you want to use the same sprite again, on another button
  b = controlP5.addButton("stop",100,20,140,100,100);
  b.setSprite(sprite);
}

void draw() {
  background(0); // black background
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isController()) { 
    print("control event from : "+theEvent.controller().name());
    println(", value : "+theEvent.controller().value());
  }
}

