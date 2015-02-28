
PVector x1;
PVector x2;
int brojac = 0;
int[] xkoordinate = new int[2];
int[] ykoordinate = new int[2];
 
void setup() {
  size(600, 600); 
  background(40);  
}

void mousePressed() {
  xkoordinate[brojac%2] = mouseX;
  ykoordinate[brojac%2] = mouseY;
  brojac++;
  
  
   
  } 
 
void draw() {
  if(brojac > 1 && brojac % 2 == 0) {
      background(40); 
      x1 = new PVector(xkoordinate[0], ykoordinate[0]);
      x2 = new PVector(xkoordinate[1], ykoordinate[1]);
      float alfa = map(mouseX, 0, width, 0, 1);
 
      noFill();
      stroke(255);
     
      line(x1.x, x1.y, x2.x, x2.y);
      text("x1", x1.x + 10, x1.y);
      text("x2", x2.x + 10, x2.y);
     
      float px = lerp(x1.x, x2.x, alfa);
      float py = lerp(x1.y, x2.y, alfa);
       
      ellipse(px, py, 10, 10);
      text("   alfa = " + alfa, px, py);
  }
  
}
