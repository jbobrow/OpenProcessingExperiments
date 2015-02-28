
float y = 10;
float x = 300;

 

void setup() {
  size(640, 360);  
  noLoop();
  stroke(240);

  
  y = height ;
}





void draw() { 
  background(0);   
  line(0, y, width, x);  
    for (int i = 6; i < height; i += 46) {
    fill(0);
      rect(x, 1, 100, height);
      fill(255);
    rect(y, 1, 100, height);
    }

  
  y = y - 49; 
  if (y < 0) { 
    y = height+2; 
  } 
  
 y = y - 20; 
  if (y < 0) { 
    y = height+10; 
  } 
  
   y = y - 2; 
  if (y < 3) { 
    y = height+5; 
  } 
} 

void mousePressed() {
  loop();
  background(255);
  
}


