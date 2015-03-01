
/*------------------------------------
The Bun Function
Created on 14 February 2015
by Catherine Lee
------------------------------------*/

void setup () {
  size(600, 600);
  //background(0, 240, 255); //blue background
  background(0, 200, 110); //green background
  rectMode(CENTER);
  noLoop();
  smooth();
}
void draw() {
  bun(0,0);        //row 1
  bun(200,0);
  bun(400,0);
  bun(600,0);
  
  bun(100, 100);   //row 2
  bun(300, 100);
  bun(500,100);

  bun(0, 200);      //row 3
  bun(200, 200); 
  bun(400, 200);
  bun(600,200);

  bun(100, 300);     //row 4
  bun(300, 300); 
  bun(500, 300);
  
  bun(0,400);      //row 5
  bun(200,400);
  bun(400,400);
  bun(600,400);
  
  bun(100,500); //row 6
  bun(300,500);
  bun(500,500);
  
  bun(0,600); //row 7
  bun(200,600);
  bun(400,600);
  bun(600,600);
}
void bun(int x, int y) {
  noStroke(); 
  fill(255);
  rect(x, y, 80, 50,4); //head
  rect(x-31.5, y-35, 16.5, 30,5); //left ear
  rect(x+31.5, y-35, 16.5, 30,5); //right ear
  fill(0);
  rect(x-20, y, 14, 2); //left eye
  fill(0);
  rect(x+20, y, 14, 2); //right eye

  fill(250, 100, 0);
  rect(x-32, y-33.5, 8, 19,2); //left ear orange
  fill(250, 100, 0);  
  rect(x+31.5, y-33.5, 8,19,2); //right ear orange

  stroke(1.5);
  line(x-5, y+17, x, y+12); //left side of mouth
  line(x, y+12, x+5, y+17); //right side of mouth
  
  fill(250,100,100);
  noStroke();
  ellipse(x-27,y+9,15,7);   //cheek blush left
  fill(250,100,100);
  ellipse(x+27,y+9,15,7);   //cheek blush right
  fill(250,100,100);
  triangle(x-5,y+8, x,y+12, x+5,y+8); //nose
}

