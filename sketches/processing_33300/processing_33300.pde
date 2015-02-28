
//variables//
 
PImage img1;
PImage img2;
PImage img3;
PImage img4;


int img1X=0;
int img1Y=0;
int img1Xspeed=8;

int img2X=-20;
int img2Y=50;
int img2Xspeed=10;

int img3X=-50;
int img3Y=175;
int img3Xspeed=5;

int img4X=0;
int img4Y=125;
int img4Xspeed=10;





//execute once, at program launch// 
void setup(){
  size(400,400);
  
  frameRate(120);
  smooth();
   
  
  img1 = loadImage("img1.gif");
  img2 = loadImage("img2.gif");
  img3 = loadImage("img3.gif");
  img4 = loadImage("img4.gif");
}

 
 
 
// execute over and over //  

void draw(){

  
  
  //gradient bg//
  colorMode(RGB,255);

  for (int i=0; i<400; i++){
  for (int j=0; j<400; j++){
  
  stroke(i,0,j);  
  point(i+0, j+0);
  
  stroke(j,0,i);  
  point(i+width, j+0);  
  }
  }
  
  
  
  
  //move image 1//
  //(start; end; increment)//
  for(int j=0; j < 1; j++)
  image(img1, j+img1X, img1Y);
  img1X = img1X + img1Xspeed;
  
  if(img1X >= width){
    img1X = 0;  
  }
  
  //move image 2//
  //(start; end; increment)//
  for(int j=0; j < 1; j++)
  image(img2, j+img2X, img2Y);
  img2X = img2X + img2Xspeed;
  
  if(img2X >= width){
    img2X = 0;  
  }
  
    //move image 2//
  //(start; end; increment)//
  for(int j=0; j < 1; j++)
  image(img2, j+img2X, img2Y);
  img2X = img2X + img2Xspeed;
  
  if(img2X >= width){
    img2X = 0;  
  }
  
    //move image 3//
  //(start; end; increment)//
  for(int j=0; j < 1; j++)
  image(img3, j+img3X, img3Y);
  img3X = img3X + img4Xspeed;
  
  if(img4X >= width){
    img4X = 0;  
  }
  
      //move image 4//
  //(start; end; increment)//
  for(int j=0; j < 1; j++)
  image(img4, j+img4X, img4Y);
  img4X = img4X + img4Xspeed;
  
  if(img4X >= width){
    img4X = 0;  
  }
  
  
    



}

