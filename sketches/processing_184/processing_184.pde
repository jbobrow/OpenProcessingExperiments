

PFont f;
boolean instruct = true;
TextBoxMap theMap;

void setup(){
  size(640, 480);
  frameRate(40);
  PImage b = loadImage("calvinhobbes.jpg");
  noStroke();
  theMap = new TextBoxMap(80, b); 
  f = loadFont("Univers45.vlw");
  textFont(f, 25);
}


void draw(){
  background(0);  
  theMap.drawMap();  
  if(instruct){
    instructMode();  
  }
}

void mouseClicked(){
  if(!instruct)
    theMap.swap(mouseX, mouseY); 
}

void keyPressed(){
  switch(key){
  case 27:
    exit();
    break;
  case 's':
    theMap.shuffle(50);
    break;
  case 'a':
    theMap.reassignImages();
    break;
  case 'z':
    instruct = !instruct;
    break;
  default:
    break;
  } 
}


void instructMode(){

  fill(0, 0, 0, 200);
  rect(0, 0, 640, 480);
  fill(255, 255, 255);
  textAlign(CENTER, TOP);
  textSize(25);
  text("this is the instruction mode", 320, 100); 
  text("press 'z' to turn on/off this mode and to play", 320, 140);
  text("press 's' to shuffle", 320, 180);
  fill(0, 255, 255);
  text("to move a box, click on one of the neighbors", 320, 240);
  text("of the empty box", 320, 270);
  textAlign(RIGHT, BOTTOM);
  textSize(19);
  fill(255, 0, 0);
  text("by Ahmet Kizilay, using Processing", 635, 475);
}

