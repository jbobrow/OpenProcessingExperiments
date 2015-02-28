
//Homework 4.2_Nested Loops & Transforms
//Created by Adrianne Blossom
//September 19, 2011

//Coding for a nested loop.

size(300, 300);
background(0);
colorMode(RGB, width);

for (int countX=0; countX<width/50; countX++) { //Controls y positioning of circle.
  for (int countY=0; countY<width/50; countY++) { // Controls the circles x coordinate.
    for (int radius=100; radius >=5; radius -=50) { //Controls size of circle.

      fill(width, 150, 75, 100);
      stroke(width, 255, countY, random(50));
      ellipse(25+(countX*50), 25+(countY*50), radius, radius);
    }
  }
}


