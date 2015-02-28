


int random;
float x,y;
float dx,dy;
float easing;
 
float speed = 0.05;
float radius = 30.0;
float sx = 100.0;
float sy = 100.0;
 
Circle[] circles;
float offset =20.0;
float scaleVal =25.0;
float angleInc = PI/23.0;
float angle =0.0;
 
void setup(){
  size(500,500);
  noStroke();
  smooth();
   x=0;
  y=0;
  easing= .005;
  circles = new Circle[1200]; 
  for(int i = 0; i < 1200; i++){
    circles[i] = new Circle(random(5,height),random(5,width),random(2,20));
}
}
void draw(){
   
  {
 background(20);
 for(int i = 0; i < 1200; i++){
    circles[i].display();
    circles[i].move();
  }
  fill(40);
for(int y=0; y<=width; y+=5){
  float x =offset + (sin(angle) * scaleVal);
  fill(255);
  rect(x+0,y,2,4);
  rect(x+50,y,2,4);
  rect(x+100,y,2,4);
  rect(x+150,y,2,4);
  rect(x+200,y,2,4);
  rect(x+250,y,2,4);
  rect(x+300,y,2,4);
  rect(x+350,y,2,4);
  rect(x+400,y,2,4);
  rect(x+450,y,2,4);
  x= offset + (cos(angle) * scaleVal);
  fill(0);
  rect(x+0,y,2,4);
  rect(x+50,y,2,4);
  rect(x+100,y,2,4);
  rect(x+150,y,2,4);
  rect(x+200,y,2,4);
  rect(x+250,y,2,4);
  rect(x+300,y,2,4);
  rect(x+350,y,2,4);
  rect(x+400,y,2,4);
  rect(x+450,y,2,4);
  angle +=angleInc;
 } 
 } {
   
  float sinval = sin(angle);
  float cosval = cos(angle);
  float x = 250 + (cosval * radius);
  float y = 250 + (sinval * radius);
   
  
  
 }{
   
 

  
  translate(250,300);
  for(int i=0; i<360; i++){
    rotate(radians(10));
    strokeWeight(.5);
    stroke(random(216),random(72),random(72));
   
     
    
  }
 }
}
 class Circle {
  float x,y,diameter, ysp, xsp, gravity, friction;
    
  Circle(float xpos, float ypos, float dia){
    x = xpos;
    y = ypos;
    diameter = dia;
    friction = random(-1.5,-0.9);
    gravity = random(0.01,1);
  
  }
    
  void display(){
    fill(random(160), random(137), random(167));
    ellipse (x,y,diameter, diameter);
  }
    
  void move(){
    ysp += gravity;
    x += xsp;
    y += ysp;
    if (y > 500){
      ysp*=friction;
    }
    if (x<0 ){
      xsp*=friction;
    }
     
  }
}


