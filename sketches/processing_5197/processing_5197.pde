
class Brain extends ClickableElement
{
  PShape brainshape = loadShape("brain.svg");
  PImage brainimage = loadImage("brains.png");
  
  public Brain(float x, float y)
  {
    super(x,y,"brain");
    elementHeight = brainshape.height;
    elementWidth = brainshape.width;
  }
  
  void update()
  {
    super.update();
  }
  
  void draw()
  {
    if (selected)
    {
      image(brainimage, positionX - (elementWidth/2.0), positionY - (elementHeight/2.0), elementWidth, elementHeight);
    }
    else
    {
      smooth();
      brainshape.enableStyle();
      shape(brainshape, positionX - (elementWidth/2.0), positionY - (elementHeight/2.0), elementWidth, elementHeight);
    }
    super.draw();
  }
  
//  void doDragEvent()
//  {
//    
//  }
   
  // this causes some major perfomance issues
//  void drawOffScreen(PGraphics p)
//  {
//    p.smooth();
//    brainshape.disableStyle();
//    p.stroke(color((offScreenColor>>16)&0xFF,(offScreenColor>>8)&0xFF,offScreenColor&0xFF,(offScreenColor>>24)&0xFF));
//    p.fill(color((offScreenColor>>16)&0xFF,(offScreenColor>>8)&0xFF,offScreenColor&0xFF,(offScreenColor>>24)&0xFF));
//    p.shape(brainshape, positionX - (brainWidth/2.0), positionY - (brainHeight/2.0), brainWidth, brainHeight);
//  }
}

