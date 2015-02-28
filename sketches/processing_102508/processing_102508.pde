
Maxim maxim;
AudioPlayer player;

PImage dashboard;
PImage [] images;
PImage [] Buttons = new PImage[2];
PImage [] VolButtons = new PImage[2];
PImage slider;
PImage sliderbutton;
int currentPosition = 0;
int ButtonPlayMarker=1;  // marker for Jumping ButtonPlay image
int VolButtonPlayMarker=0;  // marker for VolPlay image
boolean playing = true; // boolean for Jumping
boolean Volplaying = false; // boolean for Volume

void setup()
{
  size(924,728);
  imageMode(CORNER);
  images = loadImages("Animation_data/movie", ".jpg", 26);
  dashboard = loadImage("index-background.jpg");
  Buttons [0] = loadImage("Animation_data/button-jumping0.png");
  Buttons [1] = loadImage("Animation_data/button-jumping1.png");
  //volume button
  VolButtons [0] = loadImage("volumebuttonoff.png");
  VolButtons [1] = loadImage("volumebuttonon.png");
  //music
  maxim = new Maxim(this);
  player = maxim.loadFile("banana_song.wav");
  player.setLooping(false);
}

void draw()
{
  image(dashboard, 0, 0, 924, 728);
  image(Buttons[ButtonPlayMarker], 158, 475);
  image(VolButtons[VolButtonPlayMarker], 158, 558);
  image(images[currentPosition], 150, 78);
  
  //creating a speed slider
  float ratio = (float) mouseX / (float) width; //when far left of screen = 0/ play slowly. Far right = 1 and play quickly.
  ratio *= 2;
  player.speed(ratio);
   
  //loops jumping image
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
//code for pressing jumping button
  if (mouseX>158 && mouseX<300 && mouseY>475 && mouseY<537) {
      if (playing){
        ButtonPlayMarker=0;
      }
      else{
        ButtonPlayMarker=1;
      }
    playing = !playing;
  }


//code for pressing volume button
  if (mouseX>158 && mouseX<307 && mouseY>558 && mouseY<716) {
      if (Volplaying){
        VolButtonPlayMarker=0;
        player.stop();      }
      else{
        VolButtonPlayMarker=1;
        player.cue(0);
        player.play();
      }
    Volplaying = !Volplaying;
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


