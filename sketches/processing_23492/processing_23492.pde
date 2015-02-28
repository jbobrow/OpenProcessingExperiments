
int x = 150;
int y = 150;
int eyeSize = 20;

void setup() {
  size(300,300);
  smooth();
}

void draw() {
  x=mouseX;
  y=mouseY;
  background(0);
  noStroke();
  fill(250,0,200);
  ellipseMode(CENTER);
  ellipse(x,y,250,250);//head 
  fill(0,255,200);
  ellipse(x,y,220,220);//head
  rectMode(CENTER);
  fill(250,0,200);
  //rect(150,280,100,40);
  rect(x,y+130,100,40);//neck
  //triangle(5,150,30,120,30,180);//spike
  triangle(x-145,y,x-120,y-30,x-120,y+30);
  //triangle(270,120,270,180,295,150);//spike
  triangle(x+120,y-30,x+120,y+30,x+145,y);
  //triangle(150,5,120,35,180,35);//spike
  triangle(x,y-145,x-30,y-115,x+30,y-115);
  fill(255,255,0);
  //ellipse(100,140,80,120);//left eye yellow
  ellipse(x-50,y-10,80,120);
  //ellipse(200,140,80,120);//right eye yellow
  ellipse(x+50,y-10,80,120);
  fill(255,0,0,200);
  //ellipse(100,140,60,100);//left eye red
  ellipse(x-50,y-10,60,100);
  //ellipse(200,140,60,100);//right eye right
  ellipse(x+50,y-10,60,100);
  fill(255);
  //ellipse(90,125,30,50);//left eye white
  ellipse(x-60,y-25,30,50);
  //ellipse(190,125,30,50);//right eye white
  ellipse(x+40,y-25,30,50);
  fill(0);
  //ellipse(85,120,20,40);//left eye black
  ellipse(x-65,y-30,20,40);
  //ellipse(185,120,20,40);//right eye black
  ellipse(x+35,y-30,20,40);
  fill(0,255,0);
  //rect(150,230,80,20);//mouth
  rect(x,y+80,80,20);
  stroke(0);
  //line(120,230,180,230);//mouth
  line(x-30,y+80,x+30,y+80);
}














