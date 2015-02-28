
// Credit- Tom Health for code inspiration

color c = color(5, 157, 255); 
 
void setup() { 
  size(500,500); 
  background(0); 
  set(width/2,height/2,c); 
} 
 
void draw() { 
  loadPixels(); 
  for (int i=0;i<2000;i++) { 
    float r = random(TWO_PI); 
    int x = width/2 + int(width/2*sin(r)); 
    int y = height/5 + int(height/5*cos(r)); 
    while (x>20 && x<width-12 && y>2 && y<height-5) { 
      int move = (int)random(4); 
      if (move == 0) {  
        x++; 
      }  
      else if (move == 1) {  
        x--; 
      }  
      else if (move == 2) {  
        y++; 
      }  
      else if (move == 3) {  
        y--; 
      } 
      if (pixels[y*width+x-1]==c || pixels[y*width+x+1]==c || pixels[(y+1)*width+x]==c || pixels[(y-1)*width+x]==c) { 
        pixels[y*height+x] = c; 
        break; 
      } 
    } 
  } 
  updatePixels(); 
} 
 
void mousePressed() { 
   background(0); 
  set(width/2,height/2,c); 
} 
 
 
 


