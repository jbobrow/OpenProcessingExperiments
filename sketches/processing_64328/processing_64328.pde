
size(500,500);
smooth();
background(0);
 
/*strokeWeight(12);
stroke(255);*/
 
for (float y = 0; y <= height; y = y + 10) {
  for (float x = 0; x <= width; x = x + 10) {
    noStroke();
    fill(random(40),random(40),random(200));
    rect(x,y, random(0,20),random(0,20));
  }
}


