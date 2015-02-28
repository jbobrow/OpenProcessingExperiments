
//variables//
 
PImage img1;
PImage img2;
PImage img3;
PImage img4;


int img1X=0;
int img1Y=0;
int img1Xspeed=1;

int img2X=-20;
int img2Y=50;
int img2Xspeed=2;

int img3X=-50;
int img3Y=175;
int img3Xspeed=1;

int img4X=0;
int img4Y=125;
int img4Xspeed=3;





//execute once, at program launch// 
void setup(){
  size(1000,400);
  background(100,32,127);
  frameRate(60);
  smooth();
   
  
  img1 = loadImage("img1.gif");
  img2 = loadImage("img2.gif");
  img3 = loadImage("img3.gif");
  img4 = loadImage("img4.gif");
}

 
 
 
// execute over and over //  

void draw(){

  background(255,255,255);
  
  //move image 1//
  img1X = img1X + img1Xspeed;
  image(img1, img1X, img1Y);
  
  if(img1X >= width){
    img1X = 0;
    }
  
  //move image 2//
  img2X = img2X + img2Xspeed;
  image(img2, img2X, img2Y);
  
  if(img2X >= width){
    img2X = 0;  
    }
    
   //move image 3//
  img3X = img3X + img3Xspeed;
  image(img3, img3X, img3Y);
  
  if(img3X >= width){
    img3X = 0;  
    }
    
    //move image 3//
  img4X = img4X + img4Xspeed;
  image(img4, img4X, img4Y);
  
  if(img4X >= width){
    img4X = 0;  
    }
    



}

