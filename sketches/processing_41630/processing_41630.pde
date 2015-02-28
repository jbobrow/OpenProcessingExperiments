
float firework = 0.0;
float xincrement = 0.1;
float n=0;
float crack=0;
//void mousePressed () {

  
 
void setup() {
 size(700, 400);
 background(255);
 smooth();
}
 
void draw(){
  
  fill(255,10);
  noStroke();
  rect(0, 0, 700, 400);
  
  //filter(BLUR,2);
  stroke(0);
 
}
 
  
void mouseDragged() {
  
  if (mouseButton == LEFT) {
    //filter(BLUR,2);
  stroke(0);
  
  crack=random(width/2+200,width/2+400);
  beginShape(LINES);
   
  for (int i= int(random(-width/2,width/2)) ; i<crack; i++) { 
  strokeWeight(random(1, 6));
    n = noise(firework)*(height);
    // With each cycle, increment fwoff
    firework += xincrement;
    vertex(i, n);
   
//if (mouseButton == RIGHT) {
  //fill(255);
   
   
  }
  
  endShape();
 }
}



