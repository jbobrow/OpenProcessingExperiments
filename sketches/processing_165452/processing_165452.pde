
void setup () {
  size(1500, 900);
  background(#343030);
  frameRate(100);
}

void draw() {
 noStroke();
// fill(#343030);
//rect(0,0,800,800); //if you want a "faded" effect uncomment fill() and rect() .
  if ( mousePressed) {
    fill(0, 600, 0);
  }
  else {
    fill(0, cos(frameCount*9000), 0);
  }
     fill(300+ 300*cos(frameCount*(.007)),  300+100*sin(frameCount*(.006)),0); 
  // fill(0,300+100*sin(frameCount*(.06)),300+ 300*cos(frameCount*(.07))); //switches the colors' sides
  ellipse(  725+600*cos(frameCount*(.007)),  450+ 300*sin(frameCount*(.006)),10,10  );
}

void keyPressed() {
  saveFrame();
}




