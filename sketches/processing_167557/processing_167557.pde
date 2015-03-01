

//DECLARATION

int [] xposn = new int [50];
int [] yposn = new int [50]; 

void setup () {
  frameRate(120);
  background(0);
  size (600, 400);

  //INITIALIZE. give 'em values - zero for now.
  for (int i = 0; i < xposn.length; i ++) {
    xposn[i] = 0;
  }

  for (int i = 0; i< yposn.length; i++) {
    yposn[i] = 0;
  }
}
void draw() {

  //SHIFT INDEX POSN to accomodate new values
  for (int i = 0; i<xposn.length-1; i++) {
    xposn[i] = xposn[i+1];
    yposn[i] = yposn[i+1];
  }

  //ASSIGN LAST SPOT - give it mouseX
  xposn[xposn.length-1] = mouseX;
  yposn[yposn.length-1] = mouseY;

  //draw a circle for every value of i(each aray element)
  for (int i = 0; i <xposn.length; i++) {
    noStroke();
    fill(0, i, random(255));//white minus a decrementing value(49-0)
    ellipse(xposn[i], yposn[i], i, i);
  }
}
void keyReleased()
{
  if (key == 'r') {
    background (0);
  }
}

