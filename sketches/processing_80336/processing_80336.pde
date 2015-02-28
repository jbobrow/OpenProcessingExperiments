
int numRect;
int widthRect[];
int heightRect[];
int marginX;
int marginY;

void setup() {
  size (800, 600);
  background(0);

  numRect=30;
  marginX=round(width*0.01);  //10% of the width
  marginY=round(height*0.01); //10% of the height
  widthRect=new int[numRect];
  for (int i=0; i<numRect; i++) {
    widthRect[i]=round((width-(marginX*numRect))/numRect); //it's calculated the available measure "without the margins" (width - total margin) and it's divided by numRect
  }
  heightRect=new int[numRect];
  for (int i=0; i<numRect; i++) {
    heightRect[i]=round((height-(marginY*numRect))/numRect); //it's calculated the available measure "without the margins" (width - total margin) and it's divided by numRect
  }

  fill(255);
  noStroke();
}

void draw() {
  background(0);

  for (int i=0; i<numRect; i++) {
    int dx=abs(mouseX-(i*(widthRect[i]+marginX)));//substract the mouse x position to the rect x position
    float fx=map(dx, 0, width, 0, 1); //rescale the data 

    for (int j=0; j<numRect; j++) {
      int dy=abs(mouseY-(j*(heightRect[i]+marginY)));//substract the mouse y position to the rect y position
      float fy=map(dy, 0, width, 0, 1); //rescale the data 

      rect(i*(widthRect[i]+marginX), j*(heightRect[i]+marginY), widthRect[i]*fx, heightRect[i]*fy); //the width and heigh are scaled by fx and fy
    }
  }
  
}



