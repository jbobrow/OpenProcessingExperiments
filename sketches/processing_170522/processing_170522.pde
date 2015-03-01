
float speedR, speedG, speedB, speedP, speedO;

void setup() {  //runs once on start
  size(600, 300);
  speedR=random(.8,1.2);
  speedG=random(.8,1.2);
  speedB=random(.8,1.2);
  speedP=random(.8,1.2);
  speedO=random(.8,1.2);
} 

void draw() {  //Loop Continuously
  background(#CCCCCC);
  drawTractor(#FF0000,200,speedR);
  drawTractor(#00FF00,300,speedG);
  drawTractor(#0000FF,400,speedB);
  drawTractor(#660066,500,speedP);
  drawTractor(#ee8317,100,speedO);
}

void drawTractor(color c, int yStart, float speed){  //runs when called
  resetMatrix();
  //translate(frameCount*speed, yStart);
  translate(yStart,frameCount*-speed);
  if (frameCount*speed >= 300-60) {  // stops loop for photo finish when winner finishes
      noLoop();  
  }
  fill(c);
  
  ellipse(30, 260, 50, 50);
  line(30,260,30,366);
}
