
int counter;
int radius = 40;
float x = -radius;
float speed = 3;
float a = radius;
float j;
float k;




void setup() {
  size(800, 800);
  smooth();
  ellipseMode(RADIUS);
}

void draw() {
  background(0);



  x += speed;
  fill(random(256), random(256), random(256));
  ellipse(x, mouseY, radius, radius);
  ellipse(x +70, mouseY -40, radius, radius);
  ellipse(x *8, mouseY + 35, radius, radius);
  ellipse(x * 2, mouseY + 10, radius, radius);
  ellipse(x - 50, mouseY * 18, radius, radius);
  rect(mouseX, mouseY, 400, mouseY);
  // shapes that move along background and change color

  ellipse(70 - x, mouseY *3, radius, radius);
  
  j += random(-speed, speed);
  k += random(-speed, speed);

  ellipse(j, mouseY, radius, radius);
  ellipse(j +120, mouseY -30, 10, 10);
  ellipse(j *7, mouseY + 43, 10, 10);
  ellipse(j * 5, mouseY + 20, 10, 10);
  ellipse(j - 30, mouseY * 4, 10, 10);
  
  ellipse(mouseX, k, radius, radius);
  ellipse(mouseX +120, k -30, 10, 10);
  ellipse(mouseX *7, k + 43, 10, 10);
  ellipse(mouseX * 5, k + 20, 10, 10);
  ellipse(mouseX - 30, k * 4, 10, 10);
  //shapes that move at random speeds around the background


  fill(0);

    ellipse(x + 3, mouseY, radius, radius);
  ellipse(x +140, mouseY -60, 10, 10);
  ellipse(x *3.5, mouseY + 32, 10, 10);
  ellipse(x * 9, mouseY + 56, 10, 10);
  ellipse(x - 20, mouseY * 3, 10, 10);
  // black circles that move along background

  fill(0);
  ellipse(400, 400, 30, 30);
  rect(382, 408, 35, 25);
  rect(389, 433, 18, 20);
  //face

  rect(361, 456, 70, 100);
  rect (372, 453, 50, 100);
  ellipse(370, 465, 15, 15);
  ellipse(420, 465, 15, 15);
  rect (370, 555, 17, 190);
  rect (405, 555, 17, 190);
  //body

  rect(x, 200, 400, 12);
  rect(x, 230, 400, 12);
  rect(x, 260, 400, 12);
  rect(x, 290, 400, 12);
  rect(x, 320, 400, 12);
  rect(x, 350, 400, 12);
  rect(x, 380, 400, 12);
  rect(x, 410, 400, 12);
  rect(x, 440, 400, 12);
  rect(x, 470, 400, 12);
  rect(x, 500, 400, 12);
  rect(x, 530, 400, 12);
  rect(x, 560, 400, 12);
  // bars that float across screen

  
}


void mousePressed() {
  loop();
  //when mouse pressed everything freezes.
}

void mouseReleased() {
  noLoop();
  redraw();
}

