
float speedR, speedG, speedB, speedY, speedP;

void setup() {  //runs once on start
  size(600, 300);
  speedR=random(.8,1.2);
  speedG=random(.8,1.2);
  speedB=random(.8,1.2);
  speedY=random(.8,1.2);
  speedP=random(.8,1.2);
} 

void draw() {  //Loop Continuously
  background(#CCCCCC);
  balloons(#FF0000,0,speedR);
  balloons(#00FF00,100,speedG);
  balloons(#0000FF,200,speedB);
  balloons(#FCFF20,300,speedR);
  balloons(#AF1BB1,400,speedG);
}

void balloons(color c, int xStart, float speed){  //runs when called
  resetMatrix();
  translate(xStart, -frameCount*speed, xStart);
  if (frameCount*speed >= 600-90) {  // stops loop for photo finish when winner finishes
      noLoop();  
  }
  fill(c);
  line(150, 310, 150, 450);
  ellipse(150, 300, 50, 50);
}
