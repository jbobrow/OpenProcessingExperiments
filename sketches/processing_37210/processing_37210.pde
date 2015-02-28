
//quiz 3
// In a wide canvas, draw a sequence of 70 circles. 
// They are spaced every 10 pixels across the screen. 
// Each circle's vertical position is randomly displaced from that of the previous one. 

size (600, 200);
background (255);
strokeWeight (2);

for (int i=0; i<70; i++) {
  float rx = i*10;
    float ry =i+99+random(-15,10);
    noFill();
    ellipse (rx, ry, 7, 7) ;

  }

     
                                
