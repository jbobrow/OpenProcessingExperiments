
//Global Variables
//Declare it's name and assign it a value
int xPos=225;
int yPos=225;
int d=55;

void setup() {
  size(450, 450);

  smooth();
  stroke(255, 100);
  strokeWeight(3);
noFill();

}

void draw() {
  background(126, 175, 103);

  
  for(float c=.3; c<11;c++){
    for(float r=.3; r<11;r++){
    drawTile(40 * c,40*r,d);
    }
  }
  
}

void drawTile(float xPos, float yPos, float d) {
  ellipse(xPos+10, yPos+10, d, d);
  ellipse(xPos+20, yPos+10, d, d); 
  ellipse(xPos+10, yPos+20, d, d);
  ellipse(xPos+20, yPos+20, d, d);
}


