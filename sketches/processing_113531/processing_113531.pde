
int eSize = 200; 
int rSize = 30;
int speed = 7; 
int x = 310;
 
void setup() {
  size(800, 800);
  noStroke(); 
  frameRate(50); 
  smooth();  
}
 
void draw() {
  background(0, 100, 140); 
  fill(255);
  noStroke();
  rect(100, 200, 20, 500);
  noStroke();
  rect(120, 350, 200, 20);
  noStroke();
  rect(120, 510, 170, 20);
  noStroke();
  rect(270, 530, 20, 170);
  noStroke();
  rect(200, 210, 20, 140);

  noStroke();
  triangle(90, 130, 120, 120, 80, 40);

  smooth();
  noStroke();
  ellipse(110, 155, 100, 100);

  fill(0);
  noStroke();
  ellipse(130, 150, 40, 20);
  
  fill(255, 255, 0);
  ellipse(x, height/3, eSize, rSize); 
  x = x + speed; 
  if (x >= width) {
    x = 310;
  }
}














