


int eSize = 30;

size(400, 400);
colorMode(RGB, 400);
background(400);
noStroke();


for(int y = 0; y <=400; y += 40) {
  for (int x = 0; x <= 400; x += 40) {
    fill(x, 400-x, x, x);
    rect(x, y, eSize, eSize);
    rect(20 + x, 20 + y, eSize, eSize);
    
  }
    
}

for(int y = 0; y <=400; y += 40) {
  for (int x = 0; x <= 400; x += 40) {
    fill(x, 400-x, x, x);
   
    stroke(x);
    strokeWeight(5);
    noFill();
    ellipse(200, 200, x, y);
  }
    
}


