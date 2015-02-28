
float x,y;
void setup(){
size(600,600);
smooth();
strokeWeight(10);
textSize(25);   //sige pont size
x=width/2;
y=height/2;
}
  
void draw(){ 
  
  println(mouseX + " : " + mouseY);
background(0,0,0);
drawclock();
}
void drawclock(){
  fill(255,255,255);
  noStroke();  
  ellipse(x,y,300,300);
  stroke(255,255,255);
  strokeWeight(10);
  noFill();
  ellipse(x,y,500,500);
  drawNumbers();
  strokeWeight(10);
float s_angle=map(second(),0,60,0,TWO_PI);
pushMatrix();
translate(x,y);
rotate(s_angle);
stroke(0); //banel col.or
line(0,0,0,-200);
popMatrix();
float M_angle=map(minute(),0,60,0,TWO_PI);
pushMatrix();
translate(x,y);
rotate(M_angle);
stroke(255,0,61); //banel col.or
line(0,0,0,-100);
popMatrix();
float h_angle=map(hour(),0,60,0,TWO_PI);
pushMatrix();
translate(x,y);
rotate(h_angle);
stroke(168,255,255); // banel col.or (back)
line(0,0,0,-150);
popMatrix();

//another clock
    textAlign(CENTER,CENTER);
  fill(255);
  text(second(),550+(50*cos(x-PI)), 10+(50*sin(y-PI)));
  text(minute(),500+(70*cos(x-PI)), -10+(70*sin(y-PI)));
  text(hour()%12,450+(90*cos(x-PI)), -30+(90*sin(x-PI)));
}
void drawNumbers(){
  float r=190;
  float inc=TWO_PI/12;
  for (int i=1; i<=12; i++){
    float xn=x+cos (i*inc-HALF_PI)*r;
    float yn= y+sin(i*inc-HALF_PI)*r;
    fill(50);
    text(i,xn,yn);
  }}
