
class Square
{
  float x,y;
  float nx,ny;
  float xo,yo;
  float s;
  float hs;
  float age;
  float c;
  float transx,transy;
  float angle;
  float sStroke;
  float sWeight;
  float sHue,sat,bri,sAlpha;
  float xVel,yVel,xAcc,yAcc,xFric,yFric,xVelo;
  float yFloor=height*1/2;
  int  num;
   
  Square(float xpos,float ypos,float sSize)
  {
    x=xpos;
    y=ypos;
    s=sSize;
  }
     
    void updatePos(float nx,float ny)
    {
      x=nx;
      y=ny;
    }
     
    void updateSize(float ns)
    {
      s=ns;
    }
     
    void update()
    {
      xVel+=xAcc;
      yVel+=yAcc;
 
      x+=xVel;
      y+=yVel;
       
      age+=1;
    }
     
    void spin(float trax,float tray,float ang)
    {
 //     transx=trax;
 //     transy=tray;
      transx=x;
      transy=y;
      angle=ang;
    }
     
    void movement(float nxVel,float nyVel,float nxAcc,float nyAcc)
    {
      xVel=nxVel;
      yVel=nyVel;
      xAcc=nxAcc;
      yAcc=nyAcc;
   //   xFric=nxFric;
   //   yFric=nyFric;
    }
     
    void regenerate(float nxo,float nyo,float nxVel)
    {
      xo=nxo;
      yo=nyo;
      xVelo=nxVel;
       
      if((y>=yFloor-hs)&&(yVel>0))
      {
        y=yFloor-hs;
        yVel=-yVel/1.01;
      }
      if((y<=hs)&&(yVel<0))
      {
        y=hs;
        yVel=-yVel/30;
      }
      if((x>=width-hs)&&(xVel>0))
      {
        x=width-hs;
        xVel=-xVel/1.04;
      }
      if((x<=hs)&&(xVel<0))
      {
        x=hs;
        xVel=-xVel/1.04;
      }
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
      colorMode(HSB,mouseX,100,100);
      stroke(0,0,sStroke);
      strokeWeight(sWeight);
      if(sWeight==0){noStroke();}
      colorMode(HSB,360,100,100,255);
      fill(sHue,sat,bri,sAlpha);
      rectMode(CENTER);
      pushMatrix();
      translate(x,y);
 
      rotate(angle);
 
      rect(0,0,s,s);
 
 
      hs=s/2;
      popMatrix();
       
      stroke(0);
      strokeWeight(3);
       //floor line
       
      pushMatrix();
      translate(x,-y+2*yFloor);
      rotate(angle);
      rect(0,0,s,s);
      hs=s/2;
      popMatrix();
       
 
  }
}


