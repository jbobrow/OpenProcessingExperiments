
int x=0;
int speed=4;
void setup(){
  size(400,400);
  background(7,29,112);
  strokeWeight(4);
  noFill();
  stroke(60,157,216);
  ellipse(120,100,70,70);
  stroke(255, 242, 0);
  ellipse(160,135,70,70);
  stroke(0);
  ellipse(200,100,70,70);
  stroke(0, 189, 57);
  ellipse(240,135,70,70);
  stroke(251, 0, 13);
  ellipse(280,100,70,70);
  smooth();
  noStroke();
   
}
void draw(){
  torch();
}
void torch(){
fill(7,29,112);
rect(0,200,400,200);
frameRate(30);
fill(255,192,64);
ellipse(x,300,20,20);
fill(191,151,48);
triangle(x-10,300,x+10,300,x,400);
fill(255,192,64);
triangle(x,250,x-10,300,x+10,300);
fill(255,10,0);
triangle(x,260,x-10,300,x+10,300);
fill(255,137,0);
triangle(x,270,x-10,300,x+10,300);
fill(255,192,64);
triangle(x,280,x-10,300,x+10,300);
x=x+speed;
if ((x<0)||(x>=400)){
speed=speed*-1;
}
}

