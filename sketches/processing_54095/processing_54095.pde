
class Circle {
  
PVector location;
float r;
float theta;
float x;
float y;

Circle(float xpos,float ypos,float R,float T){
  r=R;
  theta=T;
  x = xpos;
  y = ypos;
}
 void move(){
  x = r * cos(theta);
  y = r * sin(theta);
  theta+=0.5;
 }
 void display(){
  stroke(1);
  strokeWeight(0.5);
  fill(0,54,99);
  ellipse(x+width/4, y+height/3, x,x);
  fill(#C4C5B5,20);
  ellipse(x+width/4, y+height/3, x-50,x-50);

  ellipse(x+width*3/4, y+height*2/3, x,x);
  fill(206,200,2,80);
  ellipse(x+width*3/4, y+height*2/3, x-50,x-50);
  strokeWeight(0.1);
  line(x+width/4, y+height/3,x+width*3/4, y+height*2/3);
 

 }
}  

  /*float angle = 0;			

void setup() {
  size(200,200);
  smooth();
}

void draw() {
  background(50);

  fill(175);
  stroke(255);
  rectMode(CENTER);
  translate(width/2,height/2);
  rotate(angle);
  line(-50,0,50,0);
  ellipse(50,0,8,8);
  ellipse(-50,0,8,8);

  angle += 0.05;
}
*/

