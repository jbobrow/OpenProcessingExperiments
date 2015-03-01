
float speedR, speedG, speedB, speedP, speedY;

void setup() {  //runs once on start
  size(600, 800);
  speedR=random(.8,1.2);
  speedG=random(.8,1.2);
  speedB=random(.8,1.2);
  speedP=random(.8,1.2);
  speedY=random(.8,1.2);
} 

void draw() {  //Loop Continuously
  background(#CCCCCC);
  drawBalloon(#FF0000,300,speedR);
  drawBalloon(#00FF00,350,speedG);
  drawBalloon(#0000FF,470,speedB);
  drawBalloon(#FFFF00,375,speedY);
  drawBalloon(#888888,400,speedP);
}

void drawBalloon(color c, int xStart, float speed){  //runs when called
  resetMatrix();
  translate( xStart, (frameCount*speed*-1)+450);
  if (frameCount*speed >= 600-90) {  // stops loop for photo finish when winner finishes
      noLoop();  
  }
  fill(c);
  ellipse(80, 70, 60, 60);
  
}

