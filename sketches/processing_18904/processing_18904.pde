
void setup(){
 size(300,300);
 smooth();
 background(255,255,255);
frameRate(30);
}
int x=0;
void draw(){
  background(255,255,255);
  fill(250,250,70);
  noStroke();
  ellipse(width/2,height/2,50,50);
  x++;
if(x>100){
  noStroke();
  fill(x,100,200);
  ellipse(width/2,height/2,50,50);
  x++;
}
if(x>150){
  fill(150-x);
  ellipse(width/2+(x-150),height/2+(x-150),50,50);
  ellipse(width/2-(x-150),height/2+(x-150),50,50);
  ellipse(width/2+(x-150),height/2-(x-150),50,50);
  ellipse(width/2-(x-150),height/2-(x-150),50,50);
  x++;
}
if(x>200){
  stroke(200-x);
  strokeWeight(8);
 line(width/2+(x-150),height/2+(x-150),width/2,height/2);
  line(width/2-(x-150),height/2+(x-150),width/2,height/2);
  line(width/2+(x-150),height/2-(x-150),width/2,height/2);
  line(width/2-(x-150),height/2-(x-150),width/2,height/2);
  x++;
}
if(x>300){
rectMode(CENTER);
noStroke();
fill(300-x);
rect(width/2,height/2,width/2,height/2);
x++;
}
if(x>400){
  fill(255,255,255);
  rect(width/2,height/2,width,height);
}
}
void mousePressed(){
x=0;
x++;
}

