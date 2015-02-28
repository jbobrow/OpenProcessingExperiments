
int rotateSpeed = 0;

void setup() {
  
  size (512,160);
  rectMode(CENTER);
  stroke(255);
  smooth();
  frameRate(8);
}

void draw() {
  
  background(100,0,0);
  
  translate(width/2, height/2);
  rotateSpeed++; 
  
  for(int i =0; i<90; i++) {
    
    scale(0.96,0.96);
    rotate(radians(rotateSpeed/7));
    
    stroke((map(i,0,90,150,50)), 0, 0);
    strokeWeight(15);
    //noStroke();
    fill((map(i,0,80,100,50)),0,0);
    
    rect(0,0,width,width);  
     
  }
}

