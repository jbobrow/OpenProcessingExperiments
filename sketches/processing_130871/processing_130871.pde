
// HW #4
// Written by Kevin Kuntz
// Andrew ID: kkuntz
// © Kevin Kuntz  January 2014 Pittsburgh, Pa 15213  All Rights reserved
//click the mouse to change the color of the perspective lines
//use the keyboard to change the background color
//scroll to move in or out of the hall

float x,y,wd,ht;
float zTL,zTRX,zTRY,zBLX,zBLY,zBRX,zBRY;
float increment = .1;
float boundaryLX, boundaryLY;
float boundaryRX, boundaryRY;
float rectX1,rectY1,rectX2,rectY2,rectX3,rectY3,rectX4,rectY4;
float valueM = 255;
float valueR,valueG,valueB,valueKey;



void setup()
{
  size(400,400);
}
  
void keyPressed()
{
  valueR = random(255);
  valueG = random(255);
  valueB = random(255);
}

  
void draw()
{
//variables
  x = mouseX;
  y = mouseY;
  wd = width;
  ht = height;
  //quad control points
  rectX1 = mouseX - 0;
  rectY1 = mouseY - 0;
  rectX2 = mouseX - 0;
  rectY2 = height - mouseY;
  rectX3 = width - mouseX;
  rectY3 = height - mouseY;
  rectX4 = width - mouseX;
  rectY4 = mouseY - 0;
  //stopping boundaries
  boundaryLX = (.75+zTL)*rectX1;
  boundaryLY = (.75+zTL)*rectY1;
  boundaryRX = (.25+zBRX)*rectX3+mouseX;
  boundaryRY = (.25+zBRY)*rectY3+mouseY;
//what is drawn
  background(valueR,valueG,valueB);
  rectMode(CENTER);
  noFill();
  stroke(valueM);
  //middle square
  quad((.5+zTL)*rectX1,(.5+zTL)*rectY1,(.5+zBLX)*rectX2,(.5+zBLY)*rectY2+mouseY,(.5+zBRX)*rectX3+mouseX,(.5+zBRY)*rectY3+mouseY,(.5+zTRX)*rectX4+mouseX,(.5+zTRY)*rectY4);
  //small square
  quad(boundaryLX,boundaryLY,(.75+zBLX)*rectX2,(.25+zBLY)*rectY2+mouseY,boundaryRX,boundaryRY,(.25+zTRX)*rectX4+mouseX,(.75+zTRY)*rectY4);
  //big square
  quad((.25+zTL)*rectX1,(.25+zTL)*rectY1,(.25+zBLX)*rectX2,(.75+zBLY)*rectY2+mouseY,(.75+zBRX)*rectX3+mouseX,(.75+zBRY)*rectY3+mouseY,(.75+zTRX)*rectX4+mouseX,(.25+zTRY)*rectY4);
  line(x , y, 0, 0);
  line(x , y , 0, ht);
  line(x, y, wd, 0);
  line(x, y, wd, ht);
}
 
void mousePressed()
{
  if (valueM == 0) {valueM = 255;} else {valueM = 0;}
}

void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  
  //moving forwards
  if (e < 0) {
    if ((boundaryRX - boundaryLX) < 350){
      //top left control
      zTL = zTL - increment;
      //top right control
      zTRX = zTRX + increment;
      zTRY = zTRY - increment;
      //bottom left control
      zBLX = zBLX - increment;
      zBLY = zBLY + increment;
      //bottom right control
      zBRX = zBRX + increment;
      zBRY = zBRY + increment;
    }
  }
  //moving backward
  else { 
    if ((boundaryRX - boundaryLX) > 5 ){
      //top left
      zTL = zTL + increment;
      //top right
      zTRX = zTRX - increment;
      zTRY = zTRY + increment;
      //bottom left
      zBLX = zBLX + increment;
      zBLY = zBLY - increment;
      //bottom right
      zBRX = zBRX - increment;
      zBRY = zBRY - increment;
    }
  }
}



