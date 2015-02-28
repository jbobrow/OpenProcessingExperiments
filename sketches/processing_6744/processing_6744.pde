
public abstract class Button extends Widget
{
  public PImage pressedImage;
  
  public Button(PApplet parent, String label, PImage baseImage, PImage pressedImage)
  {
    super(parent, label, baseImage);
    this.pressedImage = pressedImage;
    
    if (pressedImage.width != baseImage.width || pressedImage.height != baseImage.height)
    {
      p5.println("Warning: Button [" + label + "] pressedImage not same size as baseImage");
    }
  }
    
  public Button(PApplet parent, String label,
                int x, int y, PImage baseImage, PImage pressedImage)
  {
    this(parent, label, baseImage, pressedImage);
    this.x = x;
    this.y = y;
  }

  // * * * * * * * * * * * * * * * * * * * * * * * * * *
  // Subclasses need to implement the press() method.
  // Suggest using pressCheck() to start with
  // * * * * * * * * * * * * * * * * * * * * * * * * * *
  public abstract void press(int modifiersEx);

  public void draw()
  {
    if (!display) return;

    p5.pushStyle();
    
    displayBackground();
    displayBorder();
    displayImage(pressed && mouseOver && active ? pressedImage : baseImage);
    displayHilight();
    debugDisplayBounds();

    p5.popStyle();
  }
  
  public String toString()
  {
    return "Button [" + label + "] @ (" + x + ", " + y + ") " + width + "x" + height;
  }
}


