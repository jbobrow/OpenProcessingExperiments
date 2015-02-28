
//import the video
import processing.video.*;
Capture video;
//declare all images
PImage pngmona;
PImage pngfrida;
PImage pnggeorge;
PImage pngpearl;
PImage pngqueen;
PImage pnggogh;

PImage mona; 
PImage frida;
PImage george;
PImage pearl;
PImage queen;
PImage gogh;

//load portraits, video and thumbnail images
void setup() {
  size(800, 600);

  pngfrida = loadImage("fridakahlo.png");

  pngmona = loadImage("monalisa1.png");

  pnggeorge = loadImage("George-Washington.png");

  pngpearl = loadImage("pearlearring.png");

  pngqueen = loadImage("queen.png");

  pnggogh= loadImage("van-gogh.png");

  video=new Capture(this,width, height);

  mona = loadImage("monalisa1.jpg");  // Load the image into the program  
  frida = loadImage("fridakahloresize.jpg");
  george = loadImage("George-Washingtonresize.jpg");
  pearl = loadImage("pearlearringresize.jpg");
  queen = loadImage("queenresize.jpg");
  gogh = loadImage("vangogh.jpg");
}
// if mouse is over small images select that portrait
void draw() {

  if (video.available())
  {
    video.read();

    //make the video mirror the viewer
    for (int i = 0; i < width; i = i+1) 
    { 
      for (int j = 0; j < height; j=j+1) 
      { 
        color px = video.get(i,j); 
        float r= red(px); 
        float g= green(px); 
        float b= blue(px); 
        color c= color (r,g,b); 
        set(width-i,j,c); 
      } 
    } 
    if(mouseX>720&&mouseX<720+90&&mouseY>10&&mouseY<10+90)
    {
      image(pngmona,0,0);
    }
    else if (mouseX>720&&mouseX<720+90&&mouseY>110&&mouseY<110+90)
    {
      image(pngfrida,0,0);
    }
    else if (mouseX>720&&mouseX<720+90&&mouseY>210&&mouseY<210+90)
    {
      image(pnggeorge,0,0);
    }
    else if (mouseX>720&&mouseX<720+90&&mouseY>310&&mouseY<310+90)
    {
      image(pngpearl,0,0);
    }
    else if (mouseX>720&&mouseX<720+90&&mouseY>410&&mouseY<410+90)
    {
      image(pngqueen,0,0);
    }
    else if (mouseX>720&&mouseX<720+90&&mouseY>510&&mouseY<510+90)
    {
      image(pnggogh,0,0);
    }
  }
  // thumbnail images of portaits
  image(mona,720,10,90,90);
  image(frida,720,110,90,90);
  image(george,720,210,90,90);
  image(pearl,720,310,90,90);
  image(queen,720,410,90,90);
  image(gogh,720,510,90,90);
}
//if p key is pressed a still image will be saved to sketch folder
void keyPressed()
{
  if (key == 'p')
  {
    saveFrame("portrait.jpg");
  }
}






