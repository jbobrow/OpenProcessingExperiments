
color b=color(60,60,255);
color w=color(100,100,255);
float a=180;

void setup(){
  size(800,500);
  ellipseMode(CENTER);
  smooth();
  frameRate(36);
}

void draw(){
  background(b);
  
  fill(255,255,0);
  ellipse(cos(radians(a))*300+400,sin(radians(a))*300+400,100,100);
  
  fill(255);
  ellipse(-cos(radians(a))*300+400,-sin(radians(a))*300+400,100,100);
  fill(b);
  noStroke();
  ellipse(-cos(radians(a))*300+410,-sin(radians(a))*300+390,90,90);
  
  fill(0,180,0);
  stroke(0,180,0);
  ellipse(50,430,1200,200);
  ellipse(650,420,1000,250);
  fill(255);
  stroke(0);
  rect(480,260,120,70);
  fill(255,0,0);
  triangle(480,260,600,260,540,210);
  fill(150,100,0);
  rect(500,280,30,50);
  fill(w);
  rect(550,280,30,30);
  a=a+0.5;
  if(a>=360){
    a=0;
  }
  if(a>180){
    b=color(60,60,255);
    w=color(120,120,255);
  }
  else{
    b=color(50);
    w=color(255,255,0);
  }
}

