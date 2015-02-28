

strokeWeight(random(3,30));
stroke(255); 

float space = 10;
 
size(1000,600);
smooth();
background(0);
 
for (float y = 0; y <= height; y = y + random(0,50) + space) {
  for (float x = 0; x <= width; x = x + random(7,14) + space) {
    point(x,y);

    
    float x1 = x;
 
    if (x > 20) {
      x = x - 5;
    }
    else {
      x = x + 5;
    }
    ellipse(x, y, 50, 50);
    
    fill(50,80);
    strokeWeight(random(1,9));
    
  }
}


