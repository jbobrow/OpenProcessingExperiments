
PImage motif; PImage motif2;

float aspect; boolean paused = false;

void setup () {
  size(800,800);
  motif = loadImage("motif 7.png");
  motif2 = loadImage("motif 5.png");
  background(102);
}

void draw () {
  variableEllipse(mouseX, mouseY, pmouseX,pmouseY);
  
  if(!paused){
    aspect = random(0,.15);
    image(motif, random(width), random(height), motif.width*aspect, motif.height*aspect);

  aspect = random (0, 0.2);
image(motif2, random(width), random(height), motif.width*aspect, motif.height*aspect);
}
fill(255,5);
rect(0,0,800,800);
}

void keyPressed(){
  if(key == 'c'|| key == 'C'){
    background (0);
  }
  
  if(key == ' '){
    if (paused){paused = false;}
    else{paused = true;}
  }
  
  if(key == '1'){
save("picture1.jpg");  // whole screen of program
 }}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(speed);
  ellipse(x,y,speed,speed);
}




