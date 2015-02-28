

 
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
 
  background(255);
 
  fill(255);
  float x1 = random(0, 100); 
  float y1 = random(0,500 ); 
  float x = random(0, width);
  float y = random(0, height);
  
  float l1 = random(0, 500);
  
  ellipse(x, y, x1, x1);
  line(x, y, x1, y1);
  

noFill();
stroke(255, 102, 0);
line(x, y, x1, y1);
line(x, y, x1, y1);
stroke(0, 0, 0);
bezier(x, y, x1, y1, 90, 90, 15, 80);
bezier(x, y, x1, y1, l1, 90, 15, 80);
bezier(x, y, x1, y1, random(0,90), 90, 15, 80);
bezier(x, y, x1, y1, 90, random(0,90) , 15, 80);
bezier(x, y, x1, y1, 90, 90 , random(0, 15), 80);
bezier(x, y, x1, y1, 90, 90 , 15, random(0,80));



}



