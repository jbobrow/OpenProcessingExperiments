
import processing.pdf.*;

float x,y;
float angle = 200;
float r = 20;
float diff = 1;
float a = 200;

void setup() {
  size(600,600);
  background(153,102,102);
}

void draw(){
  
x = r*cos(angle);
y = r*sin(angle);

//triangle

stroke(0,255,255);
strokeWeight(0.1);

noFill();

translate(300,300);
rotate(r);


triangle(0,x,y,0,x/2,y/2);


//rect

stroke(0,0,0);
strokeWeight(0.2);

noFill();

translate(300,300);
rotate(r);

rect(0,0,x,y);



angle = angle + a;
r = r - diff;

if(r == 0||r==350){
  diff = diff*-1;
}

}
