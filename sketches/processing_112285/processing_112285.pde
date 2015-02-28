

size(500, 500);
background(255);


noStroke();






for (int i = 0; i< width; i = i +40) {
  for (int j = 00; j< height; j = j +40) {
    fill(#06FF0C);
    ellipse(i, j,7,7);

  }
}

for (int i = 0; i< width; i = i +20) {
  for (int j = 00; j< height; j = j +30) {
    fill(#06FF0C);
    ellipse(i++, j++,7,7);

  }
}


 
for (int y = 0; y<height; y+=33) {
  for (int x  = 0; x <width; x+=25) {
 
    stroke(#70DBFC);
    strokeWeight(y/30);
    point (y-x, y);
    point (y, y-x);

  }
}



