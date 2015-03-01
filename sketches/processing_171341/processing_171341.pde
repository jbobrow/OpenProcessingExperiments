
float speedR, speedG, speedB;

void setup() {  //runs once on start
  size(600, 300);
  speedR=random(.8,1.2);
  speedG=random(.8,1.2);
  speedB=random(.8,1.2);
  speedY=random(.8,1.2);
  speedC=random(.8,1.2);
  
}

 

void draw() {  //Loop Continuously
  background(#CCCCCC);
  drawBalloon(#FF0000,0,speedR);
  drawBalloon(#00FF00,100,speedG);
  drawBalloon(#0000FF,200,speedB);
  drawBalloon(#FFFF00,300,speedY);                     
  drawBalloon(#00FFFF,400,speedC);
}



void drawBalloon(color c, int yStart, float speed){  //runs when called
  resetMatrix();
  translate(yStart,-frameCount*speed+200);
  if (frameCount*speed >= 219) {  // stops loop for photo finish when winner finishes
      noLoop();  
  }
  fill(c);
  ellipse(30, 45, 50, 50);
  
}
