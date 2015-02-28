
PImage Y;
PImage G;
 
float aspectG;
float aspectY;
boolean paused = false;
 
 
void setup() { 
  background(0);
  size(1000,1000);
    Y = loadImage("Motif1.png");
    G = loadImage("Motif2.png");
}
 
 
void draw(){
  if(!paused){
    aspectG = random(0, 1);
    image(G, random(-width,width), random(-height,height), G.width*aspectG, G.height*aspectG);
  }
}
 
void mousePressed(){
  imageMode(CENTER);
  aspectY=random(0,1); 
  image(Y, mouseX, mouseY, Y.width*aspectY, Y.height*aspectY);
  }
 
void keyPressed(){
  
  if (key == 'c' || key == 'C') {
    background(0); }
   
  if(key == ' '){
    if(paused) {paused = false;}
    else {paused = true; }
    }
  }
