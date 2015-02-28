

BaseWave w; 
BaseWave zoo;
/*
import controlP5.*;

ControlP5 cp5;
ControlTimer c;
Textlabel t;
*/
void setup() {
  
size(800,600); 
background(0); 
w = new BaseWave(height / 4);
zoo = new BaseWave(height / 2); 
/*
cp5 = new ControlP5(this);
  c = new ControlTimer();
  t = new Textlabel(cp5,"--",100,100);
  c.setSpeedOfTime(1);
  */
} 

void draw() {
  
  w.update();
  w.display();
  
  /*
   t.setValue(c.toString());
  t.draw(this);
  t.setPosition(40, 400);
  */ 
}


import ddf.minim.*;
import ddf.minim.ugens.*;

class BaseWave {
  
  
Minim minim;
AudioOutput out;

//time
float i; 
//speed of waves
float a; 
float b; 
float c; 
//locations
float x; 
float y; 
//PVector ; 
float directionx; 
float directiony; 

BaseWave(float tempy) { 
  
  //funtion
  i = 2; 
  a = 0; 
 b = 1;
 c = 0;  
 x = 10; 
 y = tempy;
 directionx = 1;
 directiony = 0; 
 minim = new Minim(this);
 out = minim.getLineOut();
  // end funtion
}

// methods

void display() {
 float bulge = 20;
 //original 50
 float timeB = 1; 
  strokeWeight(4);
  stroke(255);
  


   point(x, y);  
   y = map(sin(a)*sin(c*2.3)*sin(b*0.6)*sin(b*0.3), -1, 1, 100, bulge);
   //value to be converted, lower bound of current range, 
   //upper bound of current range, lower bound of target range 
   // upper bound of target range
  x = x + directionx; 
  a = a + .06; //speed 
  b = b + .03; //rate of bulge
  c = c + .64;  //original 64
  
  bulge = bulge + timeB; 
  if(bulge > 75 || bulge < -25) { 
    timeB *= - 1;
  }
  
if(x > width - 10 || x < 5) { 
  noFill();
  stroke(#85DFE8);
  ellipse(x, y, 20, 20);
  //x,y,w,h
  directionx *= -1;    
}
 
  //end 
} 

void update() {
   
 
  float timer = 1; 
  float x1 = x;
  float x2 = x;
  float y1 = y;
  float y2 = y + height/4;
 
 
 
  i = i + timer; 
  
  if(i > 100) {
    i = 0;
  }
  
  if( i == 20 || i == 80) {

  strokeWeight(0.5);
  stroke(#85DFE8);
  line(x1, y1, x2, y2);
  //x1,y1,x2,y2
  noFill();
  ellipse(x2, y2, 30, 30);
  //x, y, w, h
  println(y2);
  if (y2 < 230) {
    out.playNote( "C3" );
  }
  if (y2 > 230) { 
    out.playNote( "E3" );
  }
    if (y2 < 215) { 
    out.playNote( "G3" );
  }
  
 
  }
  // println(i);
  // println(timer);
  //end
} 
     
  //end class
}


