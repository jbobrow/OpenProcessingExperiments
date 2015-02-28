
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies
//Modified by Vincent Fung, 2013

// Maxim maxim;
// AudioPlayer player;
// PImage [] images;
PImage img;
float currentFrame = 0;
int margin = width/40;

void setup()
{
 size(512,384);
  
 //  background(0);
  // maxim = new Maxim(this);
  // player = maxim.loadFile("mykbeat.wav");
  // player.setLooping(false);
  
  img = loadImage("./Tache_0.jpg");
  // images = loadImages("Animation_data/Tache_", ".jpg", 1);
  // size(images[0].width, images[0].height);

   // player.play(); 
   // background(10);
}

void draw()
{
   // background(10); 
   imageMode(CENTER);
   
   // image(images[currentPosition], 0, 0,mouseX,mouseY);
   image(img, width/2, img.height/2+margin, img.width, img.height);
  
   // image(images[(int)currentFrame], width/2, images[0].height/2+margin, images[0].width, images[0].height);
   // tint(random(1000), random(1000), random(1000), random(1000)); 
   tint(mouseX,mouseY, random(1000), random(1000));
   
  textSize(28);
  fill(0, 102, 153, 204);
  text("Mouse position for Andy Warhol Style", 10, 60);
  // text("Click for a music", 10, 90); 
 
  /*
  currentFrame +=1;
  if (currentFrame >= images.length) {
      currentFrame = 0;
  }
  */
  // player.play();
}

void mouseDragged()
{
}

void mousePressed()
{
 // player.cue(0);
 // player.play();
  
 currentFrame = 0;
}

void mouseReleased()
{
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


