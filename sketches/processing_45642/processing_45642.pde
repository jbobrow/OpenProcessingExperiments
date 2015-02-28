
float thr = 0.4;

void setup(){
  size(800,600);
  background(0,127,255);
  smooth();
  frameRate(12);
  
  
}


void draw(){
  
    noStroke();
    fill(0,127,255,25);
    rect(0, 0, width, height);
    
    thr = thr + 0.01;
    float nz =100;
    nz = noise(thr)*nz;
    
  
  fill(0,0,0,10);
  float sz = random(250);
  ellipse ((width/4)+nz,(height/4)+nz,sz,sz);
  fill(0,0,0,random(50));
 float sz2 = random(250);
  ellipse ((width/4+300)-nz,(height/4+300)-nz,sz2,sz2);
   fill(0,0,0,random(20));
  ellipse ((width/4+300)+nz,(height/2-100)+nz,sz2,sz2);
  
  stroke(125,127,0);
  
  
}




