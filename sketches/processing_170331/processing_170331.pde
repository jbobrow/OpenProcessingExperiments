
float xnoise =0.0;
float ynoise =0.0;
float inc =0.02;
int leaves = 0; 
int leafMax = 200;

void setup(){
  size(600,600);
   colorMode(HSB,360,100,100);
   
  for(int y=0; y <height; y++){
    for(int x=0; x<width; x++){
      float sky = noise(xnoise,ynoise)*100;
      stroke(205,sky,100);
      point(x,y);
      xnoise=xnoise + inc;
    }
    xnoise=0;
    ynoise=ynoise + inc;
  }
  inc*=0.9;
}

void drawLeaf(){
  float pointShift = random(-20,20); 
  beginShape(); 
  vertex(20, 45); 
    bezierVertex(30,30, 60 + pointShift,40 + pointShift/2, 70 + pointShift,50); 
    bezierVertex(60 + pointShift,55, 30,65, 20,45); 
  endShape();
  
}

void draw (){ 
  fill(random(100,150),random(90),random(60),200);  
  if (leaves<leafMax) {
    float cx = 300 + random(-145,145);
    float cy = 300 + random(-145,145); 
 
    translate(cx,cy); 
    rotate(random(TWO_PI)); 
    scale(random(0.1,1.8)); 
    drawLeaf(); 
    leaves++; 
  }


}
