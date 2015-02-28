
float speedR, speedG, speedB, speedC, speedP;

void setup() {  //runs once on start
  size(600, 400);
  speedR=random(.8,1.2);
  speedG=random(.8,1.2);
  speedB=random(.8,1.2);
  speedC=random(.8,1.2);
  speedP=random(.8,1.2);
} 

void draw() {  //Loop Continuously
  background(#CCCCCC);
  drawBalloon(#FF0000,0,speedR);
  drawBalloon(#00FF00,100,speedG);
  drawBalloon(#0000FF,200,speedB);
  drawBalloon(#00FFFF,300,speedC);
  drawBalloon(#FF00FF,400,speedP);
}

void drawBalloon(color c, int xStart, float speed){  //runs when called
  resetMatrix();
  translate(xStart, -frameCount*speed);
  if (frameCount*speed >= 400-32) {  // stops loop for photo finish when winner finishes
      noLoop();  
  }
  fill(c);
  ellipse(100, 390, 28, 40);
  line(100, 410, 100, 480);
}
