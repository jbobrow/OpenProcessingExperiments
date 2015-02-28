
//SEWN ROSE REPRESENTING FEMALE GENITAL MUTILATION

//original positioning of rose based on Rui Campos' sketch "Rose" 
//I adjusted and increased his values to create my own rose design, then added animation!
//I also referenced the book "Getting Started with Processing" by Casey Reas and Ben Fry for the spiral effect

//universals

float angle = 0.0;
float offset = 200;
float scalar = 2;
float speed = 0.05;

void setup() {
  size(400, 400);
  background(255);
  smooth();
  fill(255, 0, 0, 1);
  stroke(255, 0, 0, 1);

  //mouseX = width/2; 
  //mouseY = height/2;
}

void draw() {

  frameRate(20); //slow down the drawing

  //sets of circles to overlap and resemble petals of a rose
  //the strokes and their movement also alludes to sewing - the sewn rose is an image of fgm
  float x9 = ((offset + 80) + (cos(angle) * scalar));
  float y9 = (offset + (sin(angle) * scalar));
  ellipse(x9, y9, 300, 300);
  stroke(255, 100);
  //line(mouseX, mouseY, x9, y9);

  float x10 = offset + cos(angle) * scalar;
  float y10 = offset + 80 + sin(angle) * scalar;
  ellipse(x10, y10, 300, 300);
  //line(mouseX, mouseY, x10, y10);

  float x11 = offset - 80 + cos(angle) * scalar;
  float y11 = offset + sin(angle) * scalar;
  ellipse(x11, y11, 300, 300);
  //line(mouseX, mouseY, x11, y11);

  float x12 = offset + cos(angle) * scalar;
  float y12 = offset - 80 + sin(angle) * scalar;
  ellipse(x12, y12, 300, 300);
  //line(mouseX, mouseY, x12, y12);


  float x5 = offset + 60 + cos(angle) * scalar;
  float y5 = offset + sin(angle) * scalar;
  ellipse(x5, y5, 200, 200);
  //line(mouseX, mouseY, x5, y5);

  float x6 = offset + cos(angle) * scalar;
  float y6 = offset + 60 + sin(angle) * scalar;
  ellipse(x6, y6, 200, 200);
  //line(mouseX, mouseY, x6, y6);

  float x7 = offset - 60 + cos(angle) * scalar;
  float y7 = offset + sin(angle) * scalar;
  ellipse(x7, y7, 200, 200);
  //line(mouseX, mouseY, x7, y7);

  float x8 = offset + cos(angle) * scalar;
  float y8 = offset - 60 + sin(angle) * scalar;
  ellipse(x8, y8, 200, 200);
  //line(mouseX, mouseY, x8, y8);


  float x1 = offset + 40 + cos(angle) * scalar;
  float y1 = offset + sin(angle) * scalar;
  ellipse(x1, y1, 100, 100);
  //line(mouseX, mouseY, x1, y1);  

  float x2 = offset + cos(angle) * scalar;
  float y2 = offset + 40 + sin(angle) * scalar;
  ellipse(x2, y2, 100, 100);
  //line(mouseX, mouseY, x2, y2);

  float x3 = offset - 40 + cos(angle) * scalar;
  float y3 = offset + sin(angle) * scalar;
  ellipse(x3, y3, 100, 100);
  //line(mouseX, mouseY, x3, y3);

  float x4 = offset + cos(angle) * scalar;
  float y4 = offset - 40 + sin(angle) * scalar;
  ellipse(x4, y4, 100, 100);
  //line(mouseX, mouseY, x4, y4);

  angle += speed; //movement of animation
  scalar += speed; //speed of animation
}


