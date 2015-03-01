
float speedR, speedG, speedB, speedA, speedC;

void setup() {  //runs once on start
  size(700, 500);
  speedR=random(-.8,-1.2);
  speedG=random(-.8,-1.2);
  speedB=random(-.8,-1.2);
  speedA=random(-.8,-1.2);
  speedC=random(-.8,-1.2);
} 

void draw() {  //Loop Continuously
  background(#CCCCCC);
  drawballoon(#00C000,400,speedC);
  drawballoon(#00A000,300,speedA);
  drawballoon(#FF0000,200,speedR);
  drawballoon(#00FF00,100,speedG);
  drawballoon(#0000FF,0,speedB);
}

void drawballoon(color c, int xStart, float speed){  //runs when called
  resetMatrix();
  translate(0,400)
  translate(xStart,frameCount*speed );
  if (frameCount*speed<=-450 ) 
     { noLoop(); }
  fill(c);
  ellipse(160, 80, 70, 70);
  line(160,110,160,160);
}
