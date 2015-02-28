
class moire{

  int posX;
  int posY;
  int type;
  int divs;
  float angle;

  moire(){}

  moire(int iPosX, int iPosY, int iType, int iDivs){
    resetProperties(iPosX, iPosY, iType, iDivs);


  }

  void resetProperties(int iPosX, int iPosY, int iType, int iDivs){
    posX = iPosX;
    posY = iPosY;
    divs = iDivs;
    angle = PI / 1.0 / ((float)divs);


  }

  void drawSegment(float fAngle, float fAngleOffset){

    int posV1X = posX + width * cos(fAngle + fAngleOffset);
    int posV1Y = posY + height * sin(fAngle + fAngleOffset);

    int posV2X = posX + width * cos(fAngle + angle + fAngleOffset);
    int posV2Y = posY + height * sin(fAngle + angle + fAngleOffset);

    fill(0);
    stroke(0);
    strokeWeight(0);

    beginShape();
    vertex(posX,posY);
    vertex(posV1X,posV1Y);
    vertex(posV2X,posV2Y);

    endShape(CLOSE);

  }

  void drawSegments(float fAngleOffset){

    for(int i = 0; i < divs; i++)
      drawSegment(((float)i)*angle*2.0,fAngleOffset);


  }

/*
  boolean sideTest(int iPosX, int iPosY, int iSide){
    int lengthX = iPosX - posX;
    int lengthY = iPosY - posY;
    int posMinX = -posX;
    int posMinY = -posY;
    int posMaxX = iPosX - posX;
    int posMaxY = iPosY - posY;
    float angleXY = atan2(lengthY,lengthX);

    float angle11 = atan2(posMaxY, posMaxX);
    float angle01 = atan2(posMaxY, posMinX);
    float angle00 = atan2(posMinY, posMinX);
    float angle10 = atan2(posMinY, posMaxX);

    float angleMin, angleMax;

    iSide = iSide % 5;
    switch(iSide){
      case 0:
        angleMin = angle10;
        angleMax = angle11;
      break;
      case 1:
        angleMin = angle11;
        angleMax = angle01;
      break;
      case 2:
        angleMin = angle01;
        angleMax = angle00;
      break;
      case 3:
        angleMin = angle00;
        angleMax = angle10;
      break;
      case 4:
        angleMin = angle10;
        angleMax = angle11;
      break;
    }
    if((angleXY >= angleMin) && (angleXY <= angleMax))
      return true;
    else
      return false;


  }
*/

}

moire moireOne;
moire moireTwo;


void setup(){
  size(500, 500);
  int divs = 64;
  int frames = 2;
  // frameRate(frames);
  moireOne = new moire(width/2,height*7/15,0,divs);
  moireTwo = new
  moire(width/2,height*8/15,0,divs);
}

void draw(){
  background(255);
  float fSpeed = 0.01;
  //moireOne.drawSegment(TWO_PI/8.0*0.0,0.0);
  //moireOne.drawSegments(0.0);
  /*
  moireOne.drawSegments(((float)mouseX/((float)width))*QUARTER_PI);
  moireTwo.drawSegments(((float)mouseY/((float)height))*QUARTER_PI);
  */
  moireOne.drawSegments(-1*((float)frameCount)*fSpeed*QUARTER_PI);
  moireTwo.drawSegments(((float)frameCount)*fSpeed*QUARTER_PI);
}

void mousePressed(){

  int divsOne = moireOne.divs;
  int divsTwo = moireTwo.divs;
    
  float angleOne = moireOne.angle;
  float angleTwo = moireTwo.angle;

  int minDivs = 16;
  int maxDivs = 256;

  if (mouseButton == LEFT) {
    if(divsOne > minDivs){       
      divsOne /= 2;
      angleOne = PI / 1.0 / ((float)divsOne);
    }
    if(divsTwo > minDivs){       
      divsTwo /= 2;
      angleTwo = PI / 1.0 / ((float)divsTwo);
    }
  } else if (mouseButton == RIGHT) {
    if(divsOne < maxDivs){       
      divsOne *= 2;
      angleOne = PI / 1.0 / ((float)divsOne);
    }
    if(divsTwo < maxDivs){       
      divsTwo *= 2;
      angleTwo = PI / 1.0 / ((float)divsTwo);
    }
  }
  
  /*
  println(" divsOne = " + divsOne);
  println(" divsTwo = " + divsTwo);
  println(" angleOne = " + angleOne);
  println(" angleTwo = " + angleTwo);
  */
  
  moireOne.divs = divsOne;
  moireTwo.divs = divsTwo;
  moireOne.angle = angleOne;
  moireTwo.angle = angleTwo;
  
}
