


int numFrames =2;  
int frame = 0;
PImage[] images = new PImage[numFrames];

PImage img1;

float offset = 0;
float easing = 0.05;


void setup()
{
  
  size(496, 343);
  frameRate(30);

img1 = loadImage("pic_2_2.png");

}
 
void draw(){
 

  image(img1, 0, 0);
  
  float dx = (mouseX-img1.width/2) - offset;
  offset += dx * easing; 
  image(img1, offset, 0);
  


  images[0]  = loadImage("pic_1_2.png");
 



    for (int x = 290; x<380; x+=1) {
      for (int y = 100; y<211; y+=1) {
        stroke(random(255));
        point(x, y);
      }
    }

    frame = frame + 1;
    if (frame>=numFrames) {
      frame=0;
    }

   
    image(images[0], 0, 0);
 
  }
  
 



