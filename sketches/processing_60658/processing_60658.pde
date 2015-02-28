
int x1 = 0;
int y1 = 0;
int w1 = 50;
int h1 = 50;

int x2 = 0;
int y2 = 50;
int w2 = 50;
int h2 = 50;

int x3 = 50;
int y3 = 00;
int w3 = 50;
int h3 = 50;

int x4 = 50;
int y4 = 50;
int w4 = 50;
int h4 = 50;

void setup() {
  size(100, 100);
  background(255);
}

void draw() {
  background(255);
  line(50,0,50,200);
  line(0,50,200,50);

  if (mouseX > x1 
    && mouseX < x1 + w1 
    && mouseY > y1 
    && mouseY < y1 + h1) {
    println("North-West");
    fill(255, 0, 0);
    rect(x1, y1, w1, h1);
  }
  

  else if (mouseX > x2 
    && mouseX < x2 + w2 
    && mouseY > y2 
    && mouseY < y2 + h2) {
    println("South-West");
    fill(255, 0, 0);
    rect(x2, y2, w2, h2);
  }
  
   else if (mouseX > x3 
   && mouseX < x3 + w3 
   && mouseY > y3 
   && mouseY < y3 + h3) {
   println("North-East");
   fill(255, 0, 0);
   rect(x3, y3, w3, h3);
   }
   
   
   else if (mouseX > x4 
   && mouseX < x4 + w4 
   && mouseY > y4 
   && mouseY < y4 + h4) {
   println("South-East");
   fill(255, 0, 0);
   rect(x4, y4, w4, h4);
   }
   
}

void mousePressed() {
  saveFrame("thumbnail.png");
}


