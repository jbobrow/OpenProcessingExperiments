
import processing.pdf.*;

int x = 0;

// declare global variables
float earbigSize=35;
float inearbigSize=20;
float earsmallSize=35;
float inearsmallSize=20;
float blackeyeSize=20;
float noseSize;
float blackeyeColor; 
float noseoneColor=94;
float nosetwoColor=143;
float nosethreeColor=155;
float haironeColor=232;
float hairtwoColor=67;
float hairthreeColor=199;
float fangColor=255;
float fangcolor=255;
float eyewhiteSize=40;
float eyebrowoneColor=232;
float eyebrowtwoColor=67;
float eyebrowthreeColor=199;
float eyebrowoneSize=15;
float eyebrowtwoSize=-30;
float mouthoneColor=0;
float mouthtwoColor=0;
float mouththreeColor=0;
float headoneSize=200;
float headtwoSize=150;

void setup(){
  size (3525,5325);
  background (100,100,100);
  noStroke();
  beginRecord(PDF, "end.pdf");
  translate(146.87,146.87);
  repeatShape();
  endRecord();
  
}

void repeatShape(){
  for (int i=0; i < 260; i++){
    println("MEH" + i); 
    makeShape();
      eyewhiteSize = random(10, 40);
  blackeyeSize = eyewhiteSize/2;
  fangColor = random (140, 255);
  haironeColor = random(0,255);
  hairtwoColor = random(0,255);
  hairthreeColor = random(0,255);
  eyebrowoneSize = random(0,60);
  eyebrowtwoSize = random(-70,-10);
  mouthoneColor = random(0,200);
  mouthtwoColor = mouthoneColor;
  mouththreeColor = mouthoneColor;
  headoneSize = random(180,220);
  headtwoSize = random(130,170);
  earbigSize = random(35,55);
  inearbigSize = random(20,40);
  earsmallSize = random(10,35);
  inearsmallSize = random(5,20);
  noseSize = random(0,15);
  blackeyeColor = random(0,255);
  noseoneColor = random(80,100);
  nosetwoColor = random(0,143);
  nosethreeColor = random(133,255);
  fangcolor = random(0,255);
  fangColor = random(255,255);
  eyebrowoneColor = random(0,255);
  eyebrowtwoColor = random(0,255);
  eyebrowthreeColor = random(0,255);
    translate(293.75,0);
    x++;
    if (x == 12){
     x = 0;
     translate(-3525,293.75);
    }
  }
}

void draw (){
  
}

void makeShape(){
 float shapeColor[] = {random(0,255), random(0,255), random(0,255)};
 fill (shapeColor[0], shapeColor[1], shapeColor[2]);
 
 // hair back
  noStroke();
  fill(haironeColor, hairtwoColor, hairthreeColor);
  ellipse(65, -17, 57, 170);
  ellipse(-65, -17, 57, 170);
 
  // ears outside
  fill(230, 182, 115);
  ellipse(75, 5, earsmallSize, earsmallSize);
  fill(230, 182, 115);
  ellipse(-75, -5, earbigSize, earbigSize);
 
  // ears inside
  fill(204, 164, 108);
  ellipse(75, 5, inearsmallSize, inearsmallSize);
  fill(204, 164, 108);
  ellipse(-75, -5, inearbigSize, inearbigSize);
 
  // head
  fill(230, 182, 115);
  ellipse(0, 0, headtwoSize, headoneSize);
 
  // eyes white
  fill(255, 255, 255);
  ellipse(25, -15, eyewhiteSize, eyewhiteSize);
 
  // nose
  pushMatrix();
  translate(0, 10);
  fill(noseoneColor, nosetwoColor, nosethreeColor);
  triangle(0, noseSize, -12, 16, 12, 16);
  popMatrix();
 
  // eyes
  fill(255, 255, 255);
  ellipse(-25, -15, eyewhiteSize, eyewhiteSize);
  // eyes black
  fill(blackeyeColor, 0, 0);
  ellipse(23, -15, blackeyeSize, blackeyeSize);
  ellipse(-25, -15, blackeyeSize, blackeyeSize);
 
  // mouth
  fill (mouthoneColor, mouthtwoColor, mouththreeColor);
  arc(0, 45, 70, 50, 0, PI/1.5+QUARTER_PI, OPEN);
 
  // hair top
  fill(haironeColor, hairtwoColor, hairthreeColor);
  ellipse(0,-100,140,60);
  fill(230,182,115);
  triangle(20,-60,10,-60,-10,-80);
 
  // fangs
  fill(fangColor, fangcolor, fangcolor);
  triangle(-7, 50, -30, 50, -20, 60);
  triangle(30, 45, 5, 47, 15, 60);
 
  // eyebrows
  fill(eyebrowoneColor, eyebrowtwoColor, eyebrowthreeColor);
  triangle(-20, -59, 0, -45, -55, -45);
  triangle(30, -60, 10, -45, 60, -44);
}



