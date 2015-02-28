
/* This class is a visualization of both recursion and sin/cos motion on screen.
It examines the depth of field with respect to these properties and the pseudo-
organic motion. 
Danny Capaccio 2009
*/


float angle;
float x;
float y;
float increment;

void setup(){
 size(800,600);
 background(0);
 smooth();
 x = width/2; 
 y = height/2;
 
 increment = 0;
}

void draw(){
 fill(50*increment%PI,50*increment%PI,50*increment%PI, 15);
 //stroke(2*(mouseX % 255));
 //strokeWeight(abs(sin(increment/100)));
 //line(width/2,height/2,x+100*abs(sin(increment)),y+100*abs(cos(increment)));
 drawFractal(x,y,angle,increment,40);
 x = width/2 + 100*cos(angle) + 150*sin(increment/100)*sin(angle);
 y = height/2 + 100*sin(angle) + 150*sin(increment/100)*cos(angle);
 angle+=PI/32;
 increment++;
  
}

void drawFractal(float x, float y, float angle, float inc,int recurse){
  if (recurse == 0){
    
  } else {
    stroke(190,60-recurse*2);
   // noStroke();
    ellipse(x,y,100*sin(recurse/2), 100*cos(recurse/2));
    recurse--;
    drawFractal(x,y,angle,inc,recurse);
   
  }
  
}

