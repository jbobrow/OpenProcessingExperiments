
//Rosa Han
//March 5 2013
//Assignment 5 

int balls=100;
int diam=140;
float [] xpos= new float[balls];
float [] ypos= new float[balls];
float [] ballsize= new float[balls];
 
void setup() {
  size(300, 550);
  background(0);
  noStroke();
  smooth();
  frameRate(15);
  for (int x = 0; x < balls; x++) {
    ballsize[x]= random(10, 50);
    xpos[x]= random(ballsize[x], width-ballsize[x] );
    ypos[x]= random(ballsize[x], height-ballsize[x] );
  
  }
 
 
  
}
void draw() {
 background(map(mouseX, 0, width, 0, 255), 80, map(mouseY, 0, height, 0 , 255));
  
  
  for (int x = 0; x < balls; x++) {
    ellipse (xpos[x], ypos[x], ballsize[x], ballsize[x]);
 

 
    if (mousePressed) { 
      fill (random(155, 255), random(155,200), random(155, 200));
      
    
 
    }else {
      fill (0, random(100, 255), random(100, 255), random(100, 255));
    }
     
  }
  
}
