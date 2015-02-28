
int fillRed = int(random(0,1600)); 

void setup(){
  size(600,600);
  background(255);
  //stroke(0);
  noStroke();
  noFill();
  rectMode(CENTER);
}

void draw(){
  drawBox(int(random(600)),int(random(600)));
}

void drawBox(int xpos, int ypos){
  //float boxHeight = abs(cos(random(0,2*PI))*20.0);
  int boxHeight = int(random(1,20));
  //float boxWidth = abs(sin(random(0,2*PI))*20.0);
  float boxWidth = random(1,30);
  //println(boxHeight);
  //int newFill = int(random(0,600));
  if(fillRed == int(random(0,1600))) {
    fill(255,0,0,random(255));
  } else {
    fill(random(255),random(255));
  }
  rect(xpos,ypos,boxHeight,boxWidth);
}


