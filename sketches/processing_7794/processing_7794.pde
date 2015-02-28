
/*
Kye Ehrlich
CMSC 117
Dot Clock
*/
void setup()
{
  size(360,360);
  smooth();
  PFont font;
  font= loadFont("Serif-48.vlw");
  textFont(font);
  
}

void draw()
{
  if(mousePressed==true)
  {
    fill(255,255,0);
    background(0);
    textAlign(CENTER,CENTER);
    text(nf((hour()%12),2)+":"+nf(minute(),2)+":"+nf(second(),2),width/2,height/2);

  }

  if(mousePressed==false)
  {
    background(0);
    stroke(0);
    strokeWeight(0);
    fill(255);

    for(int x=15;x<359;x=x+30)
    {
      for(int y=20;y<359;y=y+64)
      {
        ellipse(x,y,10,10);
      }
    }

    strokeWeight(4);
    stroke(255);
    line(0,52,width,52);
    stroke(0);
    strokeWeight(0);



    int h=hour();
    if(h>12)
    {
      h=h-11;
    }
    if(h<0)
    {
      h=h+12;
    }

    fill(255,0,0);
    ellipse(15+((h-2)*30),20,20,20);



    fill(0,255,0);
    int m=minute();

    if (m<13)
    {
      ellipse(15+((m*30)),84,20,20);//R1
    }

    if (m>12 && m<25)
    {
      m=m-13;
      ellipse(15+((m*30)),148,20,20);//R2
    }

    if (m>24 && m<37)
    {
      m=m-25;
      ellipse(15+((m*30)),212,20,20);//R3
    }

    if (m>36 && m<49)
    {
      m=m-36;
      ellipse(15+((m*30)),278,20,20);//R4
    }

    if (m>48 && m<61)
    {
      m=m-49;
      ellipse(15+((m*30)),342,20,20);//R5
    }



    fill(0,0,255);
    int s=second();


    if (s<13)
    {
      ellipse(15+((s*30)),84,20,20);//R1
    }

    if (s>12 && s<25)
    {
      s=s-13;
      ellipse(15+((s*30)),148,20,20);//R2
    }

    if (s>24 && s<37)
    {
      s=s-25;
      ellipse(15+((s*30)),212,20,20);//R3
    }

    if (s>36 && s<49)
    {
      s=s-37;
      ellipse(15+((s*30)),278,20,20);//R4
    }

    if (s>48 && s<61)
    {
      s=s-49;
      ellipse(15+((s*30)),342,20,20);//R5
    }
  }
}




