
// taylorhokanson.com
// using arrays, random(), and vairables to move objects 
// in relation to one another

float eyeLocation = 30;
float pupilLocation = 0;
String keyPrompt = "press any key";

void setup(){
  background(100);
  size(200,200);
  noStroke();
  textSize(12);  
  
}

void draw(){
  makeFace();
  text(keyPrompt,-90,-80);
}

void keyPressed(){
  eyeLocation = random(20,35);
  pupilLocation = random(-10,10);
  keyPrompt = ("");
}

void makeFace(){  
  background(100);
  translate(100,100);

  // head
  fill(224,156,112);  
  ellipse(0,0,100,100);
  
  // eyes
  // whites
  fill(255);
  ellipse(-1 * eyeLocation,0,25,25);
  ellipse(eyeLocation,0,25,25);
  
  // pupils
  fill(0);
  ellipse(-1 * eyeLocation + pupilLocation,0,5,5);
  ellipse(eyeLocation + pupilLocation,0,5,5);
}


