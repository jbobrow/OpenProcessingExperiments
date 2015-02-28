
float red;
float green;
float blue;
float incrementor;

void setup(){
  size(400, 600);
  noStroke();
}

void draw (){
  red= map(mouseX, 0, width, 0, 255);
  green= map(mouseY, 0, height, 0, 255);
  
  fill(red, green, 0);
  rect(100, 100, 200, 400);
  
  blue= map(cos(incrementor), -1, 1, 0, 255);
  fill(0, 0, blue);
  ellipse(width/2, width/2, 150, 150);
  
  incrementor +=0.05;
  
}
