

class charBox
{
  boolean mode=false;
  char ichar;
  color textcolor;
  float angle, iradius, fontsize, speed, angleSpeed;
  float posx, posy;
  charBox(char ichar)
  {
    this.ichar=ichar;
    defaultSet();
  }

  charBox()
  {
    int ranchar=(int)random(65, 91);
    this.ichar=char(ranchar);
    defaultSet();
  }

  public void setPosition(float x, float y)
  {
    posx=x;
    posy=y;
  }

  public void defaultSet()
  {
    float temp;
    angle=random(0, 360);
    fontsize=random(40,80);
    textFont(createFont("Helvetica", fontsize));
    temp=sqrt(sq(width/2)+sq(height/2));
    iradius=random(temp+100, temp+300);
    speed=random(0.5, 1);
    angleSpeed=random(0.05,3);
    
    temp=random(20,200);
    textcolor=color(temp);
    //angleSpeed=random(-3,3);
    //while(angleSpeed<0.5 && angleSpeed> -0.5) angleSpeed=random(-3,3);
  }

  void display()
  {
    fill(textcolor);
    distanceCheck();

    pushMatrix();
    translate(posx, posy);
    textAlign(CENTER, CENTER);
    rotateZ(frameCount*speed/10);
    rotateX(frameCount*speed/20);
    text(ichar, 0, 0);
    popMatrix();
  }

  public void anglePlus()
  {
    
    angle+=angleSpeed;
  }

  public void decrease()
  {
    float temp=sqrt(sq(width/2)+sq(height/2));
    iradius-=speed*(iradius-200)/(temp);
  }

  void distanceCheck()
  {
    float temp=sqrt(sq(width/2)+sq(height/2));
    //fontsize=fontsize;
    if(mode)scale(dist(posx,posy,width/2,height/2)/(temp));
    else scale( (dist(posx,posy,width/2,height/2)-250)/(temp));
  }
  
  public void modeChange()
  {
    mode=!mode;
  }
}


