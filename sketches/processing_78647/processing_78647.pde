
//Code Modified by Norm Krumpe

float pacX;
float moveX;
float speedX;
float moveY;
float speedX2;

void setup() {
  size(500, 300);
  smooth();
  moveX = 0;
  speedX = 5;
  speedX2 = -5;
}
void draw() {
  stroke(0); // black
  fill(0);
  rect(0, 0, width, height);
  if (key=='d') {
  moveX += speedX;}
  if (key=='a'){
  moveX += speedX2;}
  
  // Draw pac man
  fill(255, 255, 0);
  ellipse(moveX, height/2, 50, 50);
   
  fill(0); // black
  arc(moveX, height/2, 50, 50,
      abs(sin(moveX/width * 24 * PI)) * (-PI/5),
      abs(sin(moveX/width * 24 * PI)) * (PI/5) );     
}



