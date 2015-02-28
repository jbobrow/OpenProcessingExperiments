
int[] xpos= new int[50];
int[] ypos= new int[50];



void setup() {
  for (int i=0; i<xpos.length; i++) {
    xpos[i]=0;
    ypos[i]=0;
  }
  size(255,255);
  smooth();
}
void draw() {
background(0);

// Start with i as 0
int i = 0;
int j = 0;
// While i is less than the width of the window
while (i < width) {
noStroke();
float distance = abs(mouseX - i);
fill(distance,mouseY,mouseX);
rect(i,0,10,height);
// Increase i by 10
i += 10;
}
xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
   for (int k=0; k<xpos.length-1; k++) {
    xpos[k]=xpos[k+1];
    ypos[k]=ypos[k+1];
  }
  
  //Draw an ellipse for each element in the array
  //Color and size are tied to the loop's counter: i
  for (int k=0; k<xpos.length; k++) {
    noStroke();
    fill(255-k*5,255,255,255-k*5);
    ellipse(xpos[k],ypos[k],k,k);
  }

}


