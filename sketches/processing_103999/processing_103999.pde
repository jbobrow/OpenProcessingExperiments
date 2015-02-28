
//Main Class
Maxim maxim;
AudioPlayer player;
AudioPlayer player2;
int maxParticles=30; // max number of particles. real particles count depends on ppf and its lifetime
int addPPF=1;         // number of particles per frame added
ArrayList particles;
int currentPosition = 0;
PImage [] images;

void setup() {
  size(353, 306);
  maxim = new Maxim(this);
  player = maxim.loadFile("nekoharcore.wav");
  player.setLooping(true);
  player2 = maxim.loadFile("Purrlzs.wav");
  player2.setLooping(true);
  player.volume(0.20);
  player2.volume(0.3);
  frameRate(30);
  smooth();
  background(0);
  noStroke();
  particles = new ArrayList();
  images = loadImages("BabyD_Animation/BabyD", ".png", 21);
}

void draw() {
  float imageWidth = (height*images[currentPosition].width)/images[currentPosition].height;
  image(images[currentPosition], 0, 0, imageWidth, height);
  // I've removed currentPosition+=1
  // because the animation is controlled by 
  // the mouse
  if (currentPosition >= images.length)
  {
    currentPosition = 0;
  }
}
void mouseDragged()
{

  player.play();
 
  if (particles.size()<maxParticles) {
    /* add particle(s) */
    for (int i=1; i<=addPPF; i++) {
      particles.add(new Particles());
    }
  }

  pushMatrix();
  translate (mouseX-(width/2), mouseY-(height/2));
  /* run trought all particles and make some interaction */
  for (int j=0; j<particles.size(); j++) {
    Particles particle = (Particles)particles.get(j);
    /* if particle still alive */
    if ( particle.alive() ) {
      /* update x/y positions */
      particle.position();
      /* now draw the flower */
      particle.draw();
    }
    else {
      /* if lifetime is running out, delete */
      particles.remove(j);
    }
  }
  popMatrix();
  
  player.setFilter((float) mouseY/height*5000, mouseX / width);
  // map the x position of the mouse from 
  // the width of the screen to the length of
  // the animation
  // and use that as the current position
  currentPosition = (int)map(mouseX, 0, width, 0, images.length-1);
  // this makes sure that the currentPosition
  // doesn't go below 0 or above the length 
  // of the animation
  currentPosition = constrain(currentPosition, 0, images.length-1);
}

void mouseClicked() {

  player2.play();
  player2.setFilter((float) mouseY/height*5000, mouseX / width);
  player2.ramp(1., 300);
  player2.speed((float) mouseX/width/2);

}

void mouseReleased() {
  player2.stop();
  particles = new ArrayList();
}
//Particles System
public class Particles {
  float x, y, _x, _y, dx=0, dy=0, lt;
  color nucleo;
  /* init start-values */
  public Particles() {
    /* start position center */
    x=width/2;
    y=height/2;
    /* now random values to make it non-linear */
    lt=random(50, 100);       // lifetime in frames
    _x=random(-0.2, 0.2);    // stepwidth in x-pos (left, right)
    _y=random(-0.3, 0.4);    // stepwidth in y-pos (up, down)
    
    nucleo = #ffe825;
  }

  public void position() {
    /* stepwidth increases, speed is exponential */
    dx+=_x;
    dy+=_y;
    x+=dx;
    y+=dy;
  }

  public boolean alive() {
    if (lt<=0) { 
      return false;
    }
    else { 
      lt--; 
      return true;
    }
  }
  void draw() {

    pushMatrix();
    translate (x, y);
    rotate(radians(frameCount*2));
    fill(random(255), 90, 155, 130); 

    for (int i = 0; i < 5; i++) {
      ellipse(0, -10, 18, 18);
      rotate(radians(72));
    }

    fill(nucleo, 200); 
    ellipse(0, 0, 18, 18);
    popMatrix ();
  }
}
//loadImages Class
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


