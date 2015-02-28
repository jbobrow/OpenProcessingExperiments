
size(500,500);
smooth();
background(0);
 
/*strokeWeight(12);
stroke(255);*/
 
for (float y = 30; y <= height - 30; y = y + 10) {
  for (float x = 30; x <= width - 30; x = x + 10) {
    noStroke();
    fill(random(200),random(50),random(50));
    ellipse(x,y, random(0,10),random(0,10));
  }
}


