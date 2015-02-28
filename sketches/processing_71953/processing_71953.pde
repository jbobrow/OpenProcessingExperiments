
int x = mouseX/10;
int spacing = 20;
int count = 5;



void setup() {
  size(800, 800);
  smooth();
 
}

void draw() { 
  fill(45, 6, 150, 5);
  rect(0, 0, width, height);
  translate(width/2, height/2);





  for (int i = 0; i < 9;i++) {
    for (int j = 0; j < 7; j++) {
      rotate(radians(map(mouseX, 0, width, 0, 180))+
        radians(map(mouseY, 0, height, 0, 360))+count);


      bullseye (i*100+int(random(10)), j*100+int(random(10)), 5);
    }
  }
  //}
}
void bullseye(int xPos, int yPos, int numCircles) {
  stroke(20, 250, 255);
  strokeWeight(5);
   for (int i=0;i < numCircles;i++)
  {
    rotate(PI);
    stroke(16, 117, 121, map(i, 0, numCircles, 127, 0));
    ellipse(xPos, yPos, i*spacing, i*spacing);

    fill(random(x, 55), random(x, 225), random(x, 255), random(x,25));

    ellipse(yPos, xPos, i, i);
  }
}
