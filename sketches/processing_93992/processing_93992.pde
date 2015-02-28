
float rot = 0;
boolean paused = false;
PImage Acorn;
PImage Mot;

void setup() {
  background (216,199,169);
  size(700, 700);
  //rectMode(CENTER);
  Acorn= loadImage("slightcurveL2.png");
  Mot = loadImage("singBWRY.png");
}

void draw() {
  if(!paused){
  translate(height/2,width/2);
  rotate(rot);
  rot -= 4;
  image(Acorn,mouseX, mouseY,Acorn.width,Acorn.height);
  }
}
  
  void keyPressed(){
    
     if (key == 'd' || key == 'D') {
    background(0);
  }
  
   //if you press the c key, clear the sketch
  if (key == 'f' || key == 'F') {
    background(216,199,169);
  }
    
      if (key == 'g' || key == 'G') {
        fill(0,5);
  rect(0,0,800,800);
  
  Float D = random(0,50);
  //fill(5);
  image(Mot,random(0,700), random(0,700),D,D);
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

