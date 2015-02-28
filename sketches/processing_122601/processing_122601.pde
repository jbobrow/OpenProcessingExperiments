
void setup()
{
  size (500,500);
}

void draw()
{ 
  
  float h = map (hour(), 0, 24, 0, 24);
  float m = map (minute(), 0, 60, 0, 60);
  float s = map (second(), 0, 60, 0, 60);

  if (h >=8 && h < 20)
  {
    background (150, 200, 255);
    noStroke();
    fill (250, 250, 80);
    ellipse (width/2, height/2, s*10, s*10);
  }
  else 
  {
    background (0, 0, 100);
    noStroke();
    fill (240);
    ellipse (width/2, height/2, s*10, s*10);
  }
  
  translate (40, 40);
  //Stunden Kreise
  for (int i=30; i<420; i+=360)
  {
    stroke (0);
    noFill();
    ellipse (55,i,30,30);
  }
  
  for (int i=30; i<420; i+=45)
  {
    stroke (0);
    noFill();
    ellipse (105,i,30,30);
  }
 
 //Stunden leuchten   
  if (h>=10)
  {
    noStroke();
    fill (200, 0, 0);
    ellipse (55, 390, 30, 30);
  }
  
  if (h>=20)
  {
    noStroke();
    fill (200, 0, 0);
    ellipse (55, 30, 30, 30);
  }
  
  if (h==1)
  {
    noStroke ();
    fill (200, 0, 0);
    ellipse (105, 390, 30, 30);
  } 
      if (h==11)
      {
        noStroke ();
        fill (200, 0, 0);
        ellipse (105, 390, 30, 30);
      }
          if (h==21)
          {
            noStroke ();
            fill (200, 0, 0);
            ellipse (105, 390, 30, 30);
          }
  
    if (h==2)
  {
    noStroke ();
    fill (200, 0, 0);
    ellipse (105, 390, 30, 30);
    ellipse (105, 345, 30, 30);
  }
      if (h==12)
      {
        noStroke ();
        fill (200, 0, 0);
        ellipse (105, 390, 30, 30);
        ellipse (105, 345, 30, 30);
      }
          if (h==22)
          {
            noStroke ();
            fill (200, 0, 0);
            ellipse (105, 390, 30, 30);
            ellipse (105, 345, 30, 30);
          }
  
    if (h==3)
    {
      noStroke ();
      fill (200, 0, 0);
      ellipse (105, 390, 30, 30);
      ellipse (105, 345, 30, 30);
      ellipse (105, 300, 30, 30);
    }
        if (h==13)
        {
          noStroke ();
          fill (200, 0, 0);
          ellipse (105, 390, 30, 30);
          ellipse (105, 345, 30, 30);
          ellipse (105, 300, 30, 30);
        }
            if (h==23)
            {
              noStroke ();
              fill (200, 0, 0);
              ellipse (105, 390, 30, 30);
              ellipse (105, 345, 30, 30);
              ellipse (105, 300, 30, 30);
            }
  
    if (h==4)
    {
      noStroke ();
      fill (200, 0, 0);
      ellipse (105, 390, 30, 30);
      ellipse (105, 345, 30, 30);
      ellipse (105, 300, 30, 30);
      ellipse (105, 255, 30, 30);
    }
        if (h==14)
        {
          noStroke ();
          fill (200, 0, 0);
          ellipse (105, 390, 30, 30);
          ellipse (105, 345, 30, 30);
          ellipse (105, 300, 30, 30);
          ellipse (105, 255, 30, 30);
        } 
            if (h==24)
            {
              noStroke ();
              fill (200, 0, 0);
              ellipse (105, 390, 30, 30);
              ellipse (105, 345, 30, 30);
              ellipse (105, 300, 30, 30);
              ellipse (105, 255, 30, 30);
             }

    if (h==5)
    {
      noStroke ();
      fill (200, 0, 0);
      ellipse (105, 390, 30, 30);
      ellipse (105, 345, 30, 30);
      ellipse (105, 300, 30, 30);
      ellipse (105, 255, 30, 30);
      ellipse (105, 210, 30, 30);
    }
        if (h==15)
        {
          noStroke ();
          fill (200, 0, 0);
          ellipse (105, 390, 30, 30);
          ellipse (105, 345, 30, 30);
          ellipse (105, 300, 30, 30);
          ellipse (105, 255, 30, 30);
          ellipse (105, 210, 30, 30);
        }
 
    if (h==6)
    {
      noStroke ();
      fill (200, 0, 0);
      ellipse (105, 390, 30, 30);
      ellipse (105, 345, 30, 30);
      ellipse (105, 300, 30, 30);
      ellipse (105, 255, 30, 30);
      ellipse (105, 210, 30, 30);
      ellipse (105, 165, 30, 30);
    }
        if (h==16)
        {
          noStroke ();
          fill (200, 0, 0);
          ellipse (105, 390, 30, 30);
          ellipse (105, 345, 30, 30);
          ellipse (105, 300, 30, 30);
          ellipse (105, 255, 30, 30);
          ellipse (105, 210, 30, 30);
          ellipse (105, 165, 30, 30);
        }

    if (h==7)
    {
      noStroke ();
      fill (200, 0, 0);
      ellipse (105, 390, 30, 30);
      ellipse (105, 345, 30, 30);
      ellipse (105, 300, 30, 30);
      ellipse (105, 255, 30, 30);
      ellipse (105, 210, 30, 30);
      ellipse (105, 165, 30, 30);
      ellipse (105, 120, 30, 30);
    }
        if (h==17)
        {
          noStroke ();
          fill (200, 0, 0);
          ellipse (105, 390, 30, 30);
          ellipse (105, 345, 30, 30);
          ellipse (105, 300, 30, 30);
          ellipse (105, 255, 30, 30);
          ellipse (105, 210, 30, 30);
          ellipse (105, 165, 30, 30);
          ellipse (105, 120, 30, 30);
         }  
  
    if (h==8)
    {
      noStroke ();
      fill (200, 0, 0);
      ellipse (105, 390, 30, 30);
      ellipse (105, 345, 30, 30);
      ellipse (105, 300, 30, 30);
      ellipse (105, 255, 30, 30);
      ellipse (105, 210, 30, 30);
      ellipse (105, 165, 30, 30);
      ellipse (105, 120, 30, 30);
      ellipse (105, 75, 30, 30);
    }
        if (h==18)
        {
          noStroke ();
          fill (200, 0, 0);
          ellipse (105, 390, 30, 30);
          ellipse (105, 345, 30, 30);
          ellipse (105, 300, 30, 30);
          ellipse (105, 255, 30, 30);
          ellipse (105, 210, 30, 30);
          ellipse (105, 165, 30, 30);
          ellipse (105, 75, 30, 30);
        }

    if (h==9)
    {
      noStroke ();
      fill (200, 0, 0);
      ellipse (105, 390, 30, 30);
      ellipse (105, 345, 30, 30);
      ellipse (105, 300, 30, 30);
      ellipse (105, 255, 30, 30);
      ellipse (105, 210, 30, 30);
      ellipse (105, 165, 30, 30);
      ellipse (105, 120, 30, 30);
      ellipse (105, 75, 30, 30);
      ellipse (105, 30, 30, 30);
    }
         if (h==19)
         {
            noStroke ();
            fill (200, 0, 0);
            ellipse (105, 390, 30, 30);
            ellipse (105, 345, 30, 30);
            ellipse (105, 300, 30, 30);
            ellipse (105, 255, 30, 30);
            ellipse (105, 210, 30, 30);
            ellipse (105, 165, 30, 30);
            ellipse (105, 120, 30, 30);
            ellipse (105, 75, 30, 30);
            ellipse (105, 30, 30, 30);
          }
          
  translate (100, 0); 
 //Minuten Kreise
  for (int i=30; i<420; i+=90)
  {
    stroke (0);
    noFill();
    ellipse (215,i,30,30);
  }
  
  for (int i=30; i<420; i+=45)
  {
    stroke (0);
    noFill();
    ellipse (265,i,30,30);
  }         
   
  //Minuten leuchten
  if (m>=10)
  {
    noStroke();
    fill (200, 0, 0);
    ellipse (215, 390, 30, 30);
  }
  
  if (m>=20)
  {
    noStroke();
    fill (200, 0, 0);
    ellipse (215, 390, 30, 30);
    ellipse (215, 300, 30, 30);
  }
  
  if (m>=30)
  {
    noStroke();
    fill (200, 0, 0);
    ellipse (215, 390, 30, 30);
    ellipse (215, 300, 30, 30);
    ellipse (215, 210, 30, 30);
  }
  
  if (m>=40)
  {
    noStroke();
    fill (200, 0, 0);
    ellipse (215, 390, 30, 30);
    ellipse (215, 300, 30, 30);
    ellipse (215, 210, 30, 30);
    ellipse (215, 120, 30, 30);
  }
  
  if (m>=50)
  {
    noStroke();
    fill (200, 0, 0);
    ellipse (215, 390, 30, 30);
    ellipse (215, 300, 30, 30);
    ellipse (215, 210, 30, 30);
    ellipse (215, 120, 30, 30);
    ellipse (215, 30, 30, 30);
  }
  
  if (m==1)
  {
    noStroke ();
    fill (200, 0, 0);
    ellipse (265, 390, 30, 30);
  }  
      if (m==11)
      {
        noStroke ();
        fill (200, 0, 0);
        ellipse (265, 390, 30, 30);
      }
          if (m==21)
          {
            noStroke ();
            fill (200, 0, 0);
            ellipse (265, 390, 30, 30);
          }
              if (m==31)
              {
                noStroke ();
                fill (200, 0, 0);
                ellipse (265, 390, 30, 30);
              }
                  if (m==41)
                  {  
                    noStroke ();
                    fill (200, 0, 0);
                    ellipse (265, 390, 30, 30);
                  }
                      if (m==51)
                      {
                        noStroke ();
                        fill (200, 0, 0);
                        ellipse (265, 390, 30, 30);
                      }

  if (m==2)
  {
    noStroke ();
    fill (200, 0, 0);
    ellipse (265, 390, 30, 30);
    ellipse (265, 345, 30, 30);
  }
      if (m==12)
      {
        noStroke ();
        fill (200, 0, 0);
        ellipse (265, 390, 30, 30);
        ellipse (265, 345, 30, 30);
      }
          if (m==22)
          {
            noStroke ();
            fill (200, 0, 0);
            ellipse (265, 390, 30, 30);
            ellipse (265, 345, 30, 30);
          }          
               if (m==32)
               {
                 noStroke ();
                 fill (200, 0, 0);
                 ellipse (265, 390, 30, 30);
                 ellipse (265, 345, 30, 30);
               }
                    if (m==42)
                    {  
                      noStroke ();
                      fill (200, 0, 0);
                      ellipse (265, 390, 30, 30);
                      ellipse (265, 345, 30, 30);
                    }
                        if (m==52)
                        {
                          noStroke ();
                          fill (200, 0, 0);
                          ellipse (265, 390, 30, 30);
                          ellipse (265, 345, 30, 30);
                        }

    if (m==3)
    {
      noStroke ();
      fill (200, 0, 0);
      ellipse (265, 390, 30, 30);
      ellipse (265, 345, 30, 30);
      ellipse (265, 300, 30, 30);
    }
        if (m==13)
        {
          noStroke ();
          fill (200, 0, 0);
          ellipse (265, 390, 30, 30);
          ellipse (265, 345, 30, 30);
          ellipse (265, 300, 30, 30);
        }
            if (m==23)
            {
              noStroke ();
              fill (200, 0, 0);
              ellipse (265, 390, 30, 30);
              ellipse (265, 345, 30, 30);
              ellipse (265, 300, 30, 30);
            }
                if (m==33)
                {
                  noStroke ();
                  fill (200, 0, 0);
                  ellipse (265, 390, 30, 30);
                  ellipse (265, 345, 30, 30);
                  ellipse (265, 300, 30, 30);
                }
                    if (m==43)
                    {  
                      noStroke ();
                      fill (200, 0, 0);
                      ellipse (265, 390, 30, 30);
                      ellipse (265, 345, 30, 30);
                      ellipse (265, 300, 30, 30);
                    }
                        if (m==53)
                        {
                          noStroke ();
                          fill (200, 0, 0);
                          ellipse (265, 390, 30, 30);
                          ellipse (265, 345, 30, 30);
                          ellipse (265, 300, 30, 30);
                        }

    if (m==4)
    {
      noStroke ();
      fill (200, 0, 0);
      ellipse (265, 390, 30, 30);
      ellipse (265, 345, 30, 30);
      ellipse (265, 300, 30, 30);
      ellipse (265, 255, 30, 30);
    }
        if (m==14)
        {
          noStroke ();
          fill (200, 0, 0);
          ellipse (265, 390, 30, 30);
          ellipse (265, 345, 30, 30);
          ellipse (265, 300, 30, 30);
          ellipse (265, 255, 30, 30);
        }
            if (m==24)
            {
              noStroke ();
              fill (200, 0, 0);
              ellipse (265, 390, 30, 30);
              ellipse (265, 345, 30, 30);
              ellipse (265, 300, 30, 30);
              ellipse (265, 255, 30, 30);
             }
                if (m==34)
                {
                  noStroke ();
                  fill (200, 0, 0);
                  ellipse (265, 390, 30, 30);
                  ellipse (265, 345, 30, 30);
                  ellipse (265, 300, 30, 30);
                  ellipse (265, 255, 30, 30);
                }
                    if (m==44)
                    {  
                      noStroke ();
                      fill (200, 0, 0);
                      ellipse (265, 390, 30, 30);
                      ellipse (265, 345, 30, 30);
                      ellipse (265, 300, 30, 30);
                      ellipse (265, 255, 30, 30);
                    }
                        if (m==54)
                        {
                          noStroke ();
                          fill (200, 0, 0);
                          ellipse (265, 390, 30, 30);
                          ellipse (265, 345, 30, 30);
                          ellipse (265, 300, 30, 30);
                          ellipse (265, 255, 30, 30);
                        }

    if (m==5)
    {
      noStroke ();
      fill (200, 0, 0);
      ellipse (265, 390, 30, 30);
      ellipse (265, 345, 30, 30);
      ellipse (265, 300, 30, 30);
      ellipse (265, 255, 30, 30);
      ellipse (265, 210, 30, 30);
    }
        if (m==15)
        {
          noStroke ();
          fill (200, 0, 0);
          ellipse (265, 390, 30, 30);
          ellipse (265, 345, 30, 30);
          ellipse (265, 300, 30, 30);
          ellipse (265, 255, 30, 30);
          ellipse (265, 210, 30, 30);
        }
            if (m==25)
            {
              noStroke ();
              fill (200, 0, 0);
              ellipse (265, 390, 30, 30);
              ellipse (265, 345, 30, 30);
              ellipse (265, 300, 30, 30);
              ellipse (265, 255, 30, 30);
              ellipse (265, 210, 30, 30);
             }
                if (m==35)
                {
                  noStroke ();
                  fill (200, 0, 0);
                  ellipse (265, 390, 30, 30);
                  ellipse (265, 345, 30, 30);
                  ellipse (265, 300, 30, 30);
                  ellipse (265, 255, 30, 30);
                  ellipse (265, 210, 30, 30);
                }
                    if (m==45)
                    {  
                      noStroke ();
                      fill (200, 0, 0);
                      ellipse (265, 390, 30, 30);
                      ellipse (265, 345, 30, 30);
                      ellipse (265, 300, 30, 30);
                      ellipse (265, 255, 30, 30);
                      ellipse (265, 210, 30, 30);
                    }
                        if (m==55)
                        {
                          noStroke ();
                          fill (200, 0, 0);
                          ellipse (265, 390, 30, 30);
                          ellipse (265, 345, 30, 30);
                          ellipse (265, 300, 30, 30);
                          ellipse (265, 255, 30, 30);
                          ellipse (265, 210, 30, 30);
                        }

    if (m==6)
    {
      noStroke ();
      fill (200, 0, 0);
      ellipse (265, 390, 30, 30);
      ellipse (265, 345, 30, 30);
      ellipse (265, 300, 30, 30);
      ellipse (265, 255, 30, 30);
      ellipse (265, 210, 30, 30);
      ellipse (265, 165, 30, 30);
    }
        if (m==16)
        {
          noStroke ();
          fill (200, 0, 0);
          ellipse (265, 390, 30, 30);
          ellipse (265, 345, 30, 30);
          ellipse (265, 300, 30, 30);
          ellipse (265, 255, 30, 30);
          ellipse (265, 210, 30, 30);
          ellipse (265, 165, 30, 30);
        }
            if (m==26)
            {
              noStroke ();
              fill (200, 0, 0);
              ellipse (265, 390, 30, 30);
              ellipse (265, 345, 30, 30);
              ellipse (265, 300, 30, 30);
              ellipse (265, 255, 30, 30);
              ellipse (265, 210, 30, 30);
              ellipse (265, 165, 30, 30);
             }
                if (m==36)
                {
                  noStroke ();
                  fill (200, 0, 0);
                  ellipse (265, 390, 30, 30);
                  ellipse (265, 345, 30, 30);
                  ellipse (265, 300, 30, 30);
                  ellipse (265, 255, 30, 30);
                  ellipse (265, 210, 30, 30);
                  ellipse (265, 165, 30, 30);
                }
                    if (m==46)
                    {  
                      noStroke ();
                      fill (200, 0, 0);
                      ellipse (265, 390, 30, 30);
                      ellipse (265, 345, 30, 30);
                      ellipse (265, 300, 30, 30);
                      ellipse (265, 255, 30, 30);
                      ellipse (265, 210, 30, 30);
                      ellipse (265, 165, 30, 30);
                    }
                        if (m==56)
                        {
                          noStroke ();
                          fill (200, 0, 0);
                          ellipse (265, 390, 30, 30);
                          ellipse (265, 345, 30, 30);
                          ellipse (265, 300, 30, 30);
                          ellipse (265, 255, 30, 30);
                          ellipse (265, 210, 30, 30);
                          ellipse (265, 165, 30, 30);
                        }

    if (m==7)
    {
      noStroke ();
      fill (200, 0, 0);
      ellipse (265, 390, 30, 30);
      ellipse (265, 345, 30, 30);
      ellipse (265, 300, 30, 30);
      ellipse (265, 255, 30, 30);
      ellipse (265, 210, 30, 30);
      ellipse (265, 165, 30, 30);
      ellipse (265, 120, 30, 30);
    }
        if (m==17)
        {
          noStroke ();
          fill (200, 0, 0);
          ellipse (265, 390, 30, 30);
          ellipse (265, 345, 30, 30);
          ellipse (265, 300, 30, 30);
          ellipse (265, 255, 30, 30);
          ellipse (265, 210, 30, 30);
          ellipse (265, 165, 30, 30);
          ellipse (265, 120, 30, 30);
         } 
            if (m==27)
            {
              noStroke ();
              fill (200, 0, 0);
              ellipse (265, 390, 30, 30);
              ellipse (265, 345, 30, 30);
              ellipse (265, 300, 30, 30);
              ellipse (265, 255, 30, 30);
              ellipse (265, 210, 30, 30);
              ellipse (265, 165, 30, 30);
              ellipse (265, 120, 30, 30);
             }
                if (m==37)
                {
                  noStroke ();
                  fill (200, 0, 0);
                  ellipse (265, 390, 30, 30);
                  ellipse (265, 345, 30, 30);
                  ellipse (265, 300, 30, 30);
                  ellipse (265, 255, 30, 30);
                  ellipse (265, 210, 30, 30);
                  ellipse (265, 165, 30, 30);
                  ellipse (265, 120, 30, 30);
                }
                    if (m==47)
                    {  
                      noStroke ();
                      fill (200, 0, 0);
                      ellipse (265, 390, 30, 30);
                      ellipse (265, 345, 30, 30);
                      ellipse (265, 300, 30, 30);
                      ellipse (265, 255, 30, 30);
                      ellipse (265, 210, 30, 30);
                      ellipse (265, 165, 30, 30);
                      ellipse (265, 120, 30, 30);
                    }
                        if (m==57)
                        {
                          noStroke ();
                          fill (200, 0, 0);
                          ellipse (265, 390, 30, 30);
                          ellipse (265, 345, 30, 30);
                          ellipse (265, 300, 30, 30);
                          ellipse (265, 255, 30, 30);
                          ellipse (265, 210, 30, 30);
                          ellipse (265, 165, 30, 30);
                          ellipse (265, 120, 30, 30);
                        } 

    if (m==8)
    {
      noStroke ();
      fill (200, 0, 0);
      ellipse (265, 390, 30, 30);
      ellipse (265, 345, 30, 30);
      ellipse (265, 300, 30, 30);
      ellipse (265, 255, 30, 30);
      ellipse (265, 210, 30, 30);
      ellipse (265, 165, 30, 30);
      ellipse (265, 120, 30, 30);
      ellipse (265, 75, 30, 30);
    }
        if (m==18)
        {
          noStroke ();
          fill (200, 0, 0);
          ellipse (265, 390, 30, 30);
          ellipse (265, 345, 30, 30);
          ellipse (265, 300, 30, 30);
          ellipse (265, 255, 30, 30);
          ellipse (265, 210, 30, 30);
          ellipse (265, 165, 30, 30);
          ellipse (265, 75, 30, 30);
        }
            if (m==28)
            {
              noStroke ();
              fill (200, 0, 0);
              ellipse (265, 390, 30, 30);
              ellipse (265, 345, 30, 30);
              ellipse (265, 300, 30, 30);
              ellipse (265, 255, 30, 30);
              ellipse (265, 210, 30, 30);
              ellipse (265, 165, 30, 30);
              ellipse (265, 120, 30, 30);
              ellipse (265, 75, 30, 30);
             }
                if (m==38)
                {
                  noStroke ();
                  fill (200, 0, 0);
                  ellipse (265, 390, 30, 30);
                  ellipse (265, 345, 30, 30);
                  ellipse (265, 300, 30, 30);
                  ellipse (265, 255, 30, 30);
                  ellipse (265, 210, 30, 30);
                  ellipse (265, 165, 30, 30);
                  ellipse (265, 120, 30, 30);
                  ellipse (265, 75, 30, 30);
                }
                    if (m==48)
                    {  
                      noStroke ();
                      fill (200, 0, 0);
                      ellipse (265, 390, 30, 30);
                      ellipse (265, 345, 30, 30);
                      ellipse (265, 300, 30, 30);
                      ellipse (265, 255, 30, 30);
                      ellipse (265, 210, 30, 30);
                      ellipse (265, 165, 30, 30);
                      ellipse (265, 120, 30, 30);
                      ellipse (265, 75, 30, 30);
                    }
                        if (m==58)
                        {
                          noStroke ();
                          fill (200, 0, 0);
                          ellipse (265, 390, 30, 30);
                          ellipse (265, 345, 30, 30);
                          ellipse (265, 300, 30, 30);
                          ellipse (265, 255, 30, 30);
                          ellipse (265, 210, 30, 30);
                          ellipse (265, 165, 30, 30);
                          ellipse (265, 120, 30, 30);
                          ellipse (265, 75, 30, 30);
                        }

    if (m==9)
    {
      noStroke ();
      fill (200, 0, 0);
      ellipse (265, 390, 30, 30);
      ellipse (265, 345, 30, 30);
      ellipse (265, 300, 30, 30);
      ellipse (265, 255, 30, 30);
      ellipse (265, 210, 30, 30);
      ellipse (265, 165, 30, 30);
      ellipse (265, 120, 30, 30);
      ellipse (265, 75, 30, 30);
      ellipse (265, 30, 30, 30);
    }
         if (m==19)
         {
            noStroke ();
            fill (200, 0, 0);
            ellipse (265, 390, 30, 30);
            ellipse (265, 345, 30, 30);
            ellipse (265, 300, 30, 30);
            ellipse (265, 255, 30, 30);
            ellipse (265, 210, 30, 30);
            ellipse (265, 165, 30, 30);
            ellipse (265, 75, 30, 30);
            ellipse (265, 30, 30, 30);
          }
            if (m==29)
            {
              noStroke ();
              fill (200, 0, 0);
              ellipse (265, 390, 30, 30);
              ellipse (265, 345, 30, 30);
              ellipse (265, 300, 30, 30);
              ellipse (265, 255, 30, 30);
              ellipse (265, 210, 30, 30);
              ellipse (265, 165, 30, 30);
              ellipse (265, 120, 30, 30);
              ellipse (265, 75, 30, 30);
              ellipse (265, 30, 30, 30);
             }
                if (m==39)
                {
                  noStroke ();
                  fill (200, 0, 0);
                  ellipse (265, 390, 30, 30);
                  ellipse (265, 345, 30, 30);
                  ellipse (265, 300, 30, 30);
                  ellipse (265, 255, 30, 30);
                  ellipse (265, 210, 30, 30);
                  ellipse (265, 165, 30, 30);
                  ellipse (265, 120, 30, 30);
                  ellipse (265, 75, 30, 30);
                  ellipse (265, 30, 30, 30);
                }
                    if (m==49)
                    {  
                      noStroke ();
                      fill (200, 0, 0);
                      ellipse (265, 390, 30, 30);
                      ellipse (265, 345, 30, 30);
                      ellipse (265, 300, 30, 30);
                      ellipse (265, 255, 30, 30);
                      ellipse (265, 210, 30, 30);
                      ellipse (265, 165, 30, 30);
                      ellipse (265, 120, 30, 30);
                      ellipse (265, 75, 30, 30);
                      ellipse (265, 30, 30, 30);
                    }
                        if (m==59)
                        {
                          noStroke ();
                          fill (200, 0, 0);
                          ellipse (265, 390, 30, 30);
                          ellipse (265, 345, 30, 30);
                          ellipse (265, 300, 30, 30);
                          ellipse (265, 255, 30, 30);
                          ellipse (265, 210, 30, 30);
                          ellipse (265, 165, 30, 30);
                          ellipse (265, 120, 30, 30);
                          ellipse (265, 75, 30, 30);
                          ellipse (265, 30, 30, 30);
                        }
                        
}
