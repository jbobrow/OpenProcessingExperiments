
int cols = 800;
int rows = 600;
int myAlpha = 64;
int fadeAlpha = 5;
int pointSize = 3;

//Fonts
int txtSize = 12;
color txtCol = color(0,128,128);
PFont myFont = createFont("Free Serif", txtSize);

int coinFlip;
float rule;
float thisX = 1;//int(random(cols));//cols/2;
float thisY = 1;//int(random(rows));
float prevX = thisX;
float prevY = thisY;
int drawX = 0, drawY = 0, xOffset = 0, yOffset = 0, xZoom = 1, yZoom = 1;
int points[][];
int gotPoints = 0;
//int matrix[][];
int myFrameCount = 0;
float minX = 2000000000, minY = 2000000000, maxX = 0, maxY = 0;
boolean flip = false;
int border = 5;
float[][] rules;
int ruleCount = 4;
int varCount = 3;
int pattern = 0;

void resetRules(){
  
  rules[0][0] = 1;
  rules[0][1] = 0;
  rules[0][2] = 0;
  rules[0][3] = 0;
  rules[0][4] = 0;
  rules[0][5] = 0.16;
  rules[0][6] = 0;
  rules[1][0] = 86;
  rules[1][1] = 0.85;
  rules[1][2] = 0.04;
  rules[1][3] = 0;
  rules[1][4] = -0.04;
  rules[1][5] = 0.85;
  rules[1][6] = 0.16;
  rules[2][0] = 93;
  rules[2][1] = 0.20;
  rules[2][2] = -0.26;
  rules[2][3] = 0;
  rules[2][4] = 0.23;
  rules[2][5] = 0.22;
  rules[2][6] = 0.16;
  rules[3][0] = 100;
  rules[3][1] = -0.15;
  rules[3][2] = 0.28;
  rules[3][3] = 0;
  rules[3][4] = 0.26;
  rules[3][5] = 0.24;
  rules[3][6] = 0.08;
  
}

void keyPressed() {
  if(int(key) == 32){
    resetRules();
    getRange();
    pattern = 0;
  }
  if(int(key) == 120){
   //xZoom *= 1.5; 
   jiggleRules();
   getRange();
   pattern++;
  }
  if(int(key) == 122){
    //yZoom *= 1.5;
    jiggleRules();
    getRange();
    pattern++;
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

void jiggleRules(){
  //int mutate = int(random(rules.length*rules[0].length));
  for(int j = 0; j < rules.length; j++){
    for(int i = 1; i < rules[0].length; i++){
      if(int(random(2)) == 0){
        rules[j][i] *= 0.95+(random(0.50)-0.2);
      }
      println("rules["+j+"]["+i+"] = "+rules[j][i]);
      if(int(random(rules.length*rules[0].length)) == 0){
        rules[j][i] *= 1.5;
      }
    }
  }
  println("Pattern #"+pattern+1);
  println("---");
}

void setup(){
  frameRate(1000);
  size(cols,rows,P2D);
  background(0);
  fill(255);
  textFont(myFont);
  //rectMode(CENTER);
  //noFill();
  stroke(0,255,0,myAlpha);
  if(pointSize > 1){
    noStroke();
  }
  points = new int[3][2];
  rules = new float[ruleCount][(varCount*2)+1];
  resetRules();



  //matrix = new int[rows][columns];
  /*
  points[0][0] = (cols/2);
  points[0][1] = 0;
  points[1][0] = 0;
  points[1][1] = rows-1;
  points[2][0] = cols-1;
  points[2][1] = rows-1;
  */
  
  /*
  points[0][0] = 20;
  points[0][1] = 20;
  points[1][0] = 50;
  points[1][1] = 500;
  points[2][0] = 1400;
  points[2][1] = 880;
  */
  getRange();
  //println(minX);
  //println(maxX);
  //println(minY);
  //println(maxY);
}

void getRange(){
  minX = 2000000000;
  minY = 2000000000;
  maxX = 0;
  maxY = 0;
  for(int i = 0; i < 50; i++){
    updateScene();
  }
  for(int i = 0; i < 25000; i++){
    updateScene();
    if(thisX < minX){
      minX = thisX;
    }
    if(thisX > maxX){
      maxX = thisX;
    }
    if(thisY > maxY){
      maxY = thisY;
    }
    if(thisY < minY){
      minY = thisY;
    }
  }
  if((maxY-minY)>(maxX-minX)){
    flip = true;
  }
  myFrameCount = 0;
}

void updateScene(){
  rule = random(100);
  
  if(rule < rules[0][0]){
    //print("A - ");
    thisX = (rules[0][1]*prevX)+(rules[0][2]*prevY)+rules[0][3];
    thisY = (rules[0][4]*prevX)+(rules[0][5]*prevY)+rules[0][6];
  } else {
    if(rule < rules[1][0]){
      //print("B - ");
      thisX = (rules[1][1]*prevX)+(rules[1][2]*prevY)+rules[1][3];
      thisY = (rules[1][4]*prevX)+(rules[1][5]*prevY)+rules[1][6];
    } else {
      if(rule < rules[2][0]){
        //print("C - ");
        thisX = (rules[2][1]*prevX)+(rules[2][2]*prevY)+rules[2][3];
        thisY = (rules[2][4]*prevX)+(rules[2][5]*prevY)+rules[2][6];
      } else {
        //print("D - ");
        thisX = (rules[3][1]*prevX)+(rules[3][2]*prevY)+rules[3][3];
        thisY = (rules[3][4]*prevX)+(rules[3][5]*prevY)+rules[3][6];
      }
    }
  }
  //println("X: "+thisX+", Y: "+thisY);
  //drawX = int(thisX)+xOffset;
  //drawY = int(thisY)+yOffset;
  prevX = thisX;
  prevY = thisY;
  //drawX = int(map(thisY,0,1.1,100,200))+xOffset;
  //drawY = int(map(thisX,-0.5,0.5,300,350))+yOffset;
  
  
  
  if(flip){
    drawX = int(map(thisY,minY,maxY,border,cols-border))+xOffset;
    drawY = int(map(thisX,maxX,minX,border,rows-border))+yOffset;
  } else {
    drawX = int(map(thisX,minX,maxX,border,cols-border))+xOffset;
    drawY = int(map(thisY,maxY,minY,border,rows-border))+yOffset;
  }
  
  
  
  //println("X: "+drawX+", Y: "+drawY);
  myFrameCount++;
}

void draw(){
    //fill(0,0,0,fadeAlpha);
    //rect(0,0,cols,rows);
    updateScene();
    fill(0,255,0,myAlpha);
    if(myFrameCount > 50){
      if(pointSize > 1){
        rect(drawX,drawY,pointSize,pointSize);
      } else {
        point(drawX,drawY);
      }
    }
    
    if(myFrameCount > 25000){
      if(pattern > 9){
        delay(5000);
        resetRules();
        pattern = 0;
        getRange();
      } else {
        jiggleRules();
        getRange();
        pattern++;
      }
      background(0);
      myFrameCount = 0;
      
      
    }  
    
    fill(128,128,128);
    rect(0,0,100,30);
    fill(255);
    //text("FrameCount:\n"+myFrameCount+"\nFramerate\n"+int(frameRate),0,txtSize);   
    text("Pattern: "+pattern+"\nFrame: "+myFrameCount,0,txtSize);   
}


