
size (500,500);
background (255);
smooth();

for (int x = 0; x < width; x+=10) {
  for (int y = 0; y < height; y+=10) {
    noStroke();
    fill(random(255));
    rect(x,y,10,10);
  }
} 

fill (0);
triangle(100,100, 400,100, width/2, height/2);

for (float w = width; w > 0; w = w-20) {
  noFill();
  stroke (255);
  strokeWeight(3);
  ellipse(width/2, height/2, w,w);
}

for (int y = 0; y < height; y += 10) {
 stroke(0);
 strokeWeight(1);
 line (0, y, width, 500); 
}

for (int y = 0; y < height; y += 10) {
 stroke(0);
 strokeWeight(1);
 line (500,y, 0, 500); 
}

for (int y = 0; y < height; y += 10) {
 stroke(0);
 strokeWeight(1);
 line (500,y, 0, 500); 
}

