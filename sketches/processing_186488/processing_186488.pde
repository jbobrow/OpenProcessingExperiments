
/*------------------------------------
 The Bun Function (with nested for loops)
 Created on 18 February 2015
 by Catherine Lee
 ------------------------------------*/
int a, b, c, d;

void setup () {
  size(600, 600);
  //background(0, 240, 255); //blue background
  background(0, 200, 110); //green background
  rectMode(CENTER);
  noLoop();
  smooth();
}
void draw() {
  for (a=0; a<800; a=a+200) {        //draws rows with 4 buns 
    for (b=0; b<800; b=b+200) {
      bun(a, b);
    }
  }
  translate(100,100);
  for (c=0; c<600; c=c+200) {        //draws rows with 3 buns
    for (d=0; d<600; d=d+200)
      bun(c, d);
  }
}


void bun(int x, int y) {
  noStroke(); 
  fill(255);
  rect(x, y, 80, 50, 4); //head
  rect(x-31.5, y-35, 16.5, 30, 5); //left ear
  rect(x+31.5, y-35, 16.5, 30, 5); //right ear
  fill(0);
  rect(x-20, y, 14, 2); //left eye
  fill(0);
  rect(x+20, y, 14, 2); //right eye

  fill(250, 100, 0);
  rect(x-32, y-33.5, 8, 19, 2); //left ear orange
  fill(250, 100, 0);  
  rect(x+31.5, y-33.5, 8, 19, 2); //right ear orange

  stroke(1.5);
  line(x-5, y+17, x, y+12); //left side of mouth
  line(x, y+12, x+5, y+17); //right side of mouth

  fill(250, 100, 100);
  noStroke();
  ellipse(x-27, y+9, 15, 7);   //cheek blush left
  fill(250, 100, 100);
  ellipse(x+27, y+9, 15, 7);   //cheek blush right
  fill(250, 100, 100);
  triangle(x-5, y+8, x, y+12, x+5, y+8); //nose
}
