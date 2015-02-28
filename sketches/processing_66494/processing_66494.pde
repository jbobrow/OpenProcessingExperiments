

void setup() {
  size(1000, 1000, P2D);
  noFill();
  background(0);
  smooth();
 //colorMode(HSB);
  
  strokeCap(ROUND);
  strokeWeight(2.5);
  strokeJoin(ROUND);
  
}

void draw(){
 //background(0);
 float lfc = frameCount;
 if (frameCount%30==0)  stroke(random(2.0/width*50,255),random(50,200),random(20,50+1.0/width*50), 40);
 //if (frameCount%120==0) stroke(0);
 
 for(float i = 0; i < width; i+= width){
   
   ellipse(width/2  - 50.0*sin(frameCount/301.0*PI)*cos(i+frameCount/600.0*PI), height/2 - 50*sin(frameCount/298.0*PI)*sin(i+frameCount/600.0 *PI), i+lfc, i+lfc);
  }
}

