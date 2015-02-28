
size(400, 400);
background(255);
colorMode(RGB, 10);

for (int x = 5; x<width; x +=25) {
  for (int y = 7; y<width; y+=20) { //sets up x,y grid
    for (int z = 0; z<10; z++) { 
      strokeWeight(random(12)); //randomly selects the thickness of the point
      stroke(random(10), z, z); //randomly selects the red component to the color of the points, while the green and blue incease with the z int
      point(x, y);
    }
  }
}


