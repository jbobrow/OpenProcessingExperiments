
float speedR, speedG, speedB, SpeedP, SpeedO;
 
void setup() {  //runs once on start
  size(600, 600);
  speedR=random(-1,-2.5);
  speedG=random(-1,-2.5);
  speedB=random(-1,-2.5);
  speedP=random(-1,-2.5);
  speedO=random(-1,-2.5);
}
 
void draw() {  //Loop Continuously
  background(#CCCCCC);
  drawBalloon(#FF0000,0,speedR);
  drawBalloon(#00FF00,100,speedG);
  drawBalloon(#0000FF,200,speedB);
  drawBalloon(#FE2EF7,300,speedP);
  drawBalloon(#FF8000,400,speedO);
}
 
void drawBalloon(color c, int xStart, float speed){  //runs when called
  resetMatrix();
  translate(0, 600);
  translate(xStart, frameCount*speed);
  if (frameCount*speed >= 600-90) {  // stops loop for photo finish when winner finishes
      noLoop(); 
  }
  fill(c);
  ellipse(56, 46, 100, 100);
  line(45, 95, 100, 100);
}
