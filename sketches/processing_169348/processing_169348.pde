
float speedR, speedG, speedB;

void setup() {  //runs once on start
  size(300, 500);
  speedR=random(.8,1.2);
  speedG=random(.8,1.2);
  speedB=random(.8,1.2);
} 

void draw() {  //Loop Continuously
  background(#CCCCCC);
  drawballoon(#FF0000,200,speedR);
  drawballoon(#00FF00,200,speedG);
  drawballoon(#0000FF,200,speedB);
}

void drawballoon(color c, int xStart, float speed){  //runs when called
  resetMatrix();
  translate(frameCount*speed, xStart);
  if (frameCount*speed >= 600-90) {  // stops loop for photo finish when winner finishes
      noLoop();  
  }
  fill(c);
  ellipse(160, 80, 70, 70);
  line(160,100,160,160);
}
