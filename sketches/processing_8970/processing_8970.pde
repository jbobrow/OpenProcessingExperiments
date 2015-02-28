
import controlP5.*;    // import controlP5 library 
ControlP5 controlP5;   // controlP5 object 

// array to store 6 colors that can be changed by the different 
// user interface element
color [] colors = new color[6];  
 
void setup() { 
  size(600,250); 
  smooth(); 
     
  controlP5 = new ControlP5(this); 
  // load an image ( PNG-8 or JPEG ) as a sprite ( transparancy doesn't seem to work with PNG )
  ControllerSprite bingo = new ControllerSprite(controlP5,loadImage("button.jpg"),150,150);

  
  // description : round turning dial knob
  // parameters  : name, minimum, maximum, default value (float, x, y, diameter
  controlP5.addKnob("knob1",0,360,0,20,70,80); 
  
  // description : a button executes after release
  // parameters  : name, value (float), x, y, width, height
  controlP5.addButton("button1",1,130,100,60,40); 
    // width and height are ignored when attaching a bingobutton
  controlP5.Button b = controlP5.addButton("bingo",100,450,10,100,100);
  // conntent the bingo (image) to the button
  b.setSprite(bingo);
  
   // description : a toggle can have two states, true and false
  //               where true has the value 1 and false is 0.
  // parameters  : name, default value (boolean), x, y, width, height
  controlP5.addToggle("toggle1",false,250,100,30,20); 
  
  // description : a slider is either used horizontally or vertically.
  //               width is bigger, you get a horizontal slider
  //               height is bigger, you get a vertical slider.  
  // parameters  : name, minimum, maximum, default value (float), x, y, width, height
  controlP5.addSlider("slider1",0,255,128,350,50,10,100); 
  controlP5.addSlider("slider2",0,255,128,400,120,50,10);
  
} 
   
void draw() {  
  background(255);  // background white
  
  // draw 6 squares and use as a fill color the colors from the colors array
  for(int i=0;i<6;i++) {        // loop through colors array
    stroke(255); 
    fill(colors[i]);            // use color to fill
    tekenOiliphant(10+(i*100),150);   // draw rectangle
  }   
} 
 
void controlEvent(ControlEvent theEvent) { 
  
   /* events triggered by controllers are automatically forwarded to 
     the controlEvent method. by checking the name of a controller one can 
     distinguish which of the controllers has been changed.
  */ 
 
  /* check if the event is from a controller otherwise you'll get an error
     when clicking other interface elements like Radiobutton that don't support
     the controller() methods
  */
   
  if(theEvent.isController()) {  
     
    print("control event from : "+theEvent.controller().name()); 
    println(", value : "+theEvent.controller().value()); 
    
    if(theEvent.controller().name()=="knob1") { 
      colors[0] = color(255,theEvent.controller().value(),theEvent.controller().value()); 
    } 
     
    if(theEvent.controller().name()=="button1") { 
      colors[1] = colors[1] + color(40,255,40); 
      if(colors[1]>0) colors[1] = color(40,255,40); 
    } 
     
    if(theEvent.controller().name()=="toggle1") { 
      if(theEvent.controller().value()==1) colors[2] = color(150,150,255); 
      else                                 colors[2] = color(255); 
    } 
     
    if(theEvent.controller().name()=="slider1") { 
      colors[3] = color(theEvent.controller().value(),255,255); 
    } 
     
    if(theEvent.controller().name()=="slider2") { 
      colors[4] = color(255,theEvent.controller().value(),255); 
    } 
    if(theEvent.controller().name()=="bingo") { 
      colors[5] = colors[5] + color(255,255,40); 
      if(colors[5]>0) colors[5] = color(255,255,255); 
    }
  }   
} 
 
void tekenOiliphant ( int x, int y)
{ stroke(1);  
    //beine
    //fill(100);
    rect(x+30, y+52, 15, 30);
    rect(x+55, y+52, 15, 30);
    //körper
    //fill(100);
    ellipse(x+50, y+52, 50, 50);
    //ohren
    //fill(255,0,255);
    ellipse(x+40, y+40, 20, 30);
    ellipse(x+60, y+40, 20, 30);
    //rüssel
    //fill(200);
    rect(x+47.5, y+40, 5, 25);
    //kopf
    //fill(200);
    ellipse(x+50, y+40, 25, 25);
    //augen
    fill(255);
    ellipse(x+45, y+35, 6, 6);
    ellipse(x+55, y+35, 6, 6);
    fill(0);
    ellipse(x+47, y+36, 2, 2);
    ellipse(x+54, y+36, 2, 2);
  

   
}

