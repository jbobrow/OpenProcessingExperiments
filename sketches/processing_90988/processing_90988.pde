

size(500, 500);

background(0);

smooth();

for (int y = 0; y <= height; y += 60) {

  for (int x = 0; x <= width; x += 120) {
        
    fill(255,255,255);
    
    ellipse(x-60, y, 120, 120); 
    ellipse(x-60,y, 110, 110);
    ellipse (x-60, y, 100, 100);
    ellipse (x-60, y, 90, 90);
    ellipse(x-60, y, 80, 80); 
    ellipse(x-60,y, 70, 70);
    ellipse (x-60, y, 60, 60);
    ellipse(x-60, y, 50, 50); 
    ellipse(x-60,y, 40, 40);
    ellipse (x-60, y, 30, 30);
    ellipse(x-60,y, 20, 20);
    ellipse (x-60, y, 10, 10);

    ellipse(x, y, 120, 120); 
    ellipse(x,y, 110, 110);
    ellipse (x, y, 100, 100);
    ellipse (x, y, 90, 90);
    ellipse(x, y, 80, 80); 
    ellipse(x,y, 70, 70);
    ellipse (x, y, 60, 60);
    ellipse(x, y, 50, 50); 
    ellipse(x,y, 40, 40);
    ellipse (x, y, 30, 30);
    ellipse(x,y, 20, 20);
    ellipse (x, y, 10, 10);
    
  }
}

