

float a=0.0;
float inc = TWO_PI/25.0;

void setup(){
  size(800,600);
  background(255,255,255);
  smooth();
  frameRate(5);
}



void draw(){
  
   noStroke();
    fill(0,0,0,255);
    rect(0, 0, width, height);
   
  for (int i=0; i<width; i=i+20){
    strokeWeight(5);
    stroke(5, 127,127, random(255));
   line(i,random(50,width/2), i, random(50,width/2)+sin(a)*40.0);
    a = a + inc; 
  }
  
  
}

