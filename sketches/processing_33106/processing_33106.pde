
int distanceFromPoint = 50;
int numOfCircles = 5;
int circleSize = 20;
float degreeStep = TWO_PI/numOfCircles; 
float angle = 0;
int StartDgreeStep = 3;

int distanceFromPoint2 = 175;
int numOfCircles2 = 8;
int circleSize2 = 12;
float degreeStep2 = TWO_PI/numOfCircles2; 

int distanceFromPointCats = 115;
int numOfCats = 2;
float degreeStepCats = TWO_PI/numOfCats; 
float angleCats; //the angle that i draw the next cat
int StartDgreeStepCats = 130; // starting point
PImage myImage;

PFont myFont;




void setup() 
{
  size(440, 440);
  background(0);
  noStroke();
  smooth();
  myImage = loadImage("cat.png");
  myFont = createFont("chunkfive", 24, true);
  colorMode(RGB, 256); //declare color mode+range
}


void draw() 
{

  
 //---- P ----///

  if (StartDgreeStepCats % 360<=72) {
    fill(230, 50, 30); // red
  } else if (StartDgreeStepCats % 360<=144) {
    fill(255, 255, 0); // yellow
  } else if (StartDgreeStepCats % 360<=216) {
    fill(255, 55, 135);// pink
  } else if (StartDgreeStepCats % 360<=288) {
    fill(100, 200, 30); // green
  } else if (StartDgreeStepCats % 360<=360) {
    fill(45, 90, 180);//blue
  }  
  
  textFont (myFont);
  text("P", width/2-7, height/2+8);

println(StartDgreeStepCats + " " + StartDgreeStepCats % 360);

  //---- Now CATS ----///

  angleCats = radians (StartDgreeStepCats);

  image (myImage, width/2 + cos(angleCats) * distanceFromPointCats, height/2 + sin(angleCats) * distanceFromPointCats);
  angleCats += degreeStepCats;  
  


  fill(255, 255, 0); // yellow
  ellipse(width/2 + cos(angleCats) * distanceFromPointCats, height/2 + sin(angleCats) * distanceFromPointCats, circleSize, circleSize);
  angleCats += degreeStepCats;  

  StartDgreeStepCats+=1; //inself = intself+1


    //---- Now rainbow ----///

  angle = radians (StartDgreeStep);

  fill(230, 50, 30); // red
  ellipse(width/2 + cos(angle) * distanceFromPoint, height/2 + sin(angle) * distanceFromPoint, circleSize, circleSize);
  angle += degreeStep;  

  fill(255, 255, 0); //yellow
  ellipse(width/2 + cos(angle) * distanceFromPoint, height/2 + sin(angle) * distanceFromPoint, circleSize, circleSize);
  angle += degreeStep;  

  fill(100, 200, 30);
  ellipse(width/2 + cos(angle) * distanceFromPoint, height/2 + sin(angle) * distanceFromPoint, circleSize, circleSize);
  angle += degreeStep;  

  fill(45, 90, 180);//blue
  ellipse(width/2 + cos(angle) * distanceFromPoint, height/2 + sin(angle) * distanceFromPoint, circleSize, circleSize);
  angle += degreeStep;  

  fill(255, 55, 135);// pink
  ellipse(width/2 + cos(angle) * distanceFromPoint, height/2 + sin(angle) * distanceFromPoint, circleSize, circleSize);
  angle += degreeStep;

  StartDgreeStep+=1; //inself = intself+1



    //---- Now second 2nd rainbow ----///

  angle = radians (StartDgreeStep);

  fill(100, 200, 30); // green
  ellipse(width/2 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, circleSize2, circleSize2);
  angle += degreeStep2;  

  fill(230, 50, 30);//red
  ellipse(width/2 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, circleSize2, circleSize2);
  angle += degreeStep2;  


  fill(255, 250, 50, random (0, 255)); //yellow
  ellipse(width/2 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, circleSize2, circleSize2);
  angle += degreeStep2;  


  fill(0, 0, 0, random (0, 255));//black
  ellipse(width/2 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, 22, 22);
  angle += degreeStep2;  


  fill(45, 90, 180, random (0, 255));
  ellipse(width/2 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, circleSize2, circleSize2);
  angle += degreeStep2;  

  fill(255, 55, 135, random (0, 255)); //pink
  ellipse(width/2 + cos(angle) * distanceFromPoint2, height/2 + sin(angle) * distanceFromPoint2, circleSize2, circleSize2);
  angle += degreeStep;

  StartDgreeStep+=1; //inself = intself+1
}


