
PImage img; 
float ranX1 = random(20,180);
float ranY1 = random(20,180);
float ranX2 = random(180,380);
float ranY2 = random(20,180);
float ranX3 = random(20,180);
float ranY3 = random(180,380);
float ranX4 = random(180,380);
float ranY4 = random(180,380);
float ranS1 = random(50,150);
float ranS2 = random(50,150);
float ranS3 = random(50,150);
float ranS4 = random(50,150);
float Y1 = ranY1;
float Y2 = ranY2;
float Y3 = ranY3;
float Y4 = ranY4;


void setup() {
  background(255);  
  size(400,400);
  img = loadImage("wall.jpg");
  image(img,0,0,400,400);
  smooth();
  noStroke();
  fill(50,50,250);
  ellipse(ranX3, ranY3, ranS3, ranS3);
  fill(250,250,50);
  ellipse(ranX4, ranY4, ranS4, ranS4);
  fill(250,50,50);
  ellipse(ranX1, ranY1, ranS1, ranS1);
  fill(50,250,50);
  ellipse(ranX2, ranY2, ranS2, ranS2);

}

void draw() {
}

void mouseMoved() {
  fill(250,50,50);
  ellipse(ranX1, Y1+(ranS1/4), ranS1/4, ranS1/4);
  fill(50,250,50);
  ellipse(ranX2, Y2+(ranS1/4), ranS2/4, ranS2/4);
  fill(50,50,250);
  ellipse(ranX3, Y3+(ranS1/4), ranS3/4, ranS3/4);
  fill(250,250,50);
  ellipse(ranX4, Y4+(ranS1/4), ranS4/4, ranS4/4);
  Y1 = Y1 + 0.4;  // add to x position
  Y2 = Y2 + 0.4;  // add to x position
  Y3 = Y3 + 0.4;  // add to x position
  Y4 = Y4 + 0.4;  // add to x position
}

void mousePressed() {
  Y1 = ranY1;
  Y2 = ranY2;
  Y3 = ranY3;
  Y4 = ranY4;
  image(img,0,0,400,400);
  fill(50,50,250);
  ellipse(ranX3, ranY3, ranS3, ranS3);
  fill(250,250,50);
  ellipse(ranX4, ranY4, ranS4, ranS4); 
  fill(250,50,50);
  ellipse(ranX1, ranY1, ranS1, ranS1);
  fill(50,250,50);
  ellipse(ranX2, ranY2, ranS2, ranS2);
  
}

