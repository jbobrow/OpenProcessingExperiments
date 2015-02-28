
void setup() { size(800, 600); stroke(255); cursor(CROSS);
}
void draw() { background(255); fill(80); noStroke();


  for (int x=100; x<width;x+=100) 
  {
    for (int y=100;y<height;y+=100)
    {
      fill(255, 0, 0); noStroke();
      ellipse(x, y, 80, 80);
      fill(255);
      ellipse(x, y, 70, 70);
      fill(255, 0, 0); noStroke();
      ellipse(x, y, 60, 60);
      fill(255);
      ellipse(x, y, 50, 50);
      fill(255, 0, 0); noStroke();
      ellipse(x, y, 40, 40);
      fill(255);
      ellipse(x, y, 30, 30);
      fill(255, 0, 0); noStroke();
      ellipse(x, y, 20, 20);
      fill(255);
      ellipse(x, y, 10, 10);
      

float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI; stroke(255);
              line(mouseX, mouseY, cos(s) * 438 + 400, sin(s) * 438 + 400); strokeWeight(70);
              line(mouseX, mouseY, cos(m) * 430 + 400, sin(m) * 430 + 400); strokeWeight(70);
              line(mouseX, mouseY, cos(h) * 425 + 400, sin(h) * 425 + 400);  strokeWeight(70);


    }
  }
}



