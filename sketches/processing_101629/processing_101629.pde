
import ddf.minim.*;

Minim minim;
AudioPlayer apTI;
CircleWaveForm cwfLiveYourLife;
ArrayList<PShape> alSnapShots = new ArrayList();

// int iMouthScale; //Becacuse the level is between 0 and 1, but usually closer to 0,
                     //use this to scale the mouth up.
// int iQuality; //higher is less, but faster probably
// float fMaxRadius;

void setup()
{
  frameRate(25);
  size(500, 500, P2D);
  minim = new Minim(this);
  apTI = minim.loadFile("live your life.mp3");
  cwfLiveYourLife = new CircleWaveForm(apTI, width/2, height/2);
  
  //iMouthScale = 6;
  //iQuality = 1;
  //fMaxRadius = 150;
 
  background(0);
} 

void draw()
{
  //clear the screen
  background(0);

  //Draw all the saved snapshots
  for (PShape psSnapShot : alSnapShots)
  {
    shape(psSnapShot);
  }
  
  //Draw the mouse
  cwfLiveYourLife.setX(mouseX);
  cwfLiveYourLife.setY(mouseY);
  PShape psCWFSnapShot = cwfLiveYourLife.createSnapShot();
  shape(psCWFSnapShot);
  
  //check if the mouse is pressed. if it is, save the PShape, and draw it every frame
  if (mousePressed)
  {
    alSnapShots.add(psCWFSnapShot);
  }
  
  if (alSnapShots.size() > 150)
  {
    alSnapShots.remove(0);
  }
  
//  background(0);
//  float[] fMixArray = apTI.mix.toArray();
//  float fCurrentLevel = apTI.mix.level();
//  float fAmplitude;
//  
//  beginShape();
//  for (int i = 0; i < fMixArray.length / iQuality; i++)
//  {
//    fAmplitude = fMixArray[i] * (fMaxRadius / 2);
//    
//    //Remember: fAmplitude could be negative or positive. So since fMaxRadius is the max
//    //radius, we don't want to subtract or add the whole radius. So what I did is start
//    //with a circle half the size of fMaxRadius, then add fAmplitude, which can be either
//    //-fMaxRadius/2 or fMaxRadius/2.
//    
//    float fRadius = (fMaxRadius / 2) + fAmplitude;
//    float fX = (sin(TWO_PI * ((i * iQuality) / float(fMixArray.length))) * fRadius);
//    float fY = (cos(TWO_PI * ((i * iQuality) / float(fMixArray.length))) * fRadius);
//    fY = fY * (fCurrentLevel * iMouthScale);
//    vertex((width / 2) + fX, (height / 2) + fY);
//  }
//  endShape();
}

void stop()
{
    apTI.close();
    minim.stop();
    super.stop();
}
public class CircleWaveForm
{
  private AudioPlayer m_apPlayer;
  private int m_iQuality; //lower is better quality, but maybe slower (more vertices)
  
  //Describe the center of the object
  private int m_iX;
  private int m_iY;
  private float m_fRadius;
  
  //Constructor
  CircleWaveForm(AudioPlayer apPlayer, int iX, int iY)
  {
    m_apPlayer = apPlayer;
    m_apPlayer.play();
    m_iQuality = 20;
    m_iX = iX;
    m_iY = iY;
    m_fRadius = 50;
  }
  
  ////////////////////////////////////////
  //Getters
  AudioPlayer getAudioPlayer()
  {
    return m_apPlayer;
  }
  
  int getQuality()
  {
    return m_iQuality;
  }
  
  int getX()
  {
     return m_iX;
  }
  
  int getY()
  {
    return m_iY;
  }
  
  float getRadius()
  {
    return m_fRadius;
  }
  
  ////////////////////////////////////////
  //Setters
  void setAudioPlayer(AudioPlayer apPlayer)
  {
    m_apPlayer = apPlayer;
  }
  
  void setQuality(int iQuality)
  {
    m_iQuality = iQuality;
  }
  
  void setX(int iX)
  {
    m_iX = iX;
  }
  
  void setY(int iY)
  {
    m_iY = iY;
  }
  
  void setRadius(float fRadius)
  {
    m_fRadius = fRadius;
  }
  
  ////////////////////////////////////////
  //Other methods
  PShape createSnapShot()
  {
    //Make some vars
    float[] fMixArray = m_apPlayer.mix.toArray();
    float fCurrentLevel = m_apPlayer.mix.level();
    float fAdjustedAmplitude;
   
   //Create the shape
    PShape psCWFSnapShot = createShape();
    
    //Create ColorRamp and fill the shape
    colorMode(HSB);
    int iColorValue = frameCount % 510;
    if (iColorValue > 255)
    {
      iColorValue = 510 - iColorValue;
    }
    psCWFSnapShot.fill(iColorValue, iColorValue, iColorValue); 
    
    
    for (int i = 0; i < fMixArray.length / m_iQuality; i++)
    {
      //fAdjustedAmplitude will be max of m_fRadius, min of -m_fRadius
      fAdjustedAmplitude = fMixArray[i * m_iQuality] *  m_fRadius;
      float fAdjustedRadius = m_fRadius + fAdjustedAmplitude;
      
      float fXAdjust = (sin(TWO_PI * ((i * m_iQuality) / float(fMixArray.length))) * fAdjustedRadius);
      float fYAdjust = (cos(TWO_PI * ((i * m_iQuality) / float(fMixArray.length))) * fAdjustedRadius);
      
      psCWFSnapShot.vertex(m_iX + (fXAdjust * fCurrentLevel), m_iY + (fYAdjust * fCurrentLevel));
    }
    psCWFSnapShot.end(CLOSE);
    
    return psCWFSnapShot;
  }
}
  
    


