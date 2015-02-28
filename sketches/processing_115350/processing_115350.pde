
void setup() {
  size (400, 400);
  fill(255, 255, 255);
  smooth();
  noStroke();
}



void draw() {

  background(0, 0, 0);
  fill(0, 0, 0);
  noStroke();

  float xPos;
  float yPos;
  int circleSize = 5;
  int circleDistance = 5;


  for (int x=1; x<= width; x=x+circleDistance) {

    for (int y=1; y<= height; y=y+circleDistance) {

      xPos = x + random(mouseX/50);
      yPos = y + random(mouseX/50);

      fill(0, 0, 0);
      ellipse(xPos, yPos, 10, 10);
      fill(255, 255, 255);
      ellipse(xPos+20, yPos+20, 10, 10);
    }
  }

float m = map(mouseX, 0, width, 0, 13);

  
    noStroke();    
ellipse(200, 200, 50, 50);
ellipse(200, 250, 65, 65);
ellipse(200, 300, 85, 85);
fill(0, 0, 0);
ellipse(191, 192, 6, 6);
ellipse(209, 192, 6, 6);
fill(255, 155, 0);
triangle(198, 198, 198, 205, 226, 202);
fill(0, 0, 0);
ellipse(200, 213, m, m/2);
ellipse(200, 240, 3, 3);
ellipse(200, 250, 3, 3);
ellipse(200, 260, 3, 3);
fill(255, 255, 255);
ellipse(200, 400, 500, 200);
}

