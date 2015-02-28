
class Square
{
  float x,y;
  float nx,ny;
  float s;
  float c;
  float transx,transy;
  float angle;
  float sStroke;
  float sWeight;
  float sHue;
  float sat;
  float bri;
  float sAlpha;
  
  Square(float xpos,float ypos,float sSize)
  {
    x=xpos;
    y=ypos;
    s=sSize;
  }
    
    void update(float nx,float ny,float ns)
    {
      x=nx;
      y=ny;
      s=ns;
    }
    
    void spin(float trax,float tray,float ang)
    {
      transx=trax;
      transy=tray;
      angle=ang;
    }
    
    void colors(float nsStroke,float nsWeight,float nsHue,float nsat,float nbri,float nsAlpha)
    {
      sStroke=nsStroke;
      sWeight=nsWeight;
      sHue=nsHue;
      sat=nsat;
      bri=nbri;
      sAlpha=nsAlpha;
    }
    
    void display()
    {
      colorMode(HSB,360,100,100);
      stroke(0,0,sStroke);
      strokeWeight(sWeight);
      if(sWeight==0){noStroke();}
      colorMode(HSB,360,100,100,255);
      fill(sHue,sat,bri,sAlpha);
      rectMode(CENTER);
      pushMatrix();
    
      translate(transx,transy);
      rotate(angle);
      
      rect(x,y,s,s);
  
      popMatrix();
    }
}
      

