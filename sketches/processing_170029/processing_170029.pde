
float speedR, speedG, speedB, speedT, speedW;

void setup() {  //runs once on start
  size(750, 300);
  speedR=random(.8,1.2);
  speedG=random(.8,1.2);
  speedB=random(.8,1.2);
  speedT=random(.8,1.2);
  speedW=random(.8,1.2);
} 

void draw() {  //Loop Continuously
  background(#CCCCCC);
  drawBalloon(#FF0000,50,speedR);
  drawBalloon(#00FF00,200,speedG);
  drawBalloon(#0000FF,350,speedB);
  drawBalloon(#00FFFF,500,speedT);
  drawBalloon(#FFFFFF,650,speedW);
}

void drawBalloon(color c, int xStart, float speed){  //runs when called
  resetMatrix();
  translate(xStart, frameCount*-speed);  
  fill(c);
  ellipse (10, 250, 40, 40);
  line(10, 270, 10, 290);
 
  }
  
