
int cols = 800;
int rows = 600;
int myAlpha = 25;
int fadeAlpha = 1;


//Fonts
int txtSize = 12;
color txtCol = color(0,128,128);
PFont myFont = createFont("Free Serif", txtSize);

int coinFlip;
float thisX = int(random(cols));//cols/2;
float thisY = int(random(rows));
float prevX = thisX;
float prevY = thisY;
int drawX = 0, drawY = 0, xOffset = 0, yOffset = 0, xZoom = 1, yZoom = 1;
int points[][];
int gotPoints = 0;
int myFrameCount = 0;

void keyPressed() {
  if(int(key) == 120){
   xZoom *= 1.5; 
  }
  if(int(key) == 122){
    yZoom *= 1.5;
  }
  if(keyCode == 38){
    yOffset -= 10;
  }
  if(keyCode == 40){
    yOffset += 10;
  }
  if(keyCode == 37){
    xOffset -= 10;
  }
  if(keyCode == 39){
    xOffset += 10;
  }
  background(0); 
}

void mouseClicked(){
  if(gotPoints < 3){
  points[gotPoints][0] = mouseX;
  points[gotPoints][1] = mouseY;
  gotPoints++;
  } else {
    myFrameCount = 0;
    gotPoints = 1;
    points[0][0] = mouseX;
    points[0][1] = mouseY;
    background(0);
  }  
  fill(255);
  for(int i = 0; i < gotPoints; i++){
      ellipse(points[i][0],points[i][1],5,5);
  }
}

void setup(){
  frameRate(1000);
  size(cols,rows,P2D);
  background(0);
  fill(255);
  stroke(255);
  textFont(myFont);
  //rectMode(CENTER);
  //noFill();
  stroke(255,myAlpha);
  points = new int[3][2];
  /*
  points[0][0] = (cols/2);
  points[0][1] = 0;
  points[1][0] = 0;
  points[1][1] = rows-1;
  points[2][0] = cols-1;
  points[2][1] = rows-1;
  */
  
  
  points[0][0] = 20;
  points[0][1] = 20;
  points[1][0] = 50;
  points[1][1] = 500;
  points[2][0] = 1400;
  points[2][1] = 880;
}

void updateScene(){
  coinFlip = int(random(3));
  if(coinFlip == 0){
    //print("\nA: ");
      thisX += (points[0][0] - thisX)/2;
      thisY += (points[0][1] - thisY)/2;
  } else {
    if(coinFlip == 1){
      //print("\nB: ");
      thisX += (points[1][0] - thisX)/2;
      thisY += (points[1][1] - thisY)/2;
    } else {
      //print("\nC: ");
      thisX += (points[2][0] - thisX)/2;
      thisY += (points[2][1] - thisY)/2;
    }
  }
  
  drawX = int(thisX)+xOffset;
  drawY = int(thisY)+yOffset;
  
  //drawX = int(map(thisX,cols/2,900,-xZoom,cols))+xOffset;
  //drawY = int(map(thisY,0,rows/2,-yZoom,rows))+yOffset;
  //println("X: "+drawX+", Y: "+drawY);
  myFrameCount++;
}

void draw(){
    //fill(0,0,0,fadeAlpha);
    //rect(0,0,cols,rows);
    if(gotPoints > 2){
      updateScene();
      if(myFrameCount > 50){
        point(drawX,drawY);
      }
      
    }
    fill(128,128,128);
    rect(0,0,100,30);
    fill(255);
    //text("FrameCount:\n"+myFrameCount+"\nFramerate\n"+int(frameRate),0,txtSize);   
    text("FrameCount:\n"+myFrameCount,0,txtSize);   
}


