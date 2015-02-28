
PVector p1;
PVector p2;

void setup() {
   size(500, 500);
   p1 = new PVector(250, 250);
   p2 = new PVector();
}

void draw() {
   background(0); 
   
   p2.x = mouseX;
   p2.y = mouseY;
   
   float distance = p1.dist(p2);
   
   fill(128);
   
   ellipse(p1.x, p1.y, 20, 20);
   
   if(distance < 20) {
      fill(255, 0, 0); 
   }
   
   ellipse(p2.x, p2.y, 20, 20);
}


