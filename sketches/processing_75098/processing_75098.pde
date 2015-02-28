

/*
The animation code was modded from Sequential by James Patterson.  
*/


int numFrames = 22; int frame = 0;
PImage[] images = new PImage[numFrames];
    
 //

void setup()
{
  size(400, 400); frameRate(10);

  //Sonic A
  images[0]  = loadImage("SonicA_0.png");
  images[1]  = loadImage("SonicA_1.png");
  images[2]  = loadImage("SonicA_2.png");
  images[3]  = loadImage("SonicA_3.png");

 //Sonic B
  images[4]  = loadImage("SonicB_1.png");
  images[5]  = loadImage("SonicB_2.png");
  images[6]  = loadImage("SonicB_3.png");

 //Sonic C
  images[7]  = loadImage("SonicC_0.png");
  images[8]  = loadImage("SonicC_1.png");
  images[9]  = loadImage("SonicC_2.png");
  //Sonic D
  images[10]  = loadImage("SonicD_0.png");
  images[11]  = loadImage("SonicD_1.png");
  images[12]  = loadImage("SonicD_2.png");
  images[13]  = loadImage("SonicD_3.png");
  //Sonic E
  images[14]  = loadImage("SonicE_0.png");
  images[15]  = loadImage("SonicE_1.png");
  images[16]  = loadImage("SonicE_2.png");
  images[17]  = loadImage("SonicE_3.png");
  //Sonic F
  images[18]  = loadImage("SonicF_0.png");
  images[19]  = loadImage("SonicF_1.png");
  images[20]  = loadImage("SonicF_2.png");
  images[21]  = loadImage("SonicF_3.png");


 
} 
 
void draw() 
{ 
  background(random(255),random(255),random(255));

//Line Warp code originally created by Rob Dekoch.
 for (float x=0; x<width; x=x+random(20,50)){
   stroke(random(75));
   strokeWeight(random(5));
   line(x,0,mouseX,mouseY);
   
   line(mouseX,mouseY,x,height);
  for (float y=0; y<height; y=y+random(20,50))  {
  line(0,y,mouseX,mouseY);
   line(mouseX,mouseY,width,y);
   
  }
}

 
  frame = frame + 1;
  if (frame >= numFrames) { frame = 0; }
  image(images[frame], mouseX - 30, mouseY - 30);
   

 
}

