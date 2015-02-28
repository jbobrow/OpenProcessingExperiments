

PImage oh3;
PImage yh3;
PImage outline;
PImage outlineb;

float aspect;
boolean paused = false;

void setup() {
  size(600, 600);
  background (195, 180, 200);
  oh3 = loadImage("OH3.png");
  yh3 = loadImage("YH3.png");
  outline = loadImage("middle 3.png");
  outlineb = loadImage("outline blue.png");
  oh3.resize(100, 90);
  imageMode(CENTER);
  frameRate(10);

  
}


void mousePressed(){
  aspect = random (0.1, 0.5);
    image(outline, mouseX, mouseY, outline.width*aspect, outline.height*aspect);
  }

void draw() {
  
   if(!paused){
    aspect = random(1.0, 2.5);
  if(mouseY > 400){
    fill(195, 180, 200, 20);
  }
  else{
    fill(170, 200, 195, 20);
  }
  noStroke();
  rect(0,0,width,height);
  image(oh3, random(width), random(height), oh3.width*aspect, oh3.height*aspect);
  image(yh3, random(width), random(height), oh3.width*aspect, oh3.height*aspect); 
  }


}

void keyPressed(){
  
  if (key == 'b'){
    image(outlineb, random(width), random(height), outlineb.width/4, outlineb.height/4);
  }
  
  //if you press the c key, clear the sketch
  if (key == 'c' || key == 'C') {
    background(195, 180, 200);
  }
    if(key == ' '){
    //if it is paused (i.e. paused == true) make paused be false
    //i.e. if it's paused, unpause it.
    if(paused) {paused = false;} 
    //otherwise, pause it. 
    else {paused = true; }
  }
}



