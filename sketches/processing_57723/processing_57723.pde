
  PImage myImage;
  PImage secImage;
int numFrames = 7;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];

int numFrames2 = 3;  // The number of frames in the animation
int frame2 = 0;
PImage[] images2 = new PImage[numFrames2];


 

    
void setup()
{
  myImage = loadImage("EYE1.gif");
  secImage= loadImage("FLOAT1.jpg");

  size(1000, 1000);
  frameRate(0);
  //tint(235,0,0,random(50));
  
  images[0]  = loadImage("LAUGHING.gif");
  images[1]  = loadImage("LAUGHING2.gif"); 
  images[2]  = loadImage("LAUGHING3.gif");
  images[3]  = loadImage("LAUGHING4.gif"); 
  images[4]  = loadImage("LAUGHING5.gif");
  images[5]  = loadImage("LAUGHING6.gif"); 
  images[6]  = loadImage("LAUGHING7.gif");


 frameRate(10);
//tint(0, random(160), 0, 50);

  
  images2[0]  = loadImage("EYE1.gif");
  images2[1]  = loadImage("EYE2.gif"); 
  images2[2]  = loadImage("EYE3.gif");
// tint(0, random(160), 0, 50);
 
} 
 
 

   

 
void draw() 


{ 
  filter(INVERT);

   // tint(0, 0, 20, random(40));
 noTint();
 image(myImage, random(mouseX+50), random(100), mouseX, mouseY);

  //frame = (frame+6) % numFrames;  
  //image(images[frame], 100, 100);
  
  frame2 = (frame+1) % numFrames2;  
  image(images2[frame2], 400, 400);
    frame = (frame+6) % numFrames;  
  image(images[frame], 100, 100);
  
  
  
  
fill(random(120),0, 5, random(30));
  triangle(random(1000),random(height), random(1000), random(width), 30, 50);
  triangle(50,50, random(1000), random(width), random(height), random(1000));
//fill(random(225), random(200), random(80));
  ellipse(random(700), 70,1000, random(1000));
   triangle(random(90),random(60), random(300), random(1500), 90, 600);
     fill(random(50), random(0), random(20), random(200));
     triangle(random(2000),random(1600), random(1600), random(1600), 120, 200);
triangle(random(400),random(400), random(400), random(400), 30, 50);
  rect(  mouseX, mouseY, mouseX+50, mouseY+75);
  
  
  
filter(OPAQUE);
tint(150, 200);
image( secImage, mouseX, mouseY, mouseX+50, mouseY+75);
copy(15, 25, 10, 10, 35, 25, 50, 50);


}

