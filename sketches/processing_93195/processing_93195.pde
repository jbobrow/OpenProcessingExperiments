
import processing.pdf.*;
import controlP5.*;

boolean stopper = false;

int numCircles = 20;
float increment = 16;
int counter = 0;
int x1 = 0;
int y1 = 0;



PShape instance;


int myColor = color(0,0,0);

void setup()
{
//beginRecord(PDF, "output.pdf");
size(800, 800); 
background(180);

noFill();
smooth();
strokeWeight(3);

}


void draw()
{
smooth();


float x2 = random(16,48);
float y2 = random(16,48);

float x3 = random(90,120);
float y3 = random(100,120);

float x4 = random(-150,-50);
float y4 = random(0,150);

if ( stopper == false ) {
for(int a = numCircles; a > 0; a--)
{
  
increment = random(4,20);

beginShape();
fill(random(255), random(32), random(32));
noStroke();
//s = createShape();
//s.fill(128,128,128);
//s.noStroke();
//fill(random(255), random(255), random(255));
arc(width/2 + x1, height/2 + y1, a*increment, a*increment, PI, PI*1.5); 
arc(width/2 + x2, height/2 + y2, a*increment, a*increment, PI*1.5, PI * 2);
arc(width/2 + x3, height/2 + y3, a*increment, a*increment, 0,  PI / 2.0); 
arc(width/2 + x4, height/2 + y4, a*increment, a*increment, PI /2.0, PI); 


noStroke();
float angle=TWO_PI/360;

//for(int i=180; i < 270; i++)
//{
//vertex(width/2 + a*increment*sin(angle*i)/2, height/2 + a*increment*cos(angle*i)/2);
//} 

vertex(width/2 + (a*increment*sin(PI) + x1)/2, height/2 + (a*increment*cos(PI) + y1)/2);
vertex(width/2 + (a*increment*sin(PI))/2 + x2, height/2 + (a*increment*cos(PI) )/2 + y2);

//arc(width/2 + x2, height/2 + y2, a*increment, a*increment, PI*1.5, PI * 2);


vertex(width/2 - (a*increment*sin(PI*1.5))/2 + x2 , height/2 + y2);
vertex(width/2 - (a*increment*sin(PI*1.5))/2 + x3, height/2 + y3);

//arc(width/2 + x3, height/2 + y3, a*increment, a*increment, 0,  PI / 2.0); 
vertex(width/2 + x3 , height/2 + (a*increment*cos(PI*2))/2 + y3);
vertex(width/2 + x4, height/2 + (a*increment*cos(PI*2))/2 + y4);

//arc(width/2 + x4, height/2 + y4, a*increment, a*increment, PI /2.0, PI); 
vertex(width/2 - (a*increment*sin(PI/2))/2 + x4 , height/2 + y4);
vertex( width/2 - (a*increment*sin(PI/2))/2 + x1, height/2 + y1);


counter++;
increment = increment * 1.05;
//strokeWeight(3 - a*0.2);
endShape(CLOSE);

}
}
stopper = true;
//noLoop();
//println(counter);

//endRecord();
}



