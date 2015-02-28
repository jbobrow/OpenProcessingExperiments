
int n = 500;
float[] xVel = new float[n];
float[] yVel = new float[n];
float[] r = new float[n];
float[] g = new float[n];
float[] b = new float[n];
float[] xPos = new float[n];
float[] yPos = new float[n];
float gravity;
boolean[] isOn = new boolean[7];
int[] LxPos = new int[7]; 
int[] LyPos = new int[7];
int startTime;
int currentTime;
int interval;
PImage toothpaste;

void setup(){
  smooth();
  size(500,500);
  //counter
  startTime = millis();
  interval = 1000;
  
  //
  gravity = 0.8;
  for (int i = 0; i < n; i++) {
    xPos[i] = random(1, 499);
  }

  for (int i = 0; i < n; i++) {
    yPos[i] = random(1, 485);
  }

  for (int i = 0; i < n; i++){
   xVel[i] = random(-10, 10);
  }

  for (int i = 0; i < n; i++){
   yVel[i] = random(-3, 5);
  } 
   
  for (int i = 0; i < n; i++){
  r[i] = random(200,255);
  } 
  
  for (int i = 0; i < n; i++){
  g[i] = random(200,255);
  }   

  for (int i = 0; i < n; i++){
  b[i] = random(180,255);
  } 
  
  //lights
  for (int i = 0; i < 7; i++) {
    LxPos[i] = 60*i+60;
    LyPos[i] = 200;
    isOn[i] = false;
  }
    for (int i = 0; i < 7; i+=2) {
      isOn[i] = !isOn[i];
    }
  //img
  toothpaste = loadImage("toothpaste.png");
}

void draw(){

  background(169,225,247); 
  noStroke();
  
  for (int i = 0; i<7; i++) {
    if (isOn[i] == true) {
      fill(255,128,128);
    }
    if (isOn[i]==false) {
      fill(255);
    }
    ellipse(LxPos[i], 50, 30, 30);
    
    if (isOn[i] == true) {
      fill(255);
    }
    if (isOn[i]==false) {
      fill(255,128,128);
    }
    ellipse(LxPos[i], 150, 30, 30);
    
  }
  
  
  

  
  //washing balls
  for (int i = 0; i < n; i++){
    yVel[i] += 0.8;
    xPos[i] = xPos[i]+xVel[i];
    yPos[i] = yPos[i]+yVel[i];
  
  }


 for (int i = 0; i < n; i++){
       fill(r[i], g[i], b[i], 200);
  ellipse(xPos[i], yPos[i], 30, 30);
  
   if (xPos[i] <= 0){
   xVel[i] = xVel[i]*-1;
   }
   
   if (xPos[i] >= 499){
   xVel[i] = xVel[i]*-1;
   }

   if (yPos[i] >= 485){
   yVel[i] = yVel[i]*-1;
       xVel[i] *= 0.85;
   }
 
   if (yPos[i] <= 0){
   yVel[i] = yVel[i]*-1;
       xVel[i] *= 0.85;
   } 


 
 }

/*
 for (int i = 0; i < n; i++) {
   for (int k = 0; k < n; k++) {
     if(i != k){
       if (dist(xPos[i], yPos[i], xPos[k], yPos[k]) < 20) {
         xVel[i] *= -1;
         yVel[i] *= -1;
       }
      }   
   }
 } */
  for (int i = 0; i < n; i++){
   if (yPos[i] > 485){
     yPos[i] = 485;
   }
  }
  
  for (int i = 0; i < n; i++){
    if (dist(mouseX, mouseY, xPos[i], yPos[i]) < 20){
      yVel[i] += 0.8;
       xVel[i] = random(-10, 10);
       yVel[i] = random(-3, 5);
       yPos[i] = random(1, 485);
       xPos[i] = random(1, 499);
      
     
    }    
  }
//counter
  currentTime = millis();
  if (currentTime - startTime >=interval) {
    for (int i = 0; i < 7; i++) {
      isOn[i] = !isOn[i];
    startTime = millis();}
  }
//img
  image(toothpaste, 26,25);

  
}


 void keyReleased() {
  if (key =='1') {
    for (int i = 1; i < 7; i+=2) {
      isOn[i] = !isOn[i];
      println(i);
    }
  }

  if (key == '2') {
    for (int i = 0; i < 7; i+=2) {
      isOn[i] = !isOn[i];
    }
  }

  if (key == '3') {
    for (int i = 0; i < 7; i++) {
      isOn[i] = !isOn[i];
    }
  }
}

