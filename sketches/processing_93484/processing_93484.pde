
PImage bone; PImage cir; PImage bonz;

float aspect; boolean paused = false;

void setup() {
  size(800, 800);
  noStroke();
  colorMode(RGB, height, height, height);
  rectMode(CENTER);
  
  bone  = loadImage("alh bonesss.png");
cir = loadImage("alh bone523.png");
bonz = loadImage("alh cirrr.png");

}

void draw() {
  background(0.0);

  float r1 = map(mouseX, 0, width, 0, height);
  float r2 = height-r1;
  
  fill(r1);
  rect(width/2 + r1/2, height/2, r1, r1);
  
  fill(r2);
  rect(width/2 - r2/2, height/2, r2, r2);
  
  //DRAWING RANDOM PETALS
if(!paused){
  aspect = random(0, 6.0);
  image(bone, random(width), random(height), bone.width*aspect, bone.height*aspect);
}
  image(cir, mouseX, mouseY, cir.width/10, cir.height/10);
  if (key == 'o' || key == 'O') {
  image(bonz, random(width), random(height), bonz.width/4,bonz.height/4);
}

}

void keyPressed(){

if(key=='1') saveFrame("01.png"); 
if(key=='2') saveFrame("02.png");
if(key=='3') saveFrame("03.png"); 
if(key=='4') saveFrame("04.png");
if(key=='5') saveFrame("05.png"); 
if(key=='6') saveFrame("06.png"); 
if(key=='7') saveFrame("07.png"); 
}



