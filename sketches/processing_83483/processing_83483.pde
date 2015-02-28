
 /* @pjs preload=("MollyCrazy.jpg") */
  PImage p;
  int countt = 0;
  int count2 = 0;
  int inN = 300;
  boolean pushed = false;
  boolean first = true;
 


void setup(){
    p = loadImage("MollyCrazy.jpg");
  size(600,600);
  background(p);
  makeBackground(p);
  frameRate(20);
  
}
void makeBackground(PImage input){
  /* loadPixels();
     for (int row = 0; row < height;row++) {
     for (int col = 0; col < width; col++) {
       int t = row * width + col;
       int myRed = (int)red(pixels[t]);
       int myBlue = (int)blue(pixels[t]);
       int myGreen = (int)green(pixels[t]);
      if(myRed < 200){
      myRed = myRed + 4;
      }
      else{
       myRed =  myRed - 100; 
      }
      pixels[row*width+col] = color(myRed, myGreen, myBlue);
    }
    
  }
  updatePixels();
   */
      loadPixels();
   int ma = width * height * 253;
   int sum = 0;
   boolean screeniswhite = false;
 while(screeniswhite == false)   {
   for(int i = 0;i < width*height;i++){
      if(pixels[i] >= 253){
         pixels[i] = 255;
      }
      if(pixels[i] < 255){
      
      pixels[i] = pixels[i] + 1;
      sum = sum + pixels[i];
      }
  }
  if(sum > ma){
    screeniswhite = true; 
    }
   }
  updatePixels();
  
}
void makeSpace(int xLow, int xHigh, int yLow, int yHigh,int coll){
    loadPixels();
    
    for (int row = yLow; row < yHigh;row++) {
     int rIncrement = 1;
     for (int col = xLow; col < xHigh; col++) {
      int t = row*width+col;
     
      int myRed = (int)red(pixels[t]);
      int myGreen = (int)green(pixels[t]);
      int myBlue = (int)blue(pixels[t]);
   if(coll == 1){
      if (myRed < 100 || myRed > 240) { 
      }
  
      myRed = myRed + rIncrement;
    }
    
    else{
     myRed = 200;
     myGreen = 0;
     myBlue = 100;
   }
   pixels[t] = color(myRed, myBlue, myGreen);

  }
   
  }
  updatePixels();
 } 
 
void makeFlow(int n){
   loadPixels();

  int myXLow = (int)random(1,500);
  int myXHigh = myXLow + 50;
  
  int myYLow = (int)random(1,250);
  int myYHigh = myYLow + 40 + (int)random(1,35);
  int xincrement = (int)random(1,5);
  int yincrement = (int)random(1,5);
  for(int i = 0;i<n;i++){
  
   if(myXHigh > 580|| myXLow < 7){
    xincrement = xincrement * (-1);
    
    }
   if(myYHigh > 580){
     yincrement = -1;
   }
   if(myYLow < 10){
     yincrement = 1;
   }
   myXLow += xincrement;
   myXHigh += xincrement;
   myYLow += yincrement;
   myYHigh += yincrement;
  makeSpace(myXLow,myXHigh,myYLow,myYHigh,1);

   
  }
  updatePixels();
   
 } 
 void makedow(int n){

  int myXLow = (int)random(1,500);
  int myXHigh = myXLow + 50;
  
  int myYLow = (int)random(1,250);
  int myYHigh = myYLow + 40 + (int)random(1,35);
  int xincrement = (int)random(1,5);
  int yincrement = (int)random(1,5);
  	


  for(int i = 0;i<n;i++){
  int endHeight = (int)random(30,80);
  int endWidth = (int)random(30,80);

   if(myXHigh > 580|| myXLow < 7){
    xincrement = xincrement * (-1);
    
    }
   if(myYHigh > 580){
     yincrement = -1;
   }
   if(myYLow < 10){
     yincrement = 1;
   }
    copy(p,myXHigh, myYHigh, 50, 50, myXHigh + xincrement, myYHigh + yincrement, endWidth, endHeight);

  myXLow += xincrement;
   myXHigh += xincrement;
   myYLow += yincrement;
   myYHigh += yincrement;
   // Rectangle shows area being copied
 // rect(myXHigh, myYLow, 50, 50);

  }
   
   
 }
 void mousePressed(){
         makeBackground(p);

   int multi = (int)random(2,5);
    inN = 100 * multi;
    if(pushed == true){
      pushed = false;
      background(p);
    }
    else{
    pushed = true;
    }
 }


void draw(){
 
if(pushed == true){
  makeBackground(p);


  makeFlow(inN);

  }
  else{

    makedow(70);

   
  }

}




