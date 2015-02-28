
void setup() {
  size (400, 400);
  background (255);
  smooth();
}

void draw() {
noStroke ();
smooth();

fill (255, 30);
rect (0,0, width, height);  
  
fill (100);
ellipse (mouseX + 20,10,20,20);
fill (100);
ellipse (mouseX - 20,mouseY +120,20,20);
fill (100);
ellipse (mouseX + 100,mouseY + 30,20,20);
ellipse (52,mouseY - 110,20,20);
fill (100);
ellipse (220,mouseY -70,20,20);
fill (100);
ellipse (mouseX - 100,10,20,20);
fill (100);
ellipse (mouseX - 20,mouseY +120,20,20);
fill (100);
ellipse (mouseX + 100,mouseY + 30,20,20);
ellipse (52,mouseY + 110,20,20);
ellipse (265,mouseY + 20,20,20);
ellipse (mouseX - 100,mouseY - 70,20,20);
ellipse (mouseX + 100,mouseY + 30,20,20);
ellipse (mouseX + 100, 300,20,20);
ellipse (mouseX + 80, 30,20,20);
ellipse (100, mouseY + 30,20,20);

if(mousePressed){
  

fill (255);
rect (0,0, width, height);  
  
fill (100);
ellipse (100,10,20,20);
fill (100);
ellipse (100,40,20,20);
fill (100);
ellipse (100,70,20,20);
ellipse (100,110,20,20);
fill (100);
ellipse (100,140,20,20);
fill (100);
ellipse (100,170,20,20);
fill (100);
ellipse (100,210,20,20);
fill (100);
ellipse (100,240,20,20);
ellipse (100,270,20,20);
fill (100);
ellipse (100,310,20,20);
ellipse (100,340,20,20);
}


}


