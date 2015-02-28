


void setup() {
  size (500,500);
  smooth();
}

void draw () {
  int x=mouseX;
  int y=mouseY;
  background(127);

  rectMode(CENTER);
  fill(250,200,250);
  rect(x,y,90,70);//face
  fill(0);
  noStroke();
  rect(x-17,y-10,17,5);//lift eye
  fill(0);
  rect(x+17,y-10,17,5);//right eye
  fill(255);
  rect(x,y+15,17,10);
  stroke(0);
  rectMode(CORNER);
  fill(250,200,250);
  rect(x+53,y+20,15,15);
  fill(250,200,250);
  rect(x+50+25,y+25,10,10);
}


