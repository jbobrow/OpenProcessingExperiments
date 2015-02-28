
/*
Coded by Davide Riboli in aug 2012
[learning to use the ControlP5 lib]
 http://blog.riboli.org
 */

/*
Import P5
 http://www.sojamo.de/libraries/controlP5
 */
import controlP5.*;
ControlP5 controlP5;

/*
Variables controlled by sliders
Everything you need to control
must be declared "public"
 */
public int RectR = 50;
public int RectG = 80;
public int RectB = 100;
public int RectAlpha = 100;
public int CircleR = 100;
public int CircleG = 50;
public int CircleB = 80;
public int CircleAlpha = 100;
public int RectNumb = 10;
public int CircleNumb = 10;

/*
The one I need to
switch back to initial test img
 */
public int tester = 0;


/*
This will be called by a P5 button
with the same name
 */
public void Tester() {

  tester = 0;
}

/*
The only way I've found to save
just a portion of an image.
Kinky, but working.
 */
public void Save() {

  save("Total.png"); //Save all
  PImage img = loadImage("Total.png"); //Load image just saved
  PImage myImage = img.get(241, 0, 399, 480); //Crop it
  myImage.save("60s.png"); //Save it again
}


//Pattern generator
public void Generator() {

  tester = 1; //need this to erase screen [see void_draw]

  background(110);
  line(240, 0, 240, 480);

  //The generator stuff
  float r = 0;
  float e = 0;
  smooth();
  while (r < RectNumb) { 

    fill(RectR, RectG, RectB, RectAlpha);
    rect(random(250, 550), random(20, 420), random(120), random(120));
    r = r + 1;
  }
  while (e < CircleNumb) {

    fill(CircleR, CircleG, CircleB, CircleAlpha);
    ellipse(random(300, 550), random(20, 420), random(120), random(120));
    e = e + 1;
  }
}


void setup() {

  size(640, 480);

//We need an instance of ControlP5
  controlP5 = new ControlP5(this);

/*
Now the sliders [each of them needs an unique id]
controlP5.addSlider("TAG", minVal, maxVal, VarName, x, y, witdh, height).setId(1);
*/
  controlP5.addSlider("Rect R [0/255]", 0, 255, RectR, 10, 50, 100, 10).setId(1);
  controlP5.addSlider("Rect G [0/255]", 0, 255, RectG, 10, 70, 100, 10).setId(2);
  controlP5.addSlider("Rect B [0/255]", 0, 255, RectB, 10, 90, 100, 10).setId(3);
  controlP5.addSlider("Rect Alpha [0/255]", 0, 255, RectAlpha, 10, 110, 100, 10).setId(4);
  controlP5.addSlider("Rect Number [0/30]", 0, 30, RectNumb, 10, 150, 100, 10).setId(5);
  controlP5.addSlider("Circle Number [0/30]", 0, 30, CircleNumb, 10, 170, 100, 10).setId(6);
  controlP5.addSlider("Circle R [0/255]", 0, 255, CircleR, 10, 210, 100, 10).setId(7);
  controlP5.addSlider("Circle G [0/255]", 0, 255, CircleG, 10, 230, 100, 10).setId(8);
  controlP5.addSlider("Circle B [0/255]", 0, 255, CircleB, 10, 250, 100, 10).setId(9);
  controlP5.addSlider("Circle Alpha [0/255]", 0, 255, CircleAlpha, 10, 270, 100, 10).setId(10);

/*
And now buttons [easier]
Button tag must be the public function name
we want to call with click
*/
  controlP5.addButton("Generator")
    .setValue(0)
      .setPosition(10, 310)
        .setSize(100, 19)
          ;

  controlP5.addButton("Tester")
    .setValue(0)
      .setPosition(120, 310)
        .setSize(100, 19)
          ;

  controlP5.addButton("Save")
    .setValue(0)
      .setPosition(10, 350)
        .setSize(100, 19)
          ;
}

void draw() {

  if (tester==0) { //need this to switch b'tween gen and test

    background(110);
    line(240, 0, 240, 480);
    fill(RectR, RectG, RectB, RectAlpha);
    rect(400, 60, 200, 200);
    fill(CircleR, CircleG, CircleB, CircleAlpha);
    ellipse(400, 260, 200, 200);
  }
}

/*
Events triggered by controllers are automatically forwarded to
the controlEvent method; by checking the id of a controller one
can distinguish which of the controllers has been changed.
 */
void controlEvent(ControlEvent theEvent) {

  switch(theEvent.controller().id()) {

    case(1): // controller slider id 1    
    RectR = (int)(theEvent.controller().value());
    break; 

    case(2):
    RectG = (int)(theEvent.controller().value());
    break; 

    case(3):
    RectB = (int)(theEvent.controller().value());
    break;

    case(4):
    RectAlpha = (int)(theEvent.controller().value());
    break;

    case(5):
    RectNumb = (int)(theEvent.controller().value());
    break;

    case(6):
    CircleNumb = (int)(theEvent.controller().value());
    break;

    case(7):
    CircleR = (int)(theEvent.controller().value());
    break;

    case(8):
    CircleG = (int)(theEvent.controller().value());
    break;

    case(9):
    CircleB = (int)(theEvent.controller().value());
    break;

    case(10):
    CircleAlpha = (int)(theEvent.controller().value());
    break;
  }
}

