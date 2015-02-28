
int r;
int g;
int b;




void setup() {
  size(500, 500);
  noLoop();
  smooth();
}

float x = 0;

void draw() {
    background (r,g,b);
    
  x = x + .1;
  if (x > width) {
    x = 0;
   
  }
   // Koerper
  fill(mouseX,mouseY,255);
  ellipse (mouseX, mouseY+100,125,100);
  ellipse (mouseX, mouseY+55,100,90);
  ellipse (mouseX, mouseY,100,100);
  
  //knoepfe
  fill (0,50,0);
  ellipse (mouseX,mouseY+70,8,8);
  fill (50,0,0);
  ellipse (mouseX,mouseY+55,8,8);
  fill (0,0,50);
  ellipse (mouseX,mouseY+85,8,8);
  
  //augen
  fill (170);
  ellipse (mouseX-18,mouseY-10,20,20);
  ellipse (mouseX+18,mouseY-10,20,20);
  fill (0);
  ellipse (mouseX-15,mouseY-10,8,8);
  ellipse (mouseX+15,mouseY-10,8,8);
  
  //augenbrauen
  fill(0);
  line (mouseX-30,mouseY-20,mouseX-10,mouseY-30);
  line (mouseX+10,mouseY-30,mouseX+30,mouseY-20);
  
  //mund
  fill (170);
  line (mouseX-15,mouseY+30,mouseX+15,mouseY+30);
  
  //nase
  fill (0);
  ellipse (mouseX-1,mouseY+5,10,10);

}

void mousePressed() {
  loop();
  r= int (random (100,255));
    g= int (random (100,255));
    b= int (random (100,255));
}

void mouseReleased() {
  noLoop();
}

