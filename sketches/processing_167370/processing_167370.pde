
// Ex 9.6. THE SNAKE. 
// MOUSE TRAILS

//DECLARATION

int [] xposn = new int [50];
int [] yposn = new int [50]; 

void setup () {
  frameRate(12);
  size (600, 400);
  colorMode(HSB, 360, 100, 100, 1.0);

  background(#F7F3F2);
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
//  for (int i = 0; i<xposn.length-1; i++) {
//    xposn[i] = xposn[i+1];
//    yposn[i] = yposn[i+1];
//  }

  //ASSIGN LAST SPOT - give it mouseX
  xposn[xposn.length-1] = mouseX;
  yposn[yposn.length-1] = mouseY;

  //draw a circle for every value of i(each aray element)
  for (int i = 0; i <xposn.length; i++) {
    noStroke();
    fill(random(223), random(82), random(77));//white minus a decrementing value(49-0)
    rect(xposn[i], yposn[i], i, i);
  }
}
void keyReleased()
{
  if (key == 'r') {
    background (#F7F3F2);
  }
}

