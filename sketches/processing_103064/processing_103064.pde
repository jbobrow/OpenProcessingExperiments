
 // Maxim maxim;
//refers to an external maxim.js file
//  AudioPlayer player;
int currentPosition = 0;
PImage [] images;

// a boolean variable to control
// whether the animation is playing
boolean playing = false;

void setup()
{
    images = loadImages("http://www.webartplus.com/NatureStartStop/web-export/Animation_data/nature", ".jpg", 80);
    size(images[0].width, images[0].height);
    size(600, 450);
    // maxim = new Maxim(this);
    // player = maxim.loadFile("http://www.webartplus.com/NatureStartStop/web-export/BD.wav");
   //  player.setLooping(true);
    // player.volume(1.0);
}

PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i =0; i < numImages; i++)
  {
    PImage img = loadImage(stub+i+extension);
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
}

void draw()
{
  
  image(images[currentPosition], 0, 0);
  // the if statement means that
  // we only move to the next frame 
  // if playing is true
  if(playing)
  {
    currentPosition += 1;
    if(currentPosition >= images.length)
    {
       currentPosition = 0;
    }
  }
}

// when the mouse is pressed
// toggle playing 
// (if it is true it will become
// false and vice versa)
void mousePressed()
{
  playing = !playing;
  
}

 void mouseDragged()
{
//player.play();
}
