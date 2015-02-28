

//
// a viewer of the "gcd grid": (i,j) is "on" if gcd(i,j)=1, "off" otherwise.
//
// Matthew M. Conroy April 2010
// 
// www.matthewconroy.com
//

int xOffset = 0;
int yOffset = 0;
int xIncrement=1;
int yIncrement=1;
int squareSize=10;

void setup(){
  size(600,600);

  PFont fontA = loadFont("CourierNew36.vlw");
  textFont(fontA, 14);
   
}

void draw(){

  background(0);

  for(int i=0; i<=width*0.8/squareSize;++i) {
     for(int j=0; j<=height*0.8/squareSize;++j) {
         int x = i+xOffset;
         int y = j+yOffset;
         if ((x>0) && (y>0) && (gcd(x,y)==1)) {
            fill(255);
            rect(i*squareSize+0.1*width,height-j*squareSize-0.1*height,squareSize,squareSize);
         }

     }
  }

  // make sure the bottom space is clear for text
  fill(0);
  rect(0,height*0.9,width,height*0.1);
  
  // add text
  fill(158,240,140);
  smooth();
  int xLoc = int((mouseX-0.1*width)/squareSize)+xOffset;
  int yLoc = int((height-0.1*height-mouseY)/squareSize+1)+yOffset;
  text("x= "+xLoc+" y = "+yLoc+" (move grid with arrow keys)",width*0.15,height-43);
  text("arrow increment "+xIncrement+" (change with k/l)",width*0.15,height-28);
  text("click to zoom and center, 'a' key zooms out",width*0.15,height-13);

}

void keyPressed() {
  // move around with arrow keys
  if (keyCode == UP) {
      yOffset+=yIncrement;
  }
  if (keyCode == DOWN) {
      yOffset-=yIncrement;
  }
  if (keyCode == LEFT) {
      xOffset-=xIncrement;
  }
  if (keyCode == RIGHT) {
      xOffset+=xIncrement;
  }
 
   if (key == 'a') { // zoom out, keeping same center - nothing happens if squareSize<=2
      if (squareSize>2) { 
      int xLoc = int((0.5*width-0.1*width)/squareSize)+xOffset;
      int yLoc = int((0.5*height-0.1*height)/squareSize)+yOffset;
      squareSize = squareSize/2;
      xOffset = xLoc-int(0.4*width/squareSize);
      yOffset = yLoc-int(0.4*height/squareSize);
     }
  }
  
  // increase/decrease the step size used for the arrow keys
  
  if (key == 'l') {
     xIncrement *=10;
     yIncrement *=10;
  }
  if (key == 'k') {
     xIncrement /= 10;
     if (xIncrement<1) { 
       xIncrement=1;
     }
     yIncrement = xIncrement; 
  }
}

void mouseClicked() { // on mouseclick, zoom in and center
  
  int xLoc = int((mouseX-0.1*width)/squareSize)+xOffset;
  int yLoc = int((height-0.1*height-mouseY)/squareSize+1)+yOffset;
  
    squareSize *=2;
    xOffset = xLoc-int(0.4*width/squareSize);
    yOffset = yLoc-int(0.4*width/squareSize);
}

int gcd(int n1, int n2){ // gcd function
   int a=n1;
   int b=n2;
   int temp=0;
   if (b>a) {
       temp=b;
       b=a;
       a=temp;
   }
   while(b>0) {
     temp = (a % b);
     a=b;
     b=temp;
   }
   return(a);
}

     

