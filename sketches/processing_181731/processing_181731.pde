
void setup() {
  size(600,400);
  noCursor();
}
 
 void draw() {
   background(255,50,70);
   stroke(0);
   float pos = 0.5;
   int a = 55;
   int b = 40;
   int c = 20;
 
fill(mouseX,230,255);
ellipse(mouseX,mouseY,b,b);
strokeWeight(2);
fill(245,236,133);
ellipse(mouseX,mouseY,b/6,b/6);

strokeWeight(1);
fill(random(250));
ellipse(mouseX,mouseY-a,mouseY*pos,mouseY*pos);
ellipse(mouseX,mouseY-a,mouseY/4,mouseY/4);
ellipse(mouseX+b,mouseY+b,mouseY*pos,mouseY*pos);
ellipse(mouseX+b,mouseY+b,mouseY/4,mouseY/4);
ellipse(mouseX-b,mouseY+b,mouseY*pos,mouseY*pos);
ellipse(mouseX-b,mouseY+b,mouseY/4,mouseY/4);
ellipse(mouseX-a,mouseY-c,mouseY/4,mouseY/4);
ellipse(mouseX-a,mouseY-c,mouseY/8,mouseY/8);
ellipse(mouseX+a,mouseY-c,mouseY/4,mouseY/4);
ellipse(mouseX+a,mouseY-c,mouseY/8,mouseY/8);
ellipse(mouseX,mouseY+85,mouseY/4,mouseY/4);
ellipse(mouseX,mouseY+85,mouseY/8,mouseY/8);
 }

