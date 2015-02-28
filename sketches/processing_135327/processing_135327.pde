
boolean flipFlop = false;
String keyPrompt = "press any key";
float eyeBallDiam[] = {20,40};
float pupilDiam[] = {5,20};
float mouthWidth[] = {10,35};
float headWidth[] = {150,250};
float headHeight[] = {125,300};
float noseHeight[] = {6,15};
float hairColor[] = {0,205,0,205,0,205};
float eyeColor[] = {0,255,0,255,0,255};
float faceColor[] = {230,255,180,200,130,150};
float _eyeColorA = 79;
float _eyeColorB = 197;
float _eyeColorC = 226;
float _hairColorR = 0;
float _hairColorG = 0;
float _hairColorB = 0;
float _faceColorD = 255;
float _faceColorE = 223;
float _faceColorF = 196;
float _eyeBallDiam = 30;
float _pupilDiam = 15;
float _mouthWidth = 30;
float _headWidth = 150;
float _headHeight = 200;
float _noseHeight;
 
  
 void setup(){
  size(500, 500);
  background(200);
  noStroke(); 
  rectMode(CENTER);
  
 }
 
 void draw(){
   makeFace();
   text(keyPrompt,-220,-180);
 }
 
 void keyPressed(){
  _eyeBallDiam = random(eyeBallDiam[0],eyeBallDiam[1]);
  _pupilDiam = random(pupilDiam[0],pupilDiam[1]);
  _mouthWidth = random(mouthWidth[0],mouthWidth[1]);
  _headWidth = random(headWidth[0],headWidth[1]);
  _headHeight = random(headHeight[0],headHeight[1]);
  _hairColorR = random(hairColor[0],hairColor[1]);
  _hairColorG = random(hairColor[2],hairColor[3]);
  _hairColorB = random(hairColor[4],hairColor[5]);
  _eyeColorA = random(eyeColor[0], eyeColor[1]);
  _eyeColorB = random(eyeColor[2], eyeColor[3]);
  _eyeColorC = random(eyeColor[4], eyeColor[5]);
  _faceColorD = random(faceColor[0],faceColor[1]);
  _faceColorE = random(faceColor[2],faceColor[3]);
  _faceColorF = random(faceColor[4],faceColor[5]);
  _noseHeight = random(noseHeight[0], noseHeight[1]);
}

void makeFace(){ 
  background(150);
  translate(250,250);
 
   
   
 // head
  fill(_faceColorD,_faceColorE,_faceColorF);
  ellipse(-1 * _headWidth/2, 0, 40, 40);
  ellipse(_headWidth/2, 0, 40, 40);
  fill(_faceColorD,_faceColorE,_faceColorF);
  rect(0, 0, _headWidth, _headHeight, 90);
  ellipse(-1 * _headWidth/2, 0, 20, 20);
  ellipse(_headWidth/2, 0, 20, 20);
 
   
   
// hair
  fill(_hairColorR, _hairColorG, _hairColorB);
  rect(0, -1 * _headHeight/2 + 25, _headWidth, 50, 40, 40, 0, 0);
  ellipse(-1 * _headWidth/2, -60, 80, 80);
  ellipse(-1.2 * _headWidth/2, -120, 60, 60);
  noStroke();
  ellipse(_headWidth/2, -60, 80, 80);
  ellipse(1.2 * _headWidth/2, -120, 60, 60);
 
// eyes
  fill(255);
  stroke(0);
  ellipse(-37.5, 0, _eyeBallDiam, _eyeBallDiam); //fourth place
  ellipse(37.5, 0, _eyeBallDiam , _eyeBallDiam);
  fill(_eyeColorA, _eyeColorB, _eyeColorC);
  ellipse(-37.5, 0, _pupilDiam, _pupilDiam);
  ellipse(37.5, 0, _pupilDiam, _pupilDiam);
  
   
 // nose
  noFill();
  pushMatrix();
  translate(0, _noseHeight);
  stroke(0);
  arc(0, _noseHeight, 30, 20, 0, PI);
  popMatrix();
  
 //mouth
 fill(255);
 ellipse(0, _noseHeight + 60, _mouthWidth, 45);
 noStroke();
 fill(_faceColorD,_faceColorE,_faceColorF);
 ellipse(0, _noseHeight + 42, _mouthWidth, 30);
  
   
}



