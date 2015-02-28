
// draw a simple interactive face
// www.taylorhokasnson.com

boolean flipFlop = false;
String keyPrompt = "press any key";
int eyeBallDiam;
int eyeBrowLoc;
int mouthWidth;

void setup(){
  size(300, 300);
  background(240,237,194);
  textSize(12);
}

void draw(){
  if (flipFlop == false){
    eyeBallDiam = 30;
    eyeBrowLoc = -10;
    mouthWidth = 50;
  }
  if (flipFlop == true){
    eyeBallDiam = 40;
    eyeBrowLoc = -30;
    mouthWidth = 35;
  }
  makeFace();
  smooth();
  text(keyPrompt,-145,-135);
}

void keyPressed(){
  flipFlop =! flipFlop;
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
  ellipse(-75, 0, 40, 40);  
  ellipse(75, 0, 40, 40);
  fill(244,176,132);  
  rect(0, 0, 150, 200, 40); 
  ellipse(0, 100, 50, 25);    
  ellipse(-75, 0, 20, 20);  
  ellipse(75, 0, 20, 20);
  
  // hair
  fill(0,0,0);
  rect(0, -75, 150, 50, 40, 40, 0, 0);
  
  // part
  fill(244,176,132);  
  // push and pop let us apply a one-time change to the location of XY zero
  // this is useful for things like triangles that are located by multiple points in space
  pushMatrix();
  translate(-20,-75);
  triangle(-15, 0, -15, 25, 0, 25); 
  popMatrix(); 
  
  // eyes
  fill(255);  
  ellipse(-37.5, 0, eyeBallDiam, eyeBallDiam);
  ellipse(37.5, 0, eyeBallDiam, eyeBallDiam); 
  fill(0);  
  ellipse(-37.5, 0, 15, 15);
  ellipse(37.5, 0, 15, 15);
  rect(-37.5, eyeBrowLoc, 40, 20);
  rect(37.5, eyeBrowLoc, 40, 20); 
  
  // nose
  fill(224,156,112);  
  triangle(0, 0, -15, 50, 15, 50);  
  
   // mouth
  fill(224,156,112);  
  ellipse(0, 75, mouthWidth, 25); 
  strokeWeight(3); 
  stroke(244,176,132);  
  line(-25, 75, 25, 75);   
}


