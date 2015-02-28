
PVector x1;
PVector x2;
int brojac = 0;
int[] xkoordinate = new int[2];
int[] ykoordinate = new int[2];
color c1, c2;

 
void setup() {
  size(600, 600); 
  background(40); 
}

void mousePressed() {
  c1 = color(random(0, 256), random(0, 256), random(0, 256));
  c2 = color(random(0, 256), random(0, 256), random(0, 256)); 
  xkoordinate[brojac%2] = mouseX;
  ykoordinate[brojac%2] = mouseY;
  brojac++;   
} 
 
void draw() {
  if(brojac > 1 && brojac % 2 == 0) {
      background(40); 
      x1 = new PVector(xkoordinate[0], ykoordinate[0]);
      x2 = new PVector(xkoordinate[1], ykoordinate[1]);
      
      noFill();     
      for(float i = 0; i <=  1; i += 0.001){           
          color c = lerpColor(c1, c2, i);
          strokeWeight(4);
          stroke(c);
          point(lerp(x1.x, x2.x, i), lerp(x1.y, x2.y, i));
      }
      
      
      text("x1", x1.x + 10, x1.y);
      text("x2", x2.x + 10, x2.y);
      }
  
}

