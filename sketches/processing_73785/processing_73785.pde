

//This code is modded from Sequential by James Patterson. I made it my owns
//by remixing the three little pigs. It is only one in this story

 //Background
  
int numFrames = 19;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];

void setup(){
 
 for (int x =0;x<100;x+=1) {
    for (int y=0;y<100;y+=1) {
      stroke(x+y*2,0,0);
      point(x, y);
    }
  }



size(600, 480);


  frameRate(1.8);
  images[0]  = loadImage("Untitled-2.png"); 
  images[1]  = loadImage("Untitled-3.png"); 
  images[2]  = loadImage("Untitled-4.png");
  images[3]  = loadImage("Untitled-5.png");
  images[4]  = loadImage("Untitled-6.png");
  images[5]  = loadImage("Untitled-7.png");
  images[6]  = loadImage("Untitled-8.png");
  images[7]  = loadImage("Untitled-9.png"); 
  images[8]  = loadImage("Untitled-10.png");
  images[9]  = loadImage("Untitled-11.png");
  images[10]  = loadImage("Untitled-12.png");

 
  images[11]  = loadImage("Untitled-13.png");
  images[12]  = loadImage("Untitled-14.png");
  images[13]  = loadImage("Untitled-15.png");
  images[14]  =loadImage("Untitled-16.png");
  images[15]  =loadImage("Untitled-17.png");
  images[16]  =loadImage("Untitled-18.png");
  images[17]  =loadImage("Untitled-19.png");
  images[18]  =loadImage("Untitled-20.png");


    
} 
 
  
void draw() 
{ 
frame++;
if(frame==numFrames){
  frame=0;




}
  

 image(images[frame], 0, 0);


  
}







   


 
 

