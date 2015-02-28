
float x,y;
void setup(){
size(600,600);
smooth();
strokeWeight(3);
textSize(25);   //sige pont size
x=width/2;
y=height/2;
}
void draw(){
background(255,0,255);
drawclock();

noStroke();
ellipse (x,y, 25, 25);
}
void drawclock(){
  
  fill(1);
  ellipse(235,235,50,50);
  ellipse(365,235,50,50);
  triangle(250,350,350,350,300,400);
  
  fill(1);
  ellipse(300,300,50,50);
  
  fill(mouseX,100,mouseY,100);
  ellipse(x,y,500,500);
  ellipse(x,y,540,540);
  ellipse(x,y,560,560);
  
  drawNumbers();
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
stroke(204,61,61); //banel col.or
line(0,0,0,-100);
popMatrix();
float h_angle=map(hour(),0,60,0,TWO_PI);
pushMatrix();
translate(x,y);
rotate(h_angle);
stroke(200,30,30); // banel col.or (back)
line(0,0,0,-150);
popMatrix();
}
void drawNumbers(){
  float r=190;
  float inc=TWO_PI/12;
  for (int i=1; i<=12; i++){
    float xn=x+cos (i*inc-HALF_PI)*r;
    float yn= y+sin(i*inc-HALF_PI)*r;
    fill(200);
    text(i,xn,yn);
    
 
noStroke();
fill(255);
ellipse(240,230,10,10);
ellipse(370,230,10,10);
  }}
