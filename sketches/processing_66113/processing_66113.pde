

class Gem {

  PImage p;
  boolean hit;
  int gemX, gemY;
  int gemRadius;
  float bobbingModifier, t, alphaValue, r, g, b;
  int timer;

  Gem(int x, int y)
  {
    gemRadius = 25;
    gemX = x;
    gemY = y;
    p = loadImage("gem.png");
    alphaValue = 255;
  }

  void display() 
  {
    //println(p.width + ", " + p.height);
    //image(p, 200, 300, 20, 20);
    imageMode(CENTER);
    t = t + 1;
    bobbingModifier = .01*sin(.1*t);
    tint(255, alphaValue);
    for(int i = 0; i < levelSpikes.numSpikeGaps; i++)
    {
      if(gemX >= levelSpikes.spikeXArray[i] && gemX <= levelSpikes.spikeXArray[i] + levelSpikes.spikeWidthArray[i])
      gemY = gemY - 100;    
    }
    image(p, gemX, gemY + bobbingModifier*gemY, gemRadius, gemRadius);
    noTint();
  }

  void poof() 
  {
    if(alphaValue > 0)
    alphaValue = alphaValue - 12;
    if (gemRadius <= 50)
      gemRadius = gemRadius + 3;
  }
} 


