
//Ryan Coleman
//Homework 4.2 : Nested Loops
//Sept 19.11

//set basic rules
size(600, 600);
background(0);

ellipseMode(CENTER);
colorMode(RGB, width);

smooth();
noStroke();

//create for() {} loops

for (int countX = 100; countX <= width-100; countX+=12) {
  for (int countY = 100; countY <= height-100; countY+=12) {
    for (int ellipseSize = 20; ellipseSize > 0; ellipseSize-=5) {
      
      //create border
      fill(255, random(0, 50));
      ellipse (random(0, 100), random(0, height-100), 20, 20);
      ellipse (random(100, width), random(0, 100), 20, 20);
      ellipse (random(width-100, width), random(100, height), 20, 20);
      ellipse (random(0, width-100), random(height-100, height), 20, 20);

      //create interior ellipses
      fill (random(0, width), random(0, width));
      ellipse (countX, countY, ellipseSize, ellipseSize);
    }
  }
}

