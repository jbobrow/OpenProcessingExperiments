
float x,y;
void setup (){
  size(600,600);
  smooth();
  strokeWeight(15);
  textSize(15);
  x=width/2;
  y=height/2;
}
void draw(){
  background(123);
  drawClock();
}

void drawClock(){
  fill(241,232,95);
  ellipse(x,y,450,450);
  rectMode(CENTER);
  drawNumbers();
  float s_angle = map(second(),0,60,0,TWO_PI);
  pushMatrix();
  translate(x,y);
  rotate(s_angle);
  stroke(63,0,153);
  line(0,0,0,-200);
  popMatrix();
 
  //Minute
  float M_angle=map(minute(),0,60,0,2*PI);
  pushMatrix();
  translate(x,y);
  rotate(M_angle);
  stroke(random(255), random(255), random(255), random(255));
  line(0,0,0,-200);
  popMatrix();
 
  //Hour
  float h_angle = map(hour(),0,12,0,2*PI);
  pushMatrix();
  translate(x,y);
  rotate(h_angle);
  stroke(242,203,97);
  line(0,0,0,-150);
  popMatrix();
}
 void drawNumbers(){
   float r=190;
   float inc = TWO_PI/12;
   for (int i=1; i<=12; i++){
  float xn=x+cos(i* inc-HALF_PI)*r;
  float yn=y+sin(i*inc-HALF_PI)*r;
  fill(0);
  text(i,xn,yn);
   }
    //Ellipse
  rectMode(CENTER);
  fill(0, 200, 180);
  
  rect (x+357*sin(second()*TWO_PI/60.0), y-270*cos(second()*TWO_PI/60.0),50 , 50, 50);
  fill (120 ,255, 130);
  }
   

