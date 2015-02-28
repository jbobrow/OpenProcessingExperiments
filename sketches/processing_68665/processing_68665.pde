
// Homework #3, 48-757, 11:30AM
// Copyright M. Yvonne Hidle
// M. Yvonne Hidle
// yvonnehidle@gmail.com


//variables
float x, y, rectW, rectH,movingX,movingY;


void setup() {
  //general parameters
  size(400, 400);
  smooth();
  frameRate(5);
  colorMode(RGB, width+100);

  //variables starting
  x = 0;
  y = 0;
  rectW = width/7;
  rectH = width/7;
  movingX = 0;
  movingY = 0;
}


void draw() {
  //random squares
  stroke(width+100);
  strokeWeight(4);

  //row 1
  fill(500, width, pmouseX-10);
  rect(x, y, rectW, rectH);
  fill(500, width, pmouseX+20);
  rect(x+rectW, y, rectW, rectH);
  fill(500, width, pmouseX-30);
  rect(x+rectW*2, y, rectW, rectH);
  fill(500, width, pmouseX+40);
  rect(x+rectW*3, y, rectW, rectH);
  fill(500, width, pmouseX-50);
  rect(x+rectW*4, y, rectW, rectH);
  fill(500, width, pmouseX+60);
  rect(x+rectW*5, y, rectW, rectH);
  fill(500, width, pmouseX-70);
  rect(x+rectW*6, y, rectW, rectH);

  //row 2
  fill(500, width, mouseY-10);
  rect(x, y+rectH, rectW, rectH);
  fill(500, width, mouseY+20);
  rect(x+rectW, y+rectH, rectW, rectH);
  fill(500, width, mouseY-30);
  rect(x+rectW*2, y+rectH, rectW, rectH);
  fill(500, width, mouseY+40);
  rect(x+rectW*3, y+rectH, rectW, rectH);
  fill(500, width, mouseY-50);
  rect(x+rectW*4, y+rectH, rectW, rectH);
  fill(500, width, mouseY+60);
  rect(x+rectW*5, y+rectH, rectW, rectH);
  fill(500, width, mouseY-70);
  rect(x+rectW*6, y+rectH, rectW, rectH);

  //row 3
  fill(500, width, mouseX+10);
  rect(x, y+rectH*2, rectW, rectH);
  fill(500, width, mouseX-20);
  rect(x+rectW, y+rectH*2, rectW, rectH);
  fill(500, width, mouseX+30);
  rect(x+rectW*2, y+rectH*2, rectW, rectH);
  fill(500, width, mouseX-40);
  rect(x+rectW*3, y+rectH*2, rectW, rectH);
  fill(500, width, mouseX+50);
  rect(x+rectW*4, y+rectH*2, rectW, rectH);
  fill(500, width, mouseX-60);
  rect(x+rectW*5, y+rectH*2, rectW, rectH);
  fill(500, width, mouseX+70);
  rect(x+rectW*6, y+rectH*2, rectW, rectH);

  //row 4
  fill(500, width, pmouseY+10);
  rect(x, y+rectH*3, rectW, rectH);
  fill(500, width, pmouseY-20);
  rect(x+rectW, y+rectH*3, rectW, rectH);
  fill(500, width, pmouseY+30);
  rect(x+rectW*2, y+rectH*3, rectW, rectH);
  fill(500, width, pmouseY-40);
  rect(x+rectW*3, y+rectH*3, rectW, rectH);
  fill(500, width, pmouseY+50);
  rect(x+rectW*4, y+rectH*3, rectW, rectH);
  fill(500, width, pmouseY-60);
  rect(x+rectW*5, y+rectH*3, rectW, rectH);
  fill(500, width, pmouseY+70);
  rect(x+rectW*6, y+rectH*3, rectW, rectH);

  //row 5
  fill(500, width, mouseX-10);
  rect(x, y+rectH*4, rectW, rectH);
  fill(500, width, mouseX+20);
  rect(x+rectW, y+rectH*4, rectW, rectH);
  fill(500, width, mouseX-30);
  rect(x+rectW*2, y+rectH*4, rectW, rectH);
  fill(500, width, mouseX+40);
  rect(x+rectW*3, y+rectH*4, rectW, rectH);
  fill(random(width+100), random(width+100), 500);
  rect(x+rectW*4, y+rectH*4, rectW, rectH);
  fill(500, width, mouseX+60);
  rect(x+rectW*5, y+rectH*4, rectW, rectH);
  fill(500, width, mouseX-70);
  rect(x+rectW*6, y+rectH*4, rectW, rectH);

  //row 6
  fill(500, width, mouseY-10);
  rect(x, y+rectH*5, rectW, rectH);
  fill(500, width, mouseY+20);
  rect(x+rectW, y+rectH*5, rectW, rectH);
  fill(500, width, mouseY-30);
  rect(x+rectW*2, y+rectH*5, rectW, rectH);
  fill(500, width, mouseY+40);
  rect(x+rectW*3, y+rectH*5, rectW, rectH);
  fill(500, width, mouseY-50);
  rect(x+rectW*4, y+rectH*5, rectW, rectH);
  fill(500, width, mouseY+60);
  rect(x+rectW*5, y+rectH*5, rectW, rectH);
  fill(500, width, mouseY-70);
  rect(x+rectW*6, y+rectH*5, rectW, rectH);

  //row 7
  fill(500, width, pmouseX+10);
  rect(x, y+rectH*6, rectW, rectH);
  fill(500, width, pmouseX-20);
  rect(x+rectW, y+rectH*6, rectW, rectH);
  fill(500, width, pmouseX+30);
  rect(x+rectW*2, y+rectH*6, rectW, rectH);
  fill(500, width, pmouseX-40);
  rect(x+rectW*3, y+rectH*6, rectW, rectH);
  fill(500, width, pmouseX+50);
  rect(x+rectW*4, y+rectH*6, rectW, rectH);
  fill(500, width, pmouseX-60);
  rect(x+rectW*5, y+rectH*6, rectW, rectH);
  fill(500, width, pmouseX+70);
  rect(x+rectW*6, y+rectH*6, rectW, rectH);

  //random quad
  strokeWeight(random(4));
  strokeJoin(BEVEL);
  fill(500, random(width+100), random(width+100));
  quad(
  random(rectW*4,rectW*5),random(rectH*4,rectH*5),
  random(rectW*4,rectW*5),random(rectH*4,rectH*5),
  random(rectW*4,rectW*5),random(rectH*4,rectH*5),
  random(rectW*4,rectW*5),random(rectH*4,rectH*5));
  
  //frameCount
  fill(500);
  text("#" + frameCount,rectW*5.4,rectH*4.6);
}

