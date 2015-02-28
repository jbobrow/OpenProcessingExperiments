

Animation anim1, anim2, anim3;
float xpos, ypos;
float drag = 20.0;

void setup() 
{
  size(500, 300);
  background(113, 173, 188);
  frameRate(12);
  anim1 = new Animation("walkanim1_", 7);
  anim2 = new Animation("walkanim2_", 7);
  anim3 = new Animation("exclamation_", 1);
}

void draw() 
{ 
  float difx = mouseX - xpos;
  if (abs(difx) > 1.0) {
    xpos = xpos + difx/drag;
    xpos = constrain(xpos, 0, width);
}
    
// Display the sprite at the position xpos, ypos
  if (mousePressed)
  {
    background(230, 121, 39);
    frameRate(24);
    anim3.display(xpos, ypos+120);
    if (mouseX > xpos)
    {
       anim1.display(xpos, ypos);
    }
    else
    {
      anim2.display(xpos, ypos);
    }
  } 
  else 
  {
    background(113, 173, 188);
    if (mouseX > xpos)
    {
    anim1.display(xpos, ypos);
    }
    else
    {
      anim2.display(xpos, ypos);
    }
  }
  
}



// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + i + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}



