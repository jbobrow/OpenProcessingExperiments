
//variaÃ�Â§Ã�Â£o do cÃ�Â­rculo fantasmÃ�Â¡tico

//x and y positions
//declare two arrays with 50 elements

int [] xpos = new int [50];
int [] ypos = new int [50];

void setup() {
  size(800,800);
  frameRate(15);
  smooth();
  
  //initialize all elements of each array to zero
  for (int i = 0; i < xpos.length; i++) {
    xpos[i] = 0;
    ypos[i] = 0;
  }
}

void draw() {
  background(98,17,17);
  
  //shift all elements down one spot. xpos[0] = xpos[1], xpos[1] = xpos[2], etc.
  //Stop at the second to last element.
  for (int i = 0; i < xpos.length-1; i++) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  //update the last spot in the array with the mouse location
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
  
  //draw an ellipse for each element in the arrays.
  //color is tied to the loop's counter: i.
  for (int i = 0; i < xpos.length; i++) {
    noStroke();
    fill(140, 65, i*10, 15);
    ellipse(xpos[i], ypos[i], 300, 300);
    noCursor();
  }
}


