
//This program was written by Christian Supriano
//It draws a pikachu and a pokeball that follows your mouse


void setup() {

  size(500, 500);
}

//defines the location of pikachu

int pikachuX=250;
int pikachuY=350;

void draw() {

  println(mouseX + "," + mouseY);

  //setting up the scene
  background(0, 150, 255);

  fill(0, 200, 0);
  rect(-1, 400, 501, 101);
  
  fill(255,255,0);
  noStroke();
  ellipse(50,50,50,50);

  //drawing the body
  noStroke();
  fill(255, 255, 0);
  ellipse(pikachuX, pikachuY, 150, 200);

  //drawing the feet
  ellipse(pikachuX-50, pikachuY+100, 70, 30);
  ellipse(pikachuX+50, pikachuY+100, 70, 30);

  //drawing the head
  noStroke();
  ellipse(pikachuX, pikachuY-130, 120, 100);

  //drawing the ears
  noStroke();
  triangle(278, 177, 343, 121, 298, 191);
  triangle(219, 177, 156, 121, 202, 191);
  fill(50, 0, 0);
  triangle(317, 143, 343, 121, 326, 149);
  triangle(178, 140, 156, 121, 172, 146);

  //drawing the face
  noStroke();
  fill(0);
  ellipse(pikachuX-25, pikachuY-150, 20, 20);
  ellipse(pikachuX+25, pikachuY-150, 20, 20);

  fill(255);
  ellipse(pikachuX-30, pikachuY-155, 8, 8);
  ellipse(pikachuX+20, pikachuY-155, 8, 8);

  fill(255, 0, 0);
  ellipse(pikachuX-40, pikachuY-120, 20, 20);
  ellipse(pikachuX+40, pikachuY-120, 20, 20);

  stroke(0);
  line(pikachuX-15, pikachuY-110, pikachuX+15, pikachuY-110);

  //drawing the tail
  noStroke();
  fill(50, 0, 0);
  quad(317, 397, 339, 389, 344, 416, 302, 422);
  quad(323, 373, 349, 364, 354, 386, 327, 393);

  fill(255, 255, 0);
  quad(331, 346, 375, 329, 383, 355, 336, 369);
  quad(347, 302, 430, 256, 432, 313, 357, 337);
  
  //drawing the arms
  stroke(0);
  strokeWeight(2);
  line(pikachuX-40,pikachuY-50,pikachuX-10,pikachuY-20);
  line(pikachuX-10,pikachuY-20,pikachuX-15,pikachuY-18);
  line(pikachuX-15,pikachuY-18,pikachuX-13,pikachuY-15);
  line(pikachuX-13,pikachuY-15,pikachuX-20,pikachuY-14);
  line(pikachuX-20,pikachuY-14,pikachuX-15,pikachuY-8);
  line(pikachuX-15,pikachuY-8,pikachuX-40,pikachuY-20);
  
  line(pikachuX+40,pikachuY-50,pikachuX+10,pikachuY-20);
  line(pikachuX+10,pikachuY-20,pikachuX+15,pikachuY-18);
  line(pikachuX+15,pikachuY-18,pikachuX+13,pikachuY-15);
  line(pikachuX+13,pikachuY-15,pikachuX+20,pikachuY-14);
  line(pikachuX+20,pikachuY-14,pikachuX+15,pikachuY-8);
  line(pikachuX+15,pikachuY-8,pikachuX+40,pikachuY-20);

  //drawing the pokeball
  fill(255);
  ellipse(mouseX, mouseY, 50, 50);

  fill(255, 0, 0);
  arc(mouseX, mouseY, 50, 50, -PI, 0);

  strokeWeight(2);
  stroke(0);
  line(mouseX-24, mouseY, mouseX+24, mouseY);

  fill(0);
  ellipse(mouseX, mouseY, 10, 10);

  fill(255);
  ellipse(mouseX, mouseY, 7, 7);
  
  
}


