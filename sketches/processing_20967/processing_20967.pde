
int i=0;
int x=0;
int y=0;
int frame=0;
void setup() {
  size(500,500);
  background(154,241,250);
  frameRate(5);
}
void draw() {
  strokeWeight(1);
stroke(95,105,106);
  line(i,0,i,500);
  strokeWeight(2);
  stroke(89,120,124);
  line(i,0,i,500);
  i=i+30;
  strokeWeight(4);
  stroke(65,125,131);
  line(i,0,i,500);
  i=i+20;
  strokeWeight(1.25);
  stroke(64,45,29);
  noFill();
  ellipse(0,y,30,30);
  ellipse(x,0,30,30);
  ellipse(60,y,30,30);
  ellipse(x,60,30,30);
  ellipse(120,y,30,30);
  ellipse(x,120,30,30);
  ellipse(180,y,30,30);
  ellipse(x,180,30,30);
  ellipse(240,y,30,30);
  ellipse(x,240,30,30);
  ellipse(300,y,30,30);
  ellipse(x,300,30,30);
  ellipse(360,y,30,30);
  ellipse(x,360,30,30);
  ellipse(420,y,30,30);
  ellipse(x,420,30,30);
  ellipse(480,y,30,30);
  ellipse(x,480,30,30);
  stroke(85,70,58);
    noFill();
  ellipse(0,y,10,10);
  ellipse(x,0,10,10);
  ellipse(60,y,10,10);
  ellipse(x,60,10,10);
  ellipse(120,y,10,10);
  ellipse(x,120,10,10);
  ellipse(180,y,10,10);
  ellipse(x,180,10,10);
  ellipse(240,y,10,10);
  ellipse(x,240,10,10);
  ellipse(300,y,10,10);
  ellipse(x,300,10,10);
  ellipse(360,y,10,10);
  ellipse(x,360,10,10);
  ellipse(420,y,10,10);
  ellipse(x,420,10,10);
  ellipse(480,y,10,10);
  ellipse(x,480,10,10);
  y=y+20;
  x=x+20;
}


