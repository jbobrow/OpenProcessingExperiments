
float firework = 0.0;
float xincrement = 0.005;
float n=0;
float crack=0;
 
void setup() {
 size(700, 400);
 background(255);
 smooth();
}
 
void draw(){
  
  fill(255,10);
  rect(0, 0, 700, 400);
  
  filter(BLUR,2);
  stroke(0,random(0,255));
  
  crack=random(0,width);
 
  beginShape(LINES);
   
  for (int i= int(random(-(width*0.5),width*2.5)) ; i<crack; i++) { 
  strokeWeight(random(1, 6));
    n = noise(firework)*(height);
    // With each cycle, increment fwoff
    firework += xincrement;
 
    vertex(i, n);
  }
 
  endShape();
}

