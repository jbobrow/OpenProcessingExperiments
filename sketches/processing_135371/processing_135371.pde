
boolean flipFlop = false;
String keyPrompt = "press any key";

float bblGum[] = {40,180};
float eyePlace[] ={0,40};
float eyeSize[] ={50,70};

float _bblGum = 100;
float _eyePlace = -10;
float _eyeSize = 55;

void setup(){
  size(300, 300);
  background(56,78,234);
  textSize(12);
}

void draw(){
  makeFace();
  smooth();
  text(keyPrompt,-145,-135);
}

void keyPressed(){
  _bblGum = random(bblGum[0],bblGum[1]);
  _eyePlace = random(eyePlace[0],eyePlace[1]);
  _eyeSize = random(eyeSize[0],eyeSize[1]);
  keyPrompt = ("");
 }

void makeFace(){
  background(56,78,234);
  noStroke();
  translate(150,150);
//head
  fill(222,190,131);
  ellipse(0,0,210,210);
  ellipse(-90, 10, 65, 65); 
  ellipse(90, 10, 65, 65);
  
  fill(71,61,70);
  ellipse(-50, -10, 65, 55); 
  ellipse(50, -10, 65, 55);
  
  fill(222,190,131);
  ellipse(-50, 35, 60, 60); 
  ellipse(50, 35, 60, 60);
  
  fill(225);
  ellipse(-50, -15, _eyeSize, _eyeSize); 
  ellipse(50, -15, _eyeSize, _eyeSize);
  
  fill(0);
  ellipse(-50, -15, _eyePlace, _eyePlace); 
  ellipse(50, -15, _eyePlace, _eyePlace);
 
  
  fill(252,124,205);
  ellipse(0,50, _bblGum, _bblGum);
    
   fill(245,24,164);
  ellipse(0, 50, 45, 35);
  fill(0);
  ellipse(0, 50, 30, 20);

}


