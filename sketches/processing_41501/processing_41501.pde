
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer laser;
AudioPlayer construct;

ArrayList<Square> squares;

boolean mve = false;
  
void setup() { 
  size(700, 400);
  smooth(); 
  frameRate(40);  
   
  m = new Minim(this);
  laser = m.loadFile("laser_1.wav");
  construct = m.loadFile("create.wav");
   
  squares = new ArrayList();
}
  
void draw() {
  
 background(255);

 noStroke();
 fill(0);
 rect(350,200,30,30);
 cursor(CROSS); 
 rectMode(CENTER);

  for (Square s : squares)
  {
    s.show();
  }
  
}
  

void mousePressed() {
  
  if (mouseButton == LEFT) {
    squares.add(new Square(350,200));
    println("Robocop");
    construct.loop(0);

  }

  else if ((mouseButton == RIGHT)&&(squares.size() > 0)) {
    squares.remove(0);
    println("Deconstruction");
  }
}
 
class Square {
 
  float x, y;

  //movement  
  float m1 = 3;
  float m2 = random(PI);
  


  Square(float inX, float inY ) {
    x = inX;
    y = inY;
  }

  void update() {
    
    if(dist(mouseX, mouseY, pmouseX, pmouseY) == 0){
    mve = false;
  }
    
    if(mve == true){
     x = x + (mouseX - x)/100;
     y = y + (mouseY - y)/100;
    }
    
   else if(mve == false){
    x= x + m1*tan(m2);
    y= y + m1*cos(m2);
    m2 = m2 + random(-PI/10.0,PI/10.0);
   }
 //If off screen = true - rect destroyed?
 }

 void show() {
    update();
   
   fill(170,170,170);
   rect(x, y, 10, 10);
 }
}

void mouseMoved() {
 mve = true;
}

void keyPressed() {
  laser.loop(0);
}


