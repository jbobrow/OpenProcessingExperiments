
int i = 0; 
float xoff = 0.0;
float yoff = 0.0;
void setup() {  
   
    background(255);
    size(500, 500); 
    smooth();
} 
 
void draw() { 
 
    stroke(random(50,300), random(255), random(255), 200);
     xoff = xoff + .01;
  float n = noise(xoff) * width;
  line(n, 0, n, height);
  yoff = yoff + .01;
  float m = noise(yoff) * height;
  line(0, m, width, m);
     if (i < width) {
        i++;
    } else {
        i = 0; 
    }
}
 
                
                
