
//float[] xPos = {300, 469, 52, 197, 10, 294, 460, 21, 25, 20};
//float[] yPos = {450, 480, 236, 3, 300, 29, 10, 12, 200, 20};
int n = 10;
float[] xVel = new float[n];
float[] yVel = new float[n];
float[] r = new float[n];
float[] g = new float[n];
float[] b = new float[n];
float[] xPos = new float[n];
float[] yPos = new float[n];
PImage bgg;

void setup(){
  smooth();
  size(500,500);
  bgg = loadImage("data/circ.png");
  
  //bg
  for (int g = 0; g < width; g++){
    for (int b = 0; b < height; b++){
    noStroke();
    fill(g, b, 150);
    ellipse(g,b,2,2);
    }
  }


  for (int i = 0; i < n; i++) {
    xPos[i] = random(1, 499);
  }

  for (int i = 0; i < n; i++) {
    yPos[i] = random(1, 499);
  }

  for (int i = 0; i < n; i++){
   xVel[i] = random(-3, 5);
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
  b[i] = random(150,200);
  } 
  
}

void draw(){

  noStroke();
  
  for (int i = 0; i < n; i++){
  xPos[i] = xPos[i]+xVel[i];
  yPos[i] = yPos[i]+yVel[i];
  }


 for (int i = 0; i < n; i++){
       fill(r[i], g[i], b[i],50);
  ellipse(xPos[i], yPos[i], 30, 30);
  
   if (xPos[i] <= 0){
   xVel[i] = xVel[i]*-1;
   }
   
   if (xPos[i] >= 500){
   xVel[i] = xVel[i]*-1;
   }

   if (yPos[i] >= 500){
   yVel[i] = yVel[i]*-1;
   }
 
   if (yPos[i] <= 0){
   yVel[i] = yVel[i]*-1;
   } 


 
 }


 for (int i = 0; i < n; i++) {
   for (int k = 0; k < n; k++) {
     if(i != k){
       if (dist(xPos[i], yPos[i], xPos[k], yPos[k]) < 10) {
         xVel[i] *= -1;
         yVel[i] *= -1;
       }
      }   
   }
 } 

//circle
  imageMode(CENTER);
  image(bgg,250,250);
  
}

void keyPressed() {
    if (n >= 1){
      if (keyCode == DOWN){
         n = n-1;
        }
    }
      
    if (n <= 9){
      if (keyCode == UP){
       n = n+1;
      }
    } 
 }

