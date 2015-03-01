
int x1 = 0; 
int y1 = 0;

int x2 = 0; 
int y2 = -100;

void setup() {    
    background(0);
    size(500, 500);
    smooth();
    frameRate(120); 
    strokeWeight(12);
} 

void draw() {
   if (x1 < width) { 
      stroke(0, random(50,255), random(50,255), 50);
      x1+=1;
      line(x1, y1, random(0, height), width);
   } else { x1 = -100; } 
}
