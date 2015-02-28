
int numFrames = 7;  // The number of frames in the animation
int numFrames1 = 4;
int numFrames2=3;
int numFrames3=2;
int numFrames4=4;
int numFrames5=2;
int numFrames6=3;
//int numFrames4=2;
int frame = 0;
PImage[] images = new PImage[numFrames];
PImage[] imagess = new PImage[numFrames1];
PImage[] imagesfirst=new PImage[numFrames2];
PImage[] imagessrini=new PImage[numFrames3];
PImage[] imagesanisha=new PImage[numFrames4];
PImage[] imagesbradpitt=new PImage[numFrames5];
PImage[] theend= new PImage[numFrames6];
PFont font;
//PImage a;
int counter=0;
PImage honey;
PImage anisha;
PImage noway;

int counter1=0;
int counter2=0;
int counter3=0;
int counter4=0;
int counter5=0;
int counter6=0;
//int counter4=0;    
void setup()
{
  size(800, 600);
  frameRate(2);
     imagess[0]=loadImage("nehaashis.jpg");
   imagess[1]=loadImage("ashis3.jpg");
   imagess[2]=loadImage("ashislove.jpg");
   imagess[3]=loadImage("nehaa.jpg");
   
    imagesfirst[0]=loadImage("nehacover.png");
   imagesfirst[1]=loadImage("neha1.png");
   imagesfirst[2]=loadImage("ashis1.png");
   
   imagesanisha[0]=loadImage("anishalove.jpg");
   imagesanisha[1]=loadImage("anishakid.jpg");
   
   imagesanisha[2]=loadImage("people2.png");
   imagesanisha[3]=loadImage("people1.jpg");
   
   imagesbradpitt[0]=loadImage("nehabrad2.jpg");
   imagesbradpitt[1]=loadImage("nehabrad6.jpg");
   
   imagessrini[0]=loadImage("srinivas3.png");
   imagessrini[1]=loadImage("srinivas2.png");
   
   theend[0]=loadImage ("neha10.jpg");
   theend[1]=loadImage("neha7.jpg");
   theend[2]=loadImage("neha-a.jpg");
   
   //imagesbrad[0]=loadImage("nehabrad1.jpg");
   //imagesbrad[1]=loadImage("nehabrad3.jpg");
   
   //images[0]=loadImage("neha3.png");
   // images[1]=loadImage("srini.png");
  //images[2]=loadImage("neha4.png");
  //images[3]=loadImage("anisha.png");
  //images[4]=loadImage("neha9.png");
  //images[5]=loadImage("neha7.png");
  //images[6]=loadImage("brad.png");
 // images[7]=loadImage(".png");
  //images[8]=loadImage(");


   
  
}
 
 
void draw() { 
  // Use % to cycle through frames
  //image(images[counter], 50, 50);
  image(imagess[counter1],50,50);
  image(imagesfirst[counter2],50,50);
  
 
if (keyPressed==true)  {
  if (key == 'y' || key == 'Y'){
    frameRate(1);
    image(imagess[counter1],50,50);
   counter1 = (counter1+1) % numFrames1;
 }
if(key == 'n' || key == 'N'){

  honey=loadImage("srini.jpg");
    image(honey,50,50);
  //frameRate(2);
  //image(images[counter],50,50);
 //counter = (counter+1);// % numFrames;

}
 if (key=='r'||key=='R'){
   frameRate(4);
   image(imagesfirst[counter2],50,50);
   counter2=(counter2+1)% numFrames2;
 } 
if (key=='s'||key=='S'){
  frameRate(4);
  image(imagessrini[counter3],50,50);
  counter3=(counter3+1)% numFrames3;
}
if (key=='m'||key=='M'){
//frameRate(4);
anisha=loadImage("anisha.png");
image(anisha,50,50);
//image(imagesanisha[counter4],50,50);
//counter4=(counter4+1)%numFrames4;
}
if (key=='l'||key=='L'){
  frameRate(1);
image(imagesanisha[counter4],50,50);
counter4=(counter4+1)%numFrames4;
}
if (key=='q'||key=='Q'){
  frameRate(1);
  noway=loadImage("brad.jpg");
  image(noway,50,50);
}
if (key=='g'||key=='G'){
frameRate(1);
image(imagesbradpitt[counter5],50,50);
counter5=(counter5+1)%numFrames5;

}
if (key=='f'||key=='F'){
  frameRate(1);
  image(theend[counter6],50,50);
  counter6=(counter6+1)%numFrames6;
}

}
}


