
float rad;
float xPos, yPos;
float yChange;
boolean totheleft;
 
 
void setup() {
  size(400, 400);
 
  rad = 100;
 
  yPos = height/2;
  totheleft = false;
}
 
void draw() {
  background(0);
  yChange = sin(frameCount * 0.2) * rad;
  ellipse (xPos, yPos + yChange, 40, 40);

  if (totheleft==false) {
    xPos=xPos+5;
  
    if (xPos>400) {
      totheleft=true;
    }
  }
  
  
  else {
    xPos=xPos-5;
    if (xPos<0) {
      totheleft=false;
    }
  }
}


