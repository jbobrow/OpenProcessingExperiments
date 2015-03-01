
//float balloon = random(15,30);
float houseBound = 100;
float houseX = random(0,100);
float houseY = random(50,200);
float houseY2 = random(50,200);
float houseX2 = random(150,250);
float balloonW = random(15,30);
float balloonH = random(15,30);
float balloonX = random(0,260);//width - (offset*1.5);//center of balloon
float balloonY = random(0,260);//height - (offset*1.5);//center of balloon
float houseW = random(50,100);//testing
float houseH = random(50,100);
float houseW2 = random(50,100);//testing
float houseH2 = random(50,100);
int speedX = 1;
int speedY = 1;

//float houseW = 100


void setup(){
  size(300,300);
}

void draw(){
  background(255,255,255);
  color grayscale = color(192); //
  color fullColor = color(255,153,255);
  //float balloonW = random(15,30);
  //float balloonH = random(15,30);//height of balloon
  float offset = width/2;//helps move balloon to center of screen
  //float balloonX = width - (offset*1.5);//center of balloon
  //float balloonY = height - (offset*1.5);//center of balloon
  float lineY1 = balloonY+(balloonH/2);
  float lineX2 = balloonX+(balloonW*.33);
  float lineY2 = lineY1 + (balloonH*.33);
  float boxX = balloonX - (balloonW/2);
  float boxY = balloonY - (balloonH/2);
  float boxW = balloonW;
  float boxH = balloonH;
  float hRoofX1 = houseX+(houseW/2);
  float hRoofY1 = houseY-(houseBound*.33);
  float hRoofY2 = houseY2-(houseBound*.33);
  float hRoofX2 = houseX2+(houseW2/2);
  float doorX = houseX + ((.625)*houseW);
  float doorX2 = houseX2 + ((.625)*houseW2);
  float doorY = houseY+(houseH-houseH*.25);
  float doorY2 = houseY2+(houseH2-houseH2*.25);
  float doorW = houseW*(.1875);
  float doorH = houseH*(.25);
  float doorW2 = houseW2*(.1875);
  float doorH2 = houseH2*(.25);
  float windX = houseX + (.125*houseW);
  float windY = houseY + (.125*houseH);
  float windW = houseW*.125;
  float windH = houseH*.125;
  float windX2 = houseX2 + (.125*houseW2);
  float windY2 = houseY2 + (.125*houseH2);
  float windW2 = houseW2*.125;
  float windH2 = houseH2*.125;
  
  //balloon
  fill(fullColor);
  noStroke();
  ellipse(balloonX,balloonY,balloonW, balloonH);//balloon
  
  //Changes direction of the balloon when hits the corner
  balloonX = balloonX+speedX;
  if ((balloonX+(.5*balloonW)>width)||(balloonX-(.5*balloonW)<0)){
    speedX = speedX*-1;
  }
  balloonY = balloonY+speedY;
  if ((balloonY+(.5*balloonH)>width)||(balloonY-(.5*balloonH)<0)){
    speedY = speedY*-1;
  }

  stroke(0);
  line(balloonX, lineY1, lineX2, lineY2);//string of balloon
  
  //house1
  noFill();
  rect(houseX, houseY, houseW, houseH);
  triangle(houseX,houseY,hRoofX1,hRoofY1,houseX+houseW,houseY);
  //door1
  rect(doorX,doorY,doorW,doorH);
  //window1
  rect(windX,windY,windW,windH);
  
  //house2
  noFill();
  rect(houseX2, houseY2, houseW2, houseH2);
  triangle(houseX2,houseY2,hRoofX2,hRoofY2,houseX2+houseW2,houseY2);
  //door2
  rect(doorX2,doorY2,doorW2,doorH2);
  //window2
  rect(windX2,windY2,windW2,windH2);
}
