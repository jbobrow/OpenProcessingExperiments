
void owl(int x, int y) {
  pushMatrix();
  translate(x,y);
  stroke(0);
  strokeWeight(1);
  //lineas
line(x+12, y-bodyHeight, x*12, ny);
line(x+12, ny, x*18, ny-43);
line(x*12, ny, x*42, ny-30);
line(x+12, ny*6 , x*78, ny+25);
line(x+12, ny, x*12, ny+30);

// cuerpo
noStroke();
fill(102);
ellipse(x+10, y-33, 43, 43);
fill(128,0,128);
ellipse(x+10, y-140, 34, 34);
fill(83,45,63);
ellipse(x+10, y-100, 28, 28);
fill(0);
ellipse(x+10, y-75, 20, 20);


// cabeza
fill(0);
ellipse(x+12, ny, radius, radius);
fill(255);
ellipse(x+24, ny-6, 24, 24);
fill(0);;
ellipse(x+24, ny-6, 13, 13);
fill(255);
ellipse(x-20, ny-6, 20, 20);
fill(0);;
ellipse(x-20, ny-6, 14, 14);

//extra
fill(54,67,156);
ellipse(x*2, ny-6, 50, 50);
fill(26,102,95);
ellipse(x*2, ny-60, 23, 23);
fill(43,168,155);
ellipse(x*2, ny-100, 10, 10);
fill(35,241,65);
ellipse(x*2, ny-200, 80, 80);
popMatrix();
}

