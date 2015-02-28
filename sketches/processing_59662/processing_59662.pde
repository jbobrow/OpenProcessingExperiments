
/*
On clicking the mouse records the point a mouse is clicked at called mcY then mesures 
 the y distance between that point and the current mouse position called dY. 
 The distance between the towo points is called dYs which is then +() 
 to coordinate cY which can be used to move things.
 Upon relese of the the mouse cY retains its last value.
 Wholely written by langt.
 */


PImage webImg, hostImg;
//for loading the image at pixel size
//size(webImg.width, webImg.height);

//relVariables
int  mcY, dY, dYs, cY, cYi;
int  mcX, dX, dXs, cX, cXi;

void setup() {
  size(400, 400);
  cY = height/2;
  cX = width/2;
  //webImg = loadImage("http://maps.google.com/staticmap?center=45.28220,4.830321&zoom=8&size=1000x200&maptype=roadmap&key=ABQIAAAAaHAby4XeLCIadFkAUW4vmRSkJGe9mG57rOapogjk9M-sm4TzXxR2I7bi2Qkj-opZe16CdmDs7_dNrQ.gif");
  //image(webImg,cY,cX);
  hostImg = loadImage("Screen Shot 2012-04-22 at 11.54.35 AM.png");
  image(hostImg,cXi,cYi);
}



void draw() {
  background(0);
  relMovement();
  relIndicators();
  //image(webImg,cXi,cYi);
  image(hostImg,cXi,cYi);
}

void mousePressed() {
  mcY = mouseY+ cY; // sets anchor location to before dragging
  mcX = mouseX+ cX; // sets anchor location to before dragging
}
void mouseDragged() {
  dY = mouseY;
  dYs = mcY-dY;

  dX = mouseX;
  dXs = mcX-dX;
}


void relMovement() {  
  cY += dYs-(cY);//for normal movement
  cYi = -cY;// for inverted movement

  cX += dXs-(cX);//for inverted movement
  cXi = -cX;// for normal movement
}

void relIndicators() {
  fill(255,255,0);
  rect(cXi+width/2,cYi+height/2,10,10);
  //The numbers

  println("Anchor        "+mcY +" "+ mcX);
  println("Current point "+ dY +" "+ dX);
  println("Diffrence     "+ dYs +" "+ dXs);
  println("last value    "+ cY +" "+ cX);
  println("last value    "+ cYi +" "+ cXi);
}


