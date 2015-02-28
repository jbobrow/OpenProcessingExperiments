
PImage notYou;
PImage redPop;
PImage redA;
PImage birdie;
PImage annoy;
PImage branch;
PImage greenPop;

void setup(){
  size (604, 460);
  background (136, 238, 252); 
  smooth();
  frameRate (5);
  notYou = loadImage ("notYou.png");
  redPop = loadImage("redPop.png");
  redA = loadImage ("redA.png");
  birdie = loadImage ("birdie.png");
  annoy= loadImage ("annoy.png");
  branch= loadImage ("branch.png");
  greenPop= loadImage ("greenPop.png");
}

void draw(){
}
void mousePressed(){
  if (key =='1'){
    image (notYou, mouseX, mouseY);
    
}

 if (key =='2'){
    image (annoy, mouseX, mouseY);
    
}
}

void mouseDragged (){
  if (key =='a'){
    image (redPop, mouseX, mouseY);
}
  if (key =='b'){
    image (redA, mouseX, mouseY);
}
  if (key =='c'){
    image (birdie, mouseX, mouseY);
}
  if (key == 'd' ){
    image (branch, mouseX, mouseY);
  }
  if (key == 'e' ){
    image (greenPop, mouseX, mouseY);
}
}

