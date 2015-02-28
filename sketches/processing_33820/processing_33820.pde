
int xPos[]=new int [100];
int yPos[]=new int [100];
int clicks = 0;


void setup() {

  size(800, 800);
  background(255);
}


void draw() {
  for (int i=0;i<100 && i<clicks; i++) {
    //stroke(210, 0, 0);
    //line(250, 250, xPos[i], yPos[i]);
  //  line(xPos[i], yPos[i], xPos[i], yPos[i]);

    if (i>0) { 
     
      stroke(0);
      line(xPos[i-1],yPos[i-1],mouseX,mouseY);
    }
  }
}
void mousePressed() {
  xPos[clicks]= mouseX;
  yPos[clicks]= mouseY;
  clicks++;
}


