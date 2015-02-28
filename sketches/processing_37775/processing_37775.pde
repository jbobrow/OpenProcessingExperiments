
//"lacing" of nested looped circles
//the quadrants where four radial circle groups superimpose are the areas of the highest contrast
//the quadrants where the two radial circle groups on the X axis and the two radial circle groups on the Y axis meet are the areas of the lowest contrast
//within the range of contrast, additional patterns are palpable


size(600,600);
ellipseMode(CENTER);
rectMode(CENTER);

noFill();

for(int countX = 0; countX < width; countX++) {
  for(int countY = 0; countY < height; countY++) {
    for(int ellipseSize = 60; ellipseSize >= 10; ellipseSize -= 10) {
      ellipse(0+(countX*30), 0+(countY*30), ellipseSize, ellipseSize);
    }
  }
}

