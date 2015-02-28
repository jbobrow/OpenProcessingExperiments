
PImage motif1;
PImage motif2;
PImage motif3;
 
float aspect; boolean paused = false;
 
 
void setup() {
 
size(800,800);
motif1 = loadImage("Motif 1.png");
motif2 = loadImage("Motif 2.png");
motif3 = loadImage("Motif 3.png");
frameRate (10);
noStroke ();
 
}
 
void draw(){
   
 
   
  fill(255,0,0,10);
  rect(200, 200, 400, 400);
   
  fill (255, 255, 255, 255 );
  rect (300, 300, 200, 200);
   
   
  fill(0,0,32,2);
  rect(100, 100, 600, 600);
   
  
       fill (255, 255, 255, 20);
    rect (400, 400, 800, 400);
     
   fill (255, 255, 255, 100);
    rect (400, 0, 400, 400);
     
     fill (255, 255, 255,100);
    rect (0, 400, 400, 800);
     
    fill (255, 255, 255,20);
    rect (0,0, 400, 400);
     
     
  image(motif3, mouseX, mouseY);
   
  //image(motif3, random(width), random(height));
 
//DRAWING RANDOM PETALS
if(!paused){
 aspect = random(0, 1.0);
  image(motif2, random(width), random(height), motif2.width*aspect, motif2.height*aspect);
}
 
}
 
//draw trupets wherever the mouse is pressed
void mousePressed(){
 
  image(motif1, mouseX, mouseY);
}
 
void keyPressed(){
  if(key == ' '){
  //if it is paused (i.e. paused == true) make paused be false
  //i.e. if it's paused, unpause it.
  if(paused) {paused = false;}
  //otherwise, pause it.
  else {paused = true; }
}
 
//if you press the c key, clear the sketch
if (key == 'c' || key == 'C') {
  background(random(0,255),random(0,255),random(0,255));
}
 
//press 'o' to draw a random oval once'
if (key == 'o' || key == 'O') {
  image(motif3, random(width), random(height));
}
 
 
//press the space bar to pause and unpause
 
 
}

