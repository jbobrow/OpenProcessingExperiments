
float rot = 0;
boolean paused = false;
PImage Acorn;
PImage Mot;
PImage OP;

void setup() {
  background (216,199,169);
  size(700, 700);
  //rectMode(CENTER);
  Acorn= loadImage("slightcurveL2.png");
  Mot = loadImage("singBWRY.png");
  OP = loadImage("singOYP.png");
   // image(PYG, mouseX, mouseY, PYG.width, PYG.height);
}

void draw() {
  if(!paused){
  tint(255, 255);
  translate(height/2,width/2);
  rotate(rot);
  rot -=TWO_PI/800;
  image(Acorn,mouseX, mouseY,Acorn.width,Acorn.height);
  
  
  
 
}
}

void mousePressed(){ 
  tint(255, 100);
    image(Mot, mouseX-150, mouseY-125, Mot.width, Mot.height);
  }

void keyPressed(){
  
  //if you press the c key, clear the sketch
  if (key == 'd' || key == 'D') {
    background(0);
  }
  
   //if you press the c key, clear the sketch
  if (key == 'f' || key == 'F') {
    background(216,199,169);
}

  if (key == 'g' || key == 'G') {
      tint(255, 100);
    image(OP, mouseX-150, mouseY-125, OP.width, OP.height);
}


 //press the space bar to pause and unpause
  if(key == ' '){
    //if it is paused (i.e. paused == true) make paused be false
    //i.e. if it's paused, unpause it.
    if(paused) {paused = false;} 
    //otherwise, pause it. 
    else {paused = true; }
}
}









