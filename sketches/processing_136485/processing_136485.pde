
boolean flipFlop = false;
String keyPrompt = "press any key";
float eyeBallDiam[] = {30,50};
float pupilDiam[] = {10,35};
float eyeBrowLoc[] = {-35,-10};
float mouthWidth[] = {25,45};
float headWidth[] = {175,100};
float headHeight[] = {145,215};
float noseHeight[] = {-10,10};
float hairColor[] = {0,255,0,255,0,255};
float _hairColorR = 0;
float _hairColorG = 0;
float _hairColorB = 0;
float _eyeBallDiam = 40;
float _pupilDiam = 25;
float _eyeBrowLoc = -10;
float _mouthWidth = 50;
float _headWidth = 150;
float _headHeight = 200;
float _noseHeight;

void setup(){
  size(300, 300);
  background(255,154,219);
  textSize(12);
}
  
void draw(){
  makeFace();
  smooth();
  text(keyPrompt,-125,-145);

      
  }
  void keyPressed(){
  _eyeBallDiam = random(eyeBallDiam[0],eyeBallDiam[1]);
  _pupilDiam = random(pupilDiam[0],pupilDiam[1]);
  _eyeBrowLoc = random(eyeBrowLoc[0],eyeBrowLoc[1]);
  _mouthWidth = random(mouthWidth[0],mouthWidth[1]);
  _headWidth = random(headWidth[0],headWidth[1]);
  _headHeight = random(headHeight[0],headHeight[1]);
  _hairColorR = random(hairColor[1],hairColor[2]);
  _hairColorG = random(hairColor[4],hairColor[5]);
  _hairColorB = random(hairColor[4],hairColor[1]);
   
  _noseHeight = random(noseHeight[0],noseHeight[1]);
   
  keyPrompt = ("");

 
    
  
 }
void makeFace(){
  background(247,195,23);
  noStroke();
  rectMode(CENTER);
  // this is important - changes zero location for all future coordinates
  translate(150,150);

// head
  fill(26,159,247); 
  ellipse(-1 * _headWidth/2, 0, 40, 40); 
  ellipse(_headWidth/2, 0, 40, 40);
  fill(21,137,141); 
  rect(0, 0, _headWidth, _headHeight, 40);
  ellipse(2, _headHeight/2, _headWidth/10, 30);   
  ellipse(-1 * _headWidth/2, 0, 20, 20); 
  ellipse(_headWidth/2, 0, 20, 20);
   
  // hair
  fill(_hairColorR,_hairColorG,_hairColorB);
  rect(0, -1 * _headHeight/2 + 55, _headWidth, 50, 40, 40, 0, 0);
   
   
  // eyes
  fill(208,112,255); 
  ellipse(-45.5, 0, _eyeBallDiam, _eyeBallDiam);
  ellipse(45.5, 0, _eyeBallDiam, _eyeBallDiam);
  fill(255,247,0);
  ellipse(40, 0, _pupilDiam, _pupilDiam);
  ellipse(-40, 0, _pupilDiam, _pupilDiam);
  fill(_hairColorR,_hairColorG,_hairColorB);
  
   
  // nose
  fill(224,156,112); 
  pushMatrix();
  translate(0,_noseHeight);
  popMatrix();
   
   // mouth
  fill(0,218,145); 
  ellipse(0, _noseHeight + 60, _mouthWidth, 15);
  strokeWeight(5);
  stroke(100,145,200); 
  line(-25, _noseHeight + 75, 25, _noseHeight + 75);  
}



