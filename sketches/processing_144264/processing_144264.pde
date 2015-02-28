
//Konkuk University
//SOS iDesign
  
//Name: choi in seo
//ID: 201420113

float xW = 50;
float direction = 1;
  





float x,y;
void setup (){
  size(600,600);
  smooth();
  strokeWeight(5);

  textSize(25);
  x=width/2;
  y=height/2;
  
  
  
  
    size(600,600);
  background(68,515,52);
  background(308.8,152.75,500.95);
  background(599.25,439.45,0);
  background(308.8,152.75,500.95);
//  noLoop();
}


void draw(){
  background(95);
  drawClock();
}
 
void drawClock(){

  
  fill(255,0,20);
  stroke(random(0), random(250), random(450), random(255));
  ellipse(x,y,450,450);
  rectMode(CENTER);
  rect(x,y,500,500);
fill(255,193,158);
   fill(241,95,95);
  ellipse(x,y,450,450);
  rectMode(CENTER);
  rect(x,y,450,450);
  fill(255,193,158);
  ellipseMode(CENTER);
  ellipse(x,y,420,420);
  ellipseMode(CENTER);
  ellipse(x,y,210,210);
  ellipseMode(CENTER);
  ellipse(x,y,200,200);
  ellipseMode(CENTER);
  ellipse(x,y,10,10);
  drawNumbers();
  float s_angle = map(second(),0,60,0,TWO_PI);
 
  pushMatrix();
  translate(x,y);
  rotate(s_angle);
  stroke(random(0), random(250), random(450), random(255));
  line(0,0,0,-200);
  popMatrix();
  float M_angle=map(minute(),0,60,0,2*PI);
  pushMatrix();
  translate(x,y);
  rotate(M_angle);
  stroke(255,187,0);
  line(0,0,0,-200);
  popMatrix();
   float h_angle = map(hour(),0,12,0,2*PI);
  pushMatrix();
  translate(x,y);
  rotate(h_angle);
  stroke(242,203,97);
  line(0,0,0,-100);
  popMatrix();
}
 void drawNumbers(){
   float r=190;
   float inc = TWO_PI/12;
   for (int i=1; i<=12; i++){
  float xn=x+cos(i* inc-HALF_PI)*r;
  float yn=y+sin(i*inc-HALF_PI)*r;
   fill(80);
  text(i,xn,yn);
   }
 }

