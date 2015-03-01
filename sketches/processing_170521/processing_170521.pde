
float speedR, speedG, speedB, speedY, speedO;

void setup() {  //runs once on start
  size(600, 300);
  speedR=random(.8,1.2);
  speedG=random(.8,1.2);
  speedB=random(.8,1.2);
  speedY=random(.8,1.2);
  speedO=random(.8,1.2);
} 

void draw() {  //Loop Continuously
  background(#CCCCCC);
  drawTractor(#FF0000,0,speedR);
  drawTractor(#00FF00,100,speedG);
  drawTractor(#0000FF,220,speedB);
  drawTractor(#FFFF00,150,speedY);
  drawTractor(#FFA500, 75, speedO);
}

void drawTractor(color c, int yStart, float speed){  //runs when called
  resetMatrix();
  translate(frameCount*speed, yStart);
  if (frameCount*speed >= 600-90) {  // stops loop for photo finish when winner finishes
      noLoop();  
      
  
  }
  fill(c);
    ellipse(80, 70, 30, 30);
  
  
  
  
}



