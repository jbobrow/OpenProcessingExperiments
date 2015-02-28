
size(500, 500);

int i = 5;

//background(150 - i, i, 2 * i);
background(170, 50, 100);

for(int x = 0; x<= 500; x+= 10) {
  for(int y = 0; y<= 500; y += 10) {
    
    fill((x+y)*1.3, x, y + 50);
    rectMode(CORNERS);
    noStroke();
    //stroke(255);
    rect(x * 2, y * 2, x + 500, y + 500);
  }
}

for(int e = 500; e >= 0; e -= 25) {
  for(int f = 500; f >= 0; f -= 25) {
    
    noFill();
    stroke(e, f + 100, e * 5);
    strokeWeight(5);
   ellipse(e * 1.5, f * 1.5, 30, 30);
  fill(e, f + 100, e * 5); 
  noStroke();
   ellipse(e * 1.5, f * 1.5, 15, 15);
     
  }
}


