
/*
    Tiffany Vedua - Week 3
    RAINBOW KITTIES
*/
 
boolean change = false;
String keyPrompt = "press any key";
float eyeSize[] = {50,75};
float irisSize[] = {40,50};
float irisColor[] = {0,255,0,255,0,255};
float pupilSize[] = {15,40};
float faceSize[] = {200,275};
float furColor[] = {0,255,0,255,0,255};
float whiskerSize[] = {30,90};
float kittySwag[] = {-150,40};
float _irisSize = 45;
float _irisColorR = 0;
float _irisColorG = 0;
float _irisColorB = 0;
float _furColorR = 0;
float _furColorG = 0;
float _furColorB = 0;
float _eyeSize = 65;
float _pupilSize = 20;
float _faceSize = 250;
float _whiskerSize = 75;
float _kittySwag = -10;

 
void setup(){
  size(300, 300);
  background(149,143,143);
  textSize(12);
}
 
void draw(){
  cat();
  smooth();
  text(keyPrompt,-145,-135);
}
 
void keyPressed(){
  _eyeSize = random(eyeSize[0],eyeSize[1]);
  _irisColorR = random(irisColor[0],irisColor[1]);
  _irisColorG = random(irisColor[2],irisColor[3]);
  _irisColorB = random(irisColor[4],irisColor[5]);
  _pupilSize = random(pupilSize[0],pupilSize[1]);
  _faceSize = random(faceSize[0],faceSize[1]);
  _furColorR = random(furColor[0],furColor[1]);
  _furColorG = random(furColor[2],furColor[3]);
  _furColorB = random(furColor[4],furColor[5]);
  _whiskerSize = random(whiskerSize[0],whiskerSize[1]);
  _kittySwag = random(kittySwag[0],kittySwag[1]);
      
  keyPrompt = ("");
}
 
void cat(){
  background(149,143,143);
  noStroke();
  rectMode(CENTER);
  translate(150,150);
   
  //FACE
  fill(_furColorR,_furColorG,_furColorB); 
  ellipse(0,0,_faceSize,_faceSize);
  
  //EARS
  triangle(-130,-130,-10,-90,-90,-10);
  triangle(10,-90,90,-10,130,-130);
   
  //EYES
  fill(255); 
  ellipse(-40, -45, _eyeSize, _eyeSize);
  ellipse(40, -45, _eyeSize, _eyeSize);
  fill(_irisColorR,_irisColorG,_irisColorB);
  ellipse(-40,-45,_irisSize,_irisSize);
  ellipse(40,-45,_irisSize,_irisSize);
  fill(0);
  ellipse(-40, -45, _pupilSize, _pupilSize);
  ellipse(40, -45, _pupilSize, _pupilSize);
  
  //MOUTH
  strokeWeight(3);
  stroke(0); 
  line(-1,0,0,65);
  noFill();
  arc(-25,65,50,50,0,PI);
  arc(25,65,50,50,0,PI);  
  
  //NOSE
  strokeWeight(3);
  stroke(0); 
  line((_whiskerSize*-1),0,_whiskerSize,0);      //    WHISKERS
  line((_whiskerSize*-1),15,_whiskerSize,15);
  noStroke();
  fill(245,173,220);
  triangle(0,25,-25,-5,25,-5);

  //DOTS
  fill(0);
  //LEFT
  ellipse(-100,-5,5,5);
  ellipse(-90,-5,5,5);
  ellipse(-95,5,5,5);
  //RIGHT
  ellipse(100,-5,5,5);
  ellipse(90,-5,5,5);
  ellipse(95,5,5,5);
  
  //TEXT
  textSize(22);
  fill(255,255,255);
  text("#KittySwag",_kittySwag,145);
   

}



