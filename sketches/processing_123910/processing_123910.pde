
import ddf.minim.*;

// Introduction to Computational Arts
// This is the last assignment
// It was fun all the time

//Global Variables
float x, y, px, py;
float easing = 0.25;
String help = "Press: 'c', 'C' for changing color, 's', 'S' for creating a screenshot, DELETE, BACKSPACE for clearing canvas";
PImage back;
Minim minim;
AudioPlayer backsound;
AudioSample colorChanged;

//Setup Function
void setup(){
  size(800,600);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();// Draws all geometry with smooth (anti-aliased) edges
  background(360);
  back = loadImage("back.png");
  minim = new Minim(this);
  backsound = minim.loadFile("project2.wav");
  colorChanged = minim.loadSample("colorchanged.wav");
  backsound.play();
  
  //Instructions
  image(back, 0, 0, 800, 600);
  fill(#FFFCFC);
  textAlign(CENTER);
  text(help, width/2, 20);
  stroke(random(255),random(255),random(255));
  
}

//Draw Function
void draw(){
  
  //work only when mouse i pressed
  //it finds the mouse position and creates a colorful line
  if(mousePressed) {
    
    float targetX = mouseX;
    x += (targetX - x) * easing;
    float targetY = mouseY;
    y += (targetY - y) * easing;
    strokeWeight(random(5,25));
    line(px, py, x, y);
    py = y;
    px = x; 
  
    
  } 
  
}

void keyPressed() {
  switch(key){
    case 's':
    case 'S':
      saveFrame("screenshot.png"); 
      break;
    case DELETE:
    case BACKSPACE:
      image(back, 0, 0, 800, 600);
      fill(#FFFCFC);
      text(help, width/2, 20);
      break;
    case 'c':
    case 'C':
      stroke(random(255),random(255),random(255));
      colorChanged.trigger();
      break;
  }
}



