
/*
Floral
adalau85@gmail.com
October 2, 2009
*/

float turn = 0;
int noiseNum = 0;
int loopNum = 100;

void setup(){
  size(500,500);
  background(#82CAFF);
  smooth();
};

void draw() {
  
    pushMatrix();
    translate(width/2, height/2);
    rotate(turn);
  
    float end = noise(noiseNum)*220;
    noiseNum+=0.1;
    
    stroke(#41627E);
    line(0,0,end,end);
    stroke(100,200,100,50);
    fill(0,0,255,50);
    ellipse(end, end, 10, 10);
    
    turn+=0.01;
    popMatrix();

  };


