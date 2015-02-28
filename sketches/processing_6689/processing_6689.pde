

abstract class AnimationTemplate 
{
  protected final PApplet processing; 
 
  protected String imageName;
  
  protected float explosionUpperBound;
  protected float explosionLowerBound;
  protected float explosionStep;
  protected float explosionCurrentPosition;
  
  protected int fillColorAlpha;
  protected int movieType = MovieMaker.MOTION_JPEG_A;
  final static int framePerSecond = 30;
  final static int numberOfFramesForEndPadding = 45;
  protected PImage image;

  private boolean writeVideo;
  protected MovieMaker movieBuilder;  
  
  AnimationTemplate(PApplet processing, String imageName, boolean writeVideo) { 

    this.processing = processing; 
    this.imageName = imageName;
    
    image = processing.loadImage(this.imageName);
    
    this.writeVideo = writeVideo;
    
    if (writeVideo == true)
    {
      movieBuilder = new MovieMaker(this.processing, getScreenWidth(), getScreenHeight(), "video.mov",
                           framePerSecond, movieType, MovieMaker.HIGH);      
    }
    
  } 

  public PImage loadImage() { 
    return image; 
  }
  
  public int getFillColorAlphaValue() { 
    return fillColorAlpha; 
  }

  public float getNextExplosionPosition() { 
    float result = explosionCurrentPosition;

    if (explosionCurrentPosition > explosionLowerBound)
    {
      explosionCurrentPosition += explosionStep;
    }
    else if (movieBuilder != null)
    {
      explosionCurrentPosition = 0f;      
    }    

    println(result);
    return result;
  }


  public void addVideoFrame() {
    if (movieBuilder == null)
    {
      return;
    }    
    

    if (explosionCurrentPosition > explosionLowerBound)
    {
      movieBuilder.addFrame();
    }
    else
    {
      for (int i = numberOfFramesForEndPadding; i > 0; --i)
      {
        movieBuilder.addFrame();     
      }
      movieBuilder.finish();
      exit();
    }       
  }

  protected void setExplosionStep(float explosionStep)
  {
    this.explosionStep = explosionStep;
    if (writeVideo == false)
    {
      this.explosionStep = this.explosionStep * 40f;
    }
  }  
  public abstract int getScreenWidth();  
  public abstract int getScreenHeight();
  public abstract boolean getUseShortDistanceRendering();
  public abstract float getTranslatePositionX(float x);
  public abstract float getTranslatePositionY(float y);

}

