
float speedR, speedG, speedB, speedA, speedC;

void setup() {  //runs once on start
  size(600, 300);
  speedR=random(-.8,-1.2);
  speedG=random(-.8,-1.2);
  speedB=random(-.8,-1.2);
  speedA=random(-.8,-1.2);
  speedC=random(-.8,-1.2);
} 

void draw() {  //Loop Continuously
  background(#CCCCCC);
  drawTractor(#FF0000,100,speedR);
  drawTractor(#00FF00,200,speedG);
  drawTractor(#0000FF,300,speedB);
  drawTractor(#00A00F,400,speedA);
  drawTractor(#000AA0,500,speedC);
}

void drawTractor(color c, int xStart, float speed){  //runs when called
  resetMatrix();
  translate(0,250)
  translate(xStart, frameCount*speed);
  if (frameCount*speed >= 600-90) {  // stops loop for photo finish when winner finishes
      noLoop();  
  }
  fill(c);
  ellipse (10, 30, 60, 60);
  line (10, 110, 10, 60);
  
  
}
