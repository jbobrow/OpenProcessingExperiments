

import controlP5.*;
ControlP5 controlP5;

void setup() {
  size(450,700);
  smooth();
    
  controlP5 = new ControlP5(this);
  
  // load an image ( PNG-8 or JPEG ) as a sprite ( transparancy doesn't seem to work with PNG )
  ControllerSprite plattenspieler = new ControllerSprite(controlP5,loadImage("plattenspieler.jpg"),400,600);
  
  // description : a button executes after release
  // parameters  : name, value (float), x, y, width, height
  // width and height are ignored when attaching a sprite
  controlP5.Button b = controlP5.addButton("play",100,20,40,100,100);
   
  // conntent the sprite (image) to the button
  b.setSprite(plattenspieler);    
  
  // if you want to use the same sprite again, on another button
  b = controlP5.addButton("stop",100,20,800,400,100);
  b.setSprite (plattenspieler);
}

void draw() {
  background(255); //  background
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isController()) { 
    print("control event from : "+theEvent.controller().name());
    println(", value : "+theEvent.controller().value());
  }
}

