
float speedR, speedG, speedB, speedJ, speedL;

void setup() {  //runs once on start
  size(600, 300);
  speedR=random(-.8,-1.2);
  speedG=random(-.8,-1.2);
  speedB=random(-.8,-1.2);
  speedJ=random(-.8,-1.2);
  speedL=random(-.8,-1.2);
} 

void draw() {  //Loop Continuously
  background(#CCCCCC);
  drawBalloon(#FF0000,100,speedR);
  drawBalloon(#00FF00,200,speedG);
  drawBalloon(#0000FF,300,speedB);
  drawBalloon(#000FFF,400,speedJ);
  drawBalloon(#F0F0F0,500,speedL);
}

void drawBalloon(color c, int yStart, float speed){  //runs when called
  resetMatrix();
  translate(0,250);
  translate(yStart,frameCount*speed );
  if (frameCount*speed >= 600-90) {  // stops loop for photo finish when winner finishes
      noLoop();  
  }
  fill(c);
  ellipse (20, 50, 60, 60);
  line(20, 100, 20, 80);
}
