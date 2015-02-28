
int y=0;
void setup(){
  size(300,300);
  background(255,255,0);
  rectMode(CENTER);
}

void draw(){
  background(255,255,0);
  y=mouseY/25;
  line(20,300,20,0);
  line(285,300,285,0);
  fill(0);
  stroke(0);
  for(int x=0;x<320;x=x+15){
    rect(150,x,300,y);
  }
  fill(128);
  triangle(275,mouseY,265,mouseY,270,mouseY-10);
  stroke(255);
  line(270,mouseY-10,270,mouseY-310);
  line(15,300,15,0);
  line(280,300,280,0);
}

