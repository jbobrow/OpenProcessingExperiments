
int inboxX, inboxY, quadX, quadY, mX, mY, pmX, pmY;
void setup() {

  background(255);
  size(1000, 1000);
  smooth();
  
  // drawing the graph paper
  for (int i=0; i<width; i+=width/10) {
    for (int j=0; j<height; j+=width/10) {
      line (0, i, width, i);
      line (j, 0, j, height);
    }
  }

}


void draw() {


  mX= mouseX;
  mY = mouseY;
  pmX= pmouseX;
  pmY = pmouseY;

  //locate quadrant
  quadX= mX/(width/10)+1;
  quadY= mY/(width/10)+1;
}
void mouseDragged() {
  // draw within quardrant
  inboxX=mX-((quadX-1)*(width/10));
  inboxY=mY-((quadY-1)*(height/10));


// free form drawing within the quardrants
  for (int i=0; i<width; i+=width/10) {
    for (int j=0; j<height; j+=width/10) {
      stroke (255, 50, 50);
      line(pmX+i, pmY+j, mX+i, mY+j);
      line(pmX-i, pmY-j, mX-i, mY-j);
      line(pmX+i, pmY-j, mX+i, mY-j);
      line(pmX-i, pmY+j, mX-i, mY+j);
    }
  }
}


