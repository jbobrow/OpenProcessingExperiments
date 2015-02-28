
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/50768*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

//import processing.serial.*;
//Serial myPort;
//import fullscreen.*;
//FullScreen fs;

Circles [] array_circles; 
int numCircles, fallCircles;

PImage Tree;
PImage Back;

color active; 

void setup() {

 // fs = new FullScreen(this); 
 // fs.enter(); 

 // println(Serial.list());
// myPort = new Serial(this, Serial.list()[0], 9600);
 // myPort.bufferUntil('\n');

  size(500, 500);
  
  Back = loadImage ("Back.jpg");
  Tree = loadImage("tree.png"); 
  smooth();
  noStroke();

  int active;

  array_circles = new Circles [2000000]; 
  numCircles = 0; 

  for (int i = 0;i < 2000000;i++) {
    array_circles[i] = new Circles();
  }
}


void draw() {
  background(255);
  imageMode(CENTER);
  image(Tree, 250, 250); 

  for (int i = 0;i < fallCircles;i++) { 
      array_circles[i].fall();
    }

    for (int i = 0;i < numCircles;i++) { 
      array_circles[i].show();
    }
if (keyPressed==true){
  if (key == 'b'){
    array_circles[numCircles].create(random(37,460),random (10,300), active); 
      numCircles++;
    }
    if(key =='c'){
      fallCircles = numCircles;
    }


}
println(mouseX);
println(mouseY);
}





class Circles {

  float x, y;
  color color_new;
  float fallLevel=0;
  boolean nofall = false;

  void create(float posx, float posy, color col) {
    x = posx;
    y = posy;
    color_new = color(random(190,255), random(40,170), random(40,150));
  }

  void show() {
    if (nofall == false) {
      fill (color_new);
      ellipse(x + random(2), y + random(5), 10, 10);
    }
  }

  void fall() {
    if (y<730) 
    {
      fill (color_new, random(70, 90)); //random transperancy while falling
      ellipse(x + random(10), y + random(10)-12, 7, 7); 
      y = y + fallLevel; 
      x = x + random(-10, 10);
      fallLevel+=0.2;
    } 
    else {
      nofall = true;
    }
  }

}

