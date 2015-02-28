
// The Power is Yours by Christian Martin 
//  Click on all of the moving forest before there aren't any left we want 
// to increase the size of our rainforests and thats what I have done here
// This code now not only allows the pictures to move around the screen and 
// Clickable to make them huge but now you also get to see different backgrounds
// by moving the mouse.
// this is pretty much a blatant eco terroist game inspired by Captain Planet 
//


PImage  destruction, fail, grass;
int numImages = 5;
int destructionX, destructionY;  //the first img trigger point     
int failX, failY; //the second image trigger point

int destructionSize = 350;     // size of triggers
int failSize = 350;  
color destructionColor;
color failColor;
color baseColor;

boolean destructionOver = false;
boolean failOver = false;


int[] startX = new int[numImages];
int[] startY = new int[numImages];
int[] endX = new int[numImages];
int[] endY = new int[numImages];
int[] currentY = new int[numImages];
int[] currentX = new int[numImages];
int[] vecX = new int[numImages];
int[] vecY = new int[numImages];
int[] counter = new int[numImages];
int[] duration = new int[numImages];
PImage[] imgs = new PImage[numImages];
int[] imgW=  new int[numImages];
int[] imgH=  new int[numImages];
void setup(){
   size(800,800);
    smooth();
  destruction = loadImage("destruction.jpg");
  fail = loadImage("fail.jpg");
  grass = loadImage("grass.jpg");
  failX = width/2+failSize/2+10;
  failY = height/2;
  destructionX = width/2-destructionSize-10;
  destructionY = height/2-destructionSize/2;
  
  frameRate(30);
   imgs[0] = loadImage("bamboo1.jpg");
   imgs[1] = loadImage("forest1.jpg");
   imgs[2] = loadImage("streamforest.jpg");
   imgs[3] = loadImage("pathforest1.jpg");
   imgs[4] = loadImage("riverforest1.jpg");  

  for(int i=0; i<numImages; i++){
    endX[i] = 0;
    endY[i] = 0;
    counter[i] = 0;
    duration[i] = (int)random(50,100);
    imgW[i]=100;
    imgH[i]=100;
    
    resetMovement(i);
  }
  
}

void draw(){
  update(mouseX, mouseY);

  noStroke();
  if (destructionOver) {
    background(destruction);
  } else if (failOver) {
    background(fail);
  } else {
    background(grass);
  }

  
  
 // background(loadImage("grass.jpg"));
  
  for(int i=0; i<numImages; i++){
    if(counter[i] >= duration[i]){
      resetMovement(i);
    }else{
      currentX[i] = currentX[i] + vecX[i];
      currentY[i] = currentY[i] + vecY[i];
    }
  
   // ellipse(currentX[i], currentY[i], 50, 50);
   image(imgs[i],currentX[i],currentY[i],imgW[i],imgH[i]);

    counter[i]++;
  }
}

void resetMovement(int i){
  counter[i] = 0;
  startX[i] = endX[i];
  startY[i] = endY[i];
  endX[i] = (int)random(50 ,width);
  endY[i] = (int)random(150,height);
  println(i+" startX:"+startX[i]+" startY:"+startY[i]+" endX:"+endX[i]+" endY:"+endY[i]);
  
  vecX[i] = (endX[i] - startX[i]) / duration[i] ;
  vecY[i] = (endY[i] - startY[i]) / duration[i] ;
}
void mousePressed () {
  for(int i=0;i<numImages;i++){ 
    if(mouseX > currentX[i] && 
    mouseY > currentY[i] && 
    mouseX < currentX[i]+imgs[i].width &&
    mouseY< currentY[i]+imgs[i].height ) { // we are clicking on the image 
      println( "clicked on image");
      
      imgW[i] = 300;
      imgH[i] =300; 
    
     
  
    }
  } 
}
void update(int x, int y)
{
  if( overfail(failX, failY, failSize) ) {
    failOver = true;
    destructionOver = false;
  } else if ( overdestruction(destructionX, destructionY, destructionSize, destructionSize) ) {
    destructionOver = true;
    failOver = false;
  } else {
    failOver = destructionOver = false;
  }
}

boolean overdestruction(int x, int y, int width, int height) 
{
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overfail(int x, int y, int diameter) 
{
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

  




