

//My Global Variable
int shapes;

void setup () {
  smooth ();
  size(350,350);
  background (255,190,250);
  
  
}

//-----------------------Boolean= tru/false -------------------
void draw () {

  if (frameCount % 20 == 0) {shapes = int(random(3));} // I'm dividing 20 by the "frameCount", whenever its false the integer shapes is enabled and I set it to chose 1-3 random shapes that I will be inputting in my code
}


//-----  I programmedThis section (mouseDragged) to enable a different shape whenever my shape integer randomizes btw (1-3)

void mouseDragged () {
if (shapes == 0) { image1(); } // (number 9)
if (shapes == 1) { image2(); } // (Tetris Shape)
if (shapes == 2) { image3(); } // (Circle with inner spirals)
}

//----------First Image-------------------------------------------

void image1() {
//colors - lerping
color from = color(random(255), random(255), random(255));
color to = color(random(255), random(255), random(255));
color start1 = lerpColor(from, to, .22);
color fin1 =lerpColor(from, to, .44);
fill (start1);
stroke(fin1);
// My number "9" image
ellipse(mouseX,mouseY,58,50);
noStroke();
rect(mouseX,mouseY,30,60);
fill(0);
stroke (0);
ellipse(mouseX,mouseY,20,20);
}

//-------- Second Image ------------------------

void image2() {
noStroke();
color from = color(random(255), random(255), random(255));
fill(from);
rect(mouseX, mouseY, 10, 40);
rect(mouseX, mouseY, 40, 10);
rect(mouseX,mouseY, -40,-10);
}

//----Third Image-----------------------------------

  void image3() {
  strokeWeight(1);
  stroke (0,200,100);
  fill(random(200),random(100),random(200), 50);
  
  
  ellipse(mouseX,mouseY,40,40);
  ellipse (mouseX,mouseY,30,30);
  ellipse (mouseX,mouseY,25,25);
  ellipse (mouseX,mouseY,20,20);
  ellipse (mouseX,mouseY,15,15);
  ellipse (mouseX,mouseY,10,10);
  ellipse (mouseX,mouseY,5,5);
  ellipse (mouseX,mouseY,2,2);
}

// --------- Reset ----------------
void keyPressed () {
  if (key == 'r') { background (255,190,250); }
}


