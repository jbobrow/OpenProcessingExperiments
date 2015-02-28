
/* @pjs preload= "sea.jpg"; */

void setup() { 

  size(700, 700);
  noStroke();
  /*
  PImage img;
   img = loadImage("sea.jpg");
   image(img, 0, 0);
   */
  frameRate(30);
}


void draw() { 

  //background(#A0DFE5);


  PImage img;
  img = loadImage("sea.jpg");
  image(img, 0, 0);


  //fish

  fill(#495CB9);
  beginShape();
  vertex(mouseX, mouseY);
  vertex(mouseX+10, mouseY+10);
  vertex(mouseX+30, mouseY-10);
  vertex(mouseX+60, mouseY-10);
  vertex(mouseX+70, mouseY);
  vertex(mouseX+70, mouseY+20);
  vertex(mouseX+60, mouseY+30);
  vertex(mouseX+30, mouseY+30);
  vertex(mouseX+10, mouseY+10);
  vertex(mouseX, mouseY+20);
  endShape(CLOSE);

  fill(#FFEE8B);
  beginShape();
  vertex(mouseX+20, mouseY);
  vertex(mouseX+30, mouseY-10);
  vertex(mouseX+60, mouseY-10);
  vertex(mouseX+50, mouseY+10);
  vertex(mouseX+40, mouseY-10);
  vertex(mouseX+30, mouseY+10);
  endShape(CLOSE);

  //bubbles

  float x = random(0, 50);
  float y = random(0, 100);
  float xp = random(0, 700);


  fill(#FFFFFF, 60);
  ellipse( xp, mouseY, x, x);

  fill(#FFFFFF, 30);
  ellipse( xp+x, xp+mouseY, y, y);

  fill(#FFFFFF, 70);
  ellipse( xp-x, xp-mouseY, x, x);


  float circlex = random(30, 300);
  float circley = random(30, 300);

  noFill();
  stroke(#FFFFFF, 30);
  strokeWeight(2);
  ellipseMode(CENTER);
  ellipse( mouseX, mouseY, circlex, circley);

  //seaweed

  int rect1 = round( map(mouseX, width, 0, 550, 700));
  int rect2 = round( map(mouseX, 0, width, 500, 700));  
  int rect3 = round( map(mouseX, 0, width, 560, 700));
  int rect4 = round( map(mouseX, width, 0, 510, 700));
  int rect5 = round( map(mouseX, 0, width, 510, 700));
  int rect5b = round( map(mouseX, 0, width, 580, 700));

  noStroke();
  fill(#91D3A1, 160);

  rect(10, rect1, 20, 200);
  rect(150, rect2, 17, 200);
  rect(220, rect3, 22, 200);
  rect(300, rect4, 18, 200);
  rect(500, rect5, 21, 200);
  rect(560, rect5b, 21, 200);

  int rect6 = round( map(mouseX, 0, width, 400, 700));
  int rect7 = round( map(mouseX, width, 0, 500, 700));  
  int rect8 = round( map(mouseX, width, 0, 490, 700));
  int rect9 = round( map(mouseX, 0, width, 570, 700));
  int rect10 = round( map(mouseX, width, 0, 500, 700));
  int rect11 = round( map(mouseX, width, 0, 480, 700));
  int rect12 = round( map(mouseX, 0, width, 400, 700));

  noStroke();
  fill(#497955, 250);

  rect(60, rect6, 20, 400);
  rect(100, rect7, 17, 400);
  rect(190, rect8, 22, 400);
  rect(390, rect9, 18, 400);
  rect(450, rect10, 21, 400);
  rect(600, rect11, 21, 400);
  rect(670, rect12, 21, 400);

  //light

  int light1 = round( map(mouseY, 0, height, 000, 700));

  fill(#DCF5FA, 50);
  beginShape();
  vertex(340, -50);
  vertex(light1, 800);
  vertex(light1+200, 800);
  vertex(360, -50);
  endShape(CLOSE);

  // float y = random(0, 500);

  //noFill();
  //stroke(#FFFFFF, 100);

  //strokeWeight(2);
  //bezier(y, 0, y, 0, y-46, 56, y-46, 213);
  // bezier( y, 213, y-1, 369, y+68, 416, y+65, 512);
  //bezier(y, 512, 634, y-3, 634, y-66, 700, y-66, 700);
}



