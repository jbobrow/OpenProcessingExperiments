
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
  
  if (mouseButton == LEFT){
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
 }else if (mouseButton == RIGHT){
   fill(0,4);
  rect(0,0,width,height);
  angle +=speed;
  float sinval = sin(angle);
  float cosval = cos(angle);
  float x = 250 + (cosval * radius);
  float y = 250 + (sinval * radius);
  
  fill(149,149,162);
  ellipse(x,y,8,2);  
  float x2 = x + cos(angle*sx) * radius/2;
  float y2 = y + sin(angle*sy) * radius/2;
  fill(209,13,13);
  ellipse(x2,y2,6,6);
  
  float x3 = x + cos(angle*sx) * 100;
  float y3 = y + sin(angle*sy) * 100;
  fill(135,170,183);
  ellipse(x3,y3,6,6);
  
  float x4 = x + cos(angle*sx) * 125;
  float y4 = y + sin(angle*sy) * 125;
  fill(135,183,166);
  ellipse(x4,y4,8,8);
  
  float x5 = x + cos(angle*sx) * 150;
  float y5 = y + sin(angle*sy) * 150;
  fill(139,135,183);
  ellipse(x5,y5,10,10);
  
  float x6 = x + cos(angle*sx) * 175;
  float y6 = y + sin(angle*sy) * 175;
  fill(163,135,183);
  ellipse(x6,y6,12,12);
 
 float x7 = x + cos(angle*sx) * 200;
 float y7 = y + sin(angle*sy) * 200;
 fill(183,135,183);
 ellipse(x7,y7,14,14);
 
 }else{
   fill(46,42,42,50);
  rect(0,0,width,height);
  x= dx*easing;
  y=  dy*easing;
  strokeWeight(4);
  ellipse(random(width),random(height),75,75);
ellipse(random(width),random(height),100,100);
ellipse(random(width),random(height),125,125);   

translate(105,105);
  for(int i=0; i<360; i++){
    rotate(radians(10));
    strokeWeight(.5);
    stroke(random(216),random(72),random(72));
    line(0,0,0,500);
    
     rotate(radians(3));
     strokeWeight(.5);
    stroke(random(135),random(170),random(183));
    line(0,0,0,500);
    
     rotate(radians(6));
     strokeWeight(.5);
    stroke(random(139),random(135),random(183));
    line(0,0,0,500);
  }
  translate(250,300);
  for(int i=0; i<360; i++){
    rotate(radians(10));
    strokeWeight(.5);
    stroke(random(216),random(72),random(72));
    line(0,0,0,500);
    
     rotate(radians(3));
     strokeWeight(.5);
    stroke(random(135),random(170),random(183));
    line(0,0,0,500);
    
     rotate(radians(6));
     strokeWeight(.5);
    stroke(random(139),random(135),random(183));
    line(0,0,0,500);
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

 


