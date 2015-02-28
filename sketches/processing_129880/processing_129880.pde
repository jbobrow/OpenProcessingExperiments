
// draw a parametric face
// www.taylorhokasnson.com

boolean flipFlop = false;
String keyPrompt = "press any key";
float eyeBallDiam[] = {20,40};
float pupilDiam[] = {5,20};
float eyeBrowLoc[] = {-35,-10};
float mouthWidth[] = {35,55};
float headWidth[] = {125,200};
float headHeight[] = {175,225};
float noseHeight[] = {-10,10};
float hairColor[] = {0,255,0,255,0,255};
float _hairColorR = 0;
float _hairColorG = 0;
float _hairColorB = 0;
float _eyeBallDiam = 30;
float _pupilDiam = 15;
float _eyeBrowLoc = -10;
float _mouthWidth = 50;
float _headWidth = 150;
float _headHeight = 200;
float _noseHeight;

void setup(){
  size(300, 300);
  background(240,237,194);
  textSize(12);
}

void draw(){
  makeFace();
  smooth();
  text(keyPrompt,-145,-135);
}

void keyPressed(){
  _eyeBallDiam = random(eyeBallDiam[0],eyeBallDiam[1]);
  _pupilDiam = random(pupilDiam[0],pupilDiam[1]);
  _eyeBrowLoc = random(eyeBrowLoc[0],eyeBrowLoc[1]);
  _mouthWidth = random(mouthWidth[0],mouthWidth[1]);
  _headWidth = random(headWidth[0],headWidth[1]);
  _headHeight = random(headHeight[0],headHeight[1]);
  _hairColorR = random(hairColor[0],hairColor[1]);
  _hairColorG = random(hairColor[2],hairColor[3]);
  _hairColorB = random(hairColor[4],hairColor[5]);
  
  // did this one a little different for the example
  _noseHeight = random(noseHeight[0],noseHeight[1]);
  
  keyPrompt = ("");
}

void makeFace(){
  background(240,237,194);
  noStroke();
  rectMode(CENTER);
  // this is important - changes zero location for all future coordinates
  translate(150,150);
  
  // head
  fill(224,156,112);  
  ellipse(-1 * _headWidth/2, 0, 40, 40);  
  ellipse(_headWidth/2, 0, 40, 40);
  fill(244,176,132);  
  rect(0, 0, _headWidth, _headHeight, 40); 
  ellipse(0, _headHeight/2, _headWidth/3, 25);    
  ellipse(-1 * _headWidth/2, 0, 20, 20);  
  ellipse(_headWidth/2, 0, 20, 20);
  
  // hair
  fill(_hairColorR,_hairColorG,_hairColorB);
  rect(0, -1 * _headHeight/2 + 25, _headWidth, 50, 40, 40, 0, 0);
  
  // part
  fill(244,176,132);  
  // push and pop let us apply a one-time change to the location of XY zero
  // this is useful for things like triangles that are located by multiple points in space
  pushMatrix();
  translate(-20,-1 * _headHeight/2 + 26);
  triangle(-15, 0, -15, 25, 0, 25); 
  popMatrix(); 
  
  // eyes
  fill(255);  
  ellipse(-37.5, 0, _eyeBallDiam, _eyeBallDiam);
  ellipse(37.5, 0, _eyeBallDiam, _eyeBallDiam); 
  fill(0);
  ellipse(-37.5, 0, _pupilDiam, _pupilDiam);
  ellipse(37.5, 0, _pupilDiam, _pupilDiam);
  fill(_hairColorR,_hairColorG,_hairColorB);
  rect(-37.5, _eyeBrowLoc, 40, 20);
  rect(37.5, _eyeBrowLoc, 40, 20); 
  
  // nose
  fill(224,156,112);  
  pushMatrix();
  translate(0,_noseHeight);
  triangle(0, 0, -15, 50, 15, 50); 
  popMatrix(); 
  
   // mouth
  fill(224,156,112);  
  ellipse(0, _noseHeight + 75, _mouthWidth, 25); 
  strokeWeight(3); 
  stroke(244,176,132);  
  line(-25, _noseHeight + 75, 25, _noseHeight + 75);   
}


