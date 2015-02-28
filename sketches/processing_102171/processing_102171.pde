
//http://archive.org/details/LoopingStarfieldWithBackgroundStars9sLoop
//http://www.freesound.org/people/qubodup/sounds/146770/
//http://www.freesound.org/people/Wolfsinger/sounds/25761/
//http://openclipart.org/detail/48859/navicella-spaziale-by-theskull

Maxim maxim;
AudioPlayer player;

int currentPosition = 0;
PImage [] images;
float warpspeed = .2;
float normalspeed = .2;

void setup()
{
    maxim = new Maxim(this);
    player = maxim.loadFile("spaceengine.wav");
    player.setLooping(true);
  
    images = loadImages("Animation_data/movie", ".jpg", 134); //set up images for animation
    size(420,280);
    
}

void draw()
{ 
  player.play();
  player.speed(warpspeed);

  image(images[currentPosition], 0, 0);
  currentPosition += 1; //play animation
  
  if(mousePressed == true) //if mouse is pressed
  {
    currentPosition += (int)map(dist(width/2, height/2, mouseX, mouseY), 0, height, 6, 1); // increase speed of animation based on how far you are from center
    warpspeed = (float)map(dist(width/2, height/2, mouseX, mouseY), 0, height, 2, .05);
    player.speed(warpspeed);

  }
  else
  {
    player.speed(normalspeed);
  }
  
  if(currentPosition >= images.length) //loop starfield
  {
     currentPosition = 0;
  }  
}
//The MIT License (MIT)

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



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


