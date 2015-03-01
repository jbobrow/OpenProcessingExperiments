
//Design something by using mousePressed() and/or mouseReleased().
int x=0;
int speed=10;
int a;int b;int c;int d;
void setup(){
  size(400,400);
  noStroke();
  frameRate(5);
  smooth();
}

void draw(){
  float f=random(255);
  float g=random(255);
  float h=random(255);
  background(f,g,h);
  fill(255);
  if(b==200){
    fill(255,0,0);
  }
  if(b>200){
    background(0);
  }
  rectMode(CENTER);
  rect(a,200,200,70);
  rect(a,150,100,50);
  ellipse(a-50,240,50,50);
  ellipse(a+50,240,50,50);
  
  myText();
}

void mousePressed(){
  a=a+speed;
}
  
void mouseReleased(){
  if(b<200){
  fill(255);
  ellipse(250,b,50,50);
  rect(250,b+50,50,70);
  rect(200,b+30,30,10);
  rect(300,b+30,30,10);
  rect(230,b+100,10,20);
  rect(270,b+100,10,20);
  fill(0);
  ellipse(240,b-5,10,10);
  ellipse(260,b-5,10,10);
  b=b+speed;
  }
}
  
void myText(){
  if(b==200){
    float f=random(255);
  float g=random(255);
  float h=random(255);
    fill(f,g,h);
  textSize(35);
    text("Oops!",100,50);
  }
}
