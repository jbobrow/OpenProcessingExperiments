
void setup() {
  size(900, 600);
  background(0);
  smooth();
  frameRate(70);
}

//body
void draw() {
  
 //set ellipses and rects to CENTER mode
 ellipseMode (CENTER);
 
//green dot


//big ornge
noStroke ();
fill (mouseX, 295, mouseY, 98);
ellipse (mouseX-30, mouseY, 15, 15);

//fisrt dot
noStroke ();
fill (mouseX, 225, mouseY, 100);
ellipse (mouseX-40, mouseY-22, 20, 20);

//second petal
noStroke ();
fill (mouseX, 25, mouseY, 120);
ellipse (mouseX-10, mouseY -25, 40, 40);

//third dot
noStroke ();
fill (mouseX, 285, mouseY, 60);
ellipse (mouseX-10, mouseY +10, 24, 25);

//fourth dot
noStroke ();
fill (mouseX, 85, mouseY, 90);
ellipse (mouseX-20, mouseY -22, 30, 30);

//fifth dot
noStroke ();
fill (mouseX, 25, mouseY, 140);
ellipse (mouseX-50, mouseY -5, 10, 10);

//six dot
noStroke ();
fill (mouseX, 25, mouseY, 70);
ellipse (mouseX-40, mouseY -5, 30, 30);


}

void mousePressed() {
  background(0);      // clears the background
}
  

