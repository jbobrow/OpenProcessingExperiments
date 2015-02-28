

void actions()
{
  if (screennumber==0)
  {
    if (gamemap==city)
    {
      if (quest==0)
      {

        if (millis()>time + timeDelay)
        {
          begintalk=false;
          beginnum++;
          time=millis();
        }

        else
        {
          begintalk=true;
        }

        if (begintalk)
        {
          if (beginnum == 1)
          {
            text("Use Arrow Keys", 200, 200);
          }
          if (beginnum == 2)
          {
            text("Press Q", 200, 200);
          }

          if (beginnum == 3)
          {
            text("Press M", 200, 200);
          }

          if (beginnum ==4)
          {
            text("Press 'T' next to a Person to Talk", 50, 200);
          }
        }
      }
      if (quest==1)
      {
        if (x+scrollx<-630)
        {
          if (y+scrolly<-280)
          {
            // boston massacre
            if (massacretalknum<6)
            {
              if (millis() > time + timeDelay) 
              {
                massacretalk=false;
                massacretalknum++;
                time=millis();
              }
              else
              {
                massacretalk=true;
              }
            }
          }
        }
      }
      if (massacre)
      {
        bulletspeed=bulletspeed+5;
      }
      if (massacretalk)
      {
        fill(0, 255, 0);
        textFont(font, 20);
        if (massacretalknum==1)
        { 
          text("Lobster!", 1170+scrollx, 450+scrolly);
        }
        if (massacretalknum==2)
        { 
          text("Go home!", 1120+scrollx, 650+scrolly);
        }
        if (massacretalknum==3)
        { 
          text("Stinky cat!", 1150+scrollx, 550+scrolly);
        }
        if (massacretalknum==4)
        { 
          fill(255, 0, 0);
          text("Fire!", 1200+scrollx, 380+scrolly);
          massacre=true;
        }
        if (massacretalknum==5)
        { 
          if (quest<1)
          {
            fill(255);
            text("Hey kid!", 1100+scrollx, 700+scrolly);
          }
        }
      }
    }
    if (gamemap==lexington)
    {
      if (quest==6)
      {
        if (y+scrolly>=-600&&playery<410)
        {
          if (lexingtontalknum<7)
          {
            if (millis() > time + timeDelay) 
            {
              lexingtontalk=false;
              lexingtontalknum++;
              time=millis();
            }
            else
            {
              lexingtontalk=true;
            }
          }
          if (lexingtontalk)
          {
            talking1();
          }
        }
        if (key ==' ')
        {
          if (gunshot)
          {
          }
        }
      }
    }
  }
}

void talking1()
{
  textFont(font, 30);
  if (lexingtontalknum==1)
  { 
    fill(255, 0, 0);
    text("Lay down your weapons!", 250, 700+scrolly);
  }
  if (lexingtontalknum==2)
  { 
    fill(0, 0, 255);
    text("We do not have any weapons!", 225, 500+scrolly);
  }
  if (lexingtontalknum==3)
  { 
    fill(255, 0, 0);
    text("Stop lying!", 340, 700+scrolly);
  }
  if (lexingtontalknum==4)
  { 
    fill(0, 0, 255);
    text("We have no reason to hide weapons.", 200, 500+scrolly);
  }
  if (lexingtontalknum==5)
  { 
    fill(255, 0, 0);
    text("Who shot that?!", 325, 700+scrolly);
    fill(0, 0, 255);
    text("Who shot that?!", 325, 500+scrolly);
  }
  if (lexingtontalknum==6)
  { 
    fill(255, 0, 0);
    text("Fire!", 370, 700+scrolly);
    fill(0, 0, 255);
    text("Fire!", 370, 500+scrolly);
    lexingtonbattle=true;
    for (int i=0; i<80; i++)
    {
      brit[i].savetime=millis();
      US[i].savetime=millis();
    }
  }
}


