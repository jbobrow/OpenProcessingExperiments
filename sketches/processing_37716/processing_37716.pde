
size(400, 400);
background(255);

int space=20;

for (int x=5; x<width-space; x+=50) {  // spacing the triangles to the right
  for (int y=5; y<height-space; y+=50) {  // spacing the triangles down
    for (float l=5*space; l<=width; l++) {  //sets up the random colors
      if (x<=width/2) { //splits the triangles in half 
        fill(random(l), 255, 0);  //each triangle will fill different shades of yellow/green
        triangle(x, y, 20+x, 20+y, 40+x, y);
      }
      else {
        fill(50, 200, random(2*l)); //each triangle will fill different shades of blue/green
        triangle(x, y, 20+x, 20+y, 40+x, y);
      }
    }
  }
}


