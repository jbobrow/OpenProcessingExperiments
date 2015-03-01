
public final class FramesCounter
{
  private PApplet Parent;

  private int currentFrames, fpsTimer;
  private boolean isEnabled;

  public FramesCounter(PApplet p)
  {
    this.Parent = p;
  }

  public FramesCounter(PApplet p, boolean isEnabled)
  {
    this(p);
    this.isEnabled = isEnabled;
  }

  public void Act()
  {
    isEnabled = !isEnabled;
    fpsTimer = 0;
  }

  public boolean GetStatus()
  {
    return isEnabled;
  }

  public void SetStatus(boolean value)
  {
    isEnabled = value;
  }

  public void Show()
  {
    if (isEnabled)
    {
      if (fpsTimer >= 5)
      {
        currentFrames = (int) (Parent.frameRate);
        fpsTimer = 0;
      }

      Parent.fill(0);

      // Parent.text(fpsTimer,100,100); //debug
      Parent.textSize(12);
      Parent.text(currentFrames, Parent.width - 20, Parent.height - 5);

      ++fpsTimer;
    }
  }
}






