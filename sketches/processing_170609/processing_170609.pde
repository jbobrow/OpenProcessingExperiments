
void setup() {
  size(500, 500);
  background(255);
  noStroke();
  smooth();
  frameRate(6);
}
 
void draw() {
   for (float i=0; i < 10; i++) { //this continuously draws the hearts and the confetti!
    drawHeart(250,250);
     
   }
    
   textSize(35);
   smooth();
   fill(0);
   text("WAZZZZ UPPPPPZ!!", width/6, height/6);
    
}
 
void drawHeart (int x, int y) { //referenced and then scaled heart!
    smooth();
    noStroke();
    fill(255, 0, 0, 150);
    beginShape();
    vertex(50+x, 25+y);
    bezierVertex(50+x, -5+y, 120+x, 5+y, 50+x, 60+y);
    vertex(50+x, 25+y);
    bezierVertex(50+x, -5+y, -20+x, 5+y, 50+x, 60+y);
    endShape();
     
}
 
