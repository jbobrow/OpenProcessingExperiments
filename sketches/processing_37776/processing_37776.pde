
//circles inscribed on top of squares framewwork refined

size(600, 600);
rectMode(CENTER);
background(255);

noStroke();
smooth();

for (int countX = 0; countX < width; countX++) { //countX = 50 (means X location of center of rect starts at 50); countX < Width (this a test to make the a true result); countX++ (this repeats the X coordinate across the artboard; repetition is contrained by another loop nested within this program)
  for (int countY = 0; countY < height; countY++) {//same as countX comments; just Y axis
    for (int rectSize = 90; rectSize < width; rectSize=1000) {//question: Why does spacing need to be defined as 1000 instead of 100?
      rect(50+(countX*100), 50+(countY*100), rectSize, rectSize);
    }

    for (int ellipseSize = 100; ellipseSize >= 5; ellipseSize -= 20) {//ellipse will be repeated four times within itself for a total of five radial circles per group
      fill(0,0,255,50);
      ellipse(50+(countX*100), 50+(countY*100), ellipseSize+50, ellipseSize+50);
    }
  }
}

    pushMatrix();//pushMatrix comes in handy to easily place orange circle between radial circle groups
      translate(width/6, height/6);
      fill(250,114,3,90);
      ellipse(width/2,height/3,25,25);
      

