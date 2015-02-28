
//Made By Andrew Wong 3rd Period

Kirby[] a;
Deathball[] b;

PFont font;
float kirbyx=400;
float kirbyy=400;
float v = 10;
float rgbred = (int)random(0,255);
float rgbgreen = (int)random(0,255);
float rgbblue = (int)random(0,255);

float startTime;
boolean counting = false;
boolean wPressed, aPressed, sPressed, dPressed;

int gamescreen = 1;



void setup()
{
  size(800,800);
  font = loadFont("AmericanTypewriter-24.vlw");
  textFont(font);
  smooth();


  a = new Kirby[1];
  for(int i=0; i<a.length; i++)
  {
    a[i] = new Kirby();
    a[i].r = 30;
    a[i].v = 10;
    a[i].rgbred = (int)random(0,255);
    a[i].rgbgreen = (int)random(0,255);
    a[i].rgbblue = (int)random(0,255);
  }


  b = new Deathball[64];

  for(int i=0; i<16; i++)
  {
    b[i] = new Deathball();
    b[i].rb = 25;
    b[i].vb = 0;
    b[i].rgbred = (int)random(0,255);
    b[i].rgbgreen = (int)random(0,255);
    b[i].rgbblue = (int)random(0,255);
    b[i].greyscale = (int)random(0,200);
    b[i].dballx = width/2;
    b[i].dbally = height/25;
  }

  for(int i=16; i<32; i++)
  {
    b[i] = new Deathball();
    b[i].rb = 25;
    b[i].vb = 0;
    b[i].rgbred = (int)random(0,255);
    b[i].rgbgreen = (int)random(0,255);
    b[i].rgbblue = (int)random(0,255);
    b[i].greyscale = (int)random(0,200);
    b[i].dballx = width-width/25;
    b[i].dbally = height/2;
  }

  for(int i=32; i<48; i++)
  {
    b[i] = new Deathball();
    b[i].rb = 25;
    b[i].vb = 0;
    b[i].rgbred = (int)random(0,255);
    b[i].rgbgreen = (int)random(0,255);
    b[i].rgbblue = (int)random(0,255);
    b[i].greyscale = (int)random(0,200);
    b[i].dballx = width/2;
    b[i].dbally = height-height/25;
  }

  for(int i=48; i<64; i++)
  {
    b[i] = new Deathball();
    b[i].rb = 25;
    b[i].vb = 0;
    b[i].rgbred = (int)random(0,255);
    b[i].rgbgreen = (int)random(0,255);
    b[i].rgbblue = (int)random(0,255);
    b[i].greyscale = (int)random(0,200);
    b[i].dballx = width/25;
    b[i].dbally = height/2;
  }


}





void draw()
{
  background(155);

  for(int i=0; i<64; i++)
  {
    checkCollision(b[i]);
  }


  if (gamescreen == 1)
  {
    
    background(155);
    fill(220,30,40);
    textSize(35);
    text("Kirby Morira",width/2.8,height/3);
    textSize(24);
    //text("Start Game",width/2.43,height/2.3);
    //text("High Scores",width/2.44,height/2.6);
    fill(20,235,30);
    text("Dodge la Deathballs",width/1.5,height/3);
    text("y seras un",width/1.5,height/2.7);
    text("buen bono!",width/1.5,height/2.4); 

    fill(255,192,203);
    ellipse(width/1.15, height/2.6, 30, 30);
    fill(250,128,114);
    ellipse(width/1.15+10, height/2.6 + 17, 15, 13);
    ellipse(width/1.15-9, height/2.6 + 17, 15, 13);
    fill(0);
    ellipse(width/1.15-6, height/2.6-3, 6, 10);
    ellipse(width/1.15+6, height/2.6-3, 6, 10);
    fill(255);
    ellipse(width/1.15-7, height/2.6-5, 2, 4);
    ellipse(width/1.15+5, height/2.6-5, 2, 4);
    fill(250,128,114);
    ellipse(width/1.15, height/2.6+6, 6, 3);
    fill(205,92,92);
    ellipse(width/1.15+9, height/2.6+4, 5, 3);
    ellipse(width/1.15-8, height/2.6+4, 5, 3); 

    if (mousePressed)
    {    
      gamescreen = 2;
      counting = true;
      startTime = millis();
    }
    fill(220,30,40);
    text("Click Anywhere To Start!", width/3.1,height/2);


  }
  else

      if (gamescreen ==2)
    {

      for(int i=0; i<a.length; i++)
      {
        a[i].move();
        a[i].show();
        b[i].move();
        b[i].show();
      }

      for(int i=0; i<b.length; i++)
      {
        b[i].move();
        b[i].show();
      }


      //Borders
      fill(160,82,45);
      noStroke();
      rect(0,0,width/25,height);
      rect(width-width/25,0,width/25,height);  
      rect(0,0,width,height/25);
      rect(0,height-height/25,width,height/25);
      stroke(0);


      //Cannons Horizontal
      fill(50);
      ellipse(width/30,height/2,50,30);
      ellipse(width/37,height/2.09,20,8);
      ellipse(width/37,height/1.91,20,8);
      ellipse(width/15,height/2,8,20);
      fill(0);
      ellipse(width/14.55,height/2,4,10);

      fill(50);
      ellipse(width-width/30,height/2,50,30);
      ellipse(width-width/37,height/2.09,20,8);
      ellipse(width-width/37,height/1.91,20,8);
      ellipse(width-width/15,height/2,8,20);
      fill(0);
      ellipse(width-width/14.55,height/2,4,10);

      //Cannons Verticle
      fill(50);
      ellipse(width/2,height/30,30,50);
      ellipse(width/2.09,height/37,8,20);
      ellipse(width/1.91,height/37,8,20);
      ellipse(width/2,height/15,20,8);
      fill(0);
      ellipse(width/2,height/14.55,10,4);

      fill(50);
      ellipse(width/2,height-height/30,30,50);
      ellipse(width/2.09,height-height/37,8,20);
      ellipse(width/1.91,height-height/37,8,20);
      ellipse(width/2,height-height/15,20,8);
      fill(0);
      ellipse(width/2,height-height/14.55,10,4);





      float m = millis();
      int sec = (int)((m-startTime)/1000);
      text(sec, width/25,height/26);


      if (sec >= 5)
      {
        b[1].vb = 4;
      }
      if (sec >= 6)
      {
        b[16].vb = 4;
      }
      if (sec >= 7)
      {
        b[32].vb = 4;
      }      
      if (sec >= 8)
      {
        b[48].vb = 4;
      }

      if (sec >= 15)
      {
        b[2].vb = 4;
      }
      if (sec >= 16)
      {
        b[17].vb = 4;
      }
      if (sec >= 17)
      {
        b[33].vb = 4;
      }      
      if (sec >= 18)
      {
        b[49].vb = 4;
      }

      if (sec >= 25)
      {
        b[3].vb = 4;
      }
      if (sec >= 26)
      {
        b[18].vb = 4;
      }
      if (sec >= 27)
      {
        b[34].vb = 4;
      }      
      if (sec >= 28)
      {
        b[50].vb = 4;
      }

      if (sec >= 35)
      {
        b[4].vb = 5;
      }
      if (sec >= 36)
      {
        b[19].vb = 5;
      }
      if (sec >= 37)
      {
        b[35].vb = 5;
      }      
      if (sec >= 38)
      {
        b[51].vb = 5;
      }

      if (sec >= 45)
      {
        b[5].vb = 4;
      }
      if (sec >= 46)
      {
        b[20].vb = 4;
      }
      if (sec >= 47)
      {
        b[36].vb = 4;
      }      
      if (sec >= 48)
      {
        b[52].vb = 4;
      }



      //FASTER CODE
      if (sec >= 55)
      {
        a[0].v = 15; 
      }

      if (sec >= 55)
      {
        b[6].vb = 5;
      }
      if (sec >= 56)
      {
        b[21].vb = 5;
      }
      if (sec >= 57)
      {
        b[37].vb = 5;
      }      
      if (sec >= 58)
      {
        b[53].vb = 5;
      }

      if (sec >= 59)
      {
        b[7].vb = 6;
      }
      if (sec >= 60)
      {
        b[22].vb = 6;
      }
      if (sec >= 61)
      {
        b[38].vb = 6;
      }      
      if (sec >= 62)
      {
        b[54].vb = 6;
      }

      if (sec >= 63)
      {
        b[8].vb = 5;
      }
      if (sec >= 64)
      {
        b[23].vb = 5;
      }
      if (sec >= 65)
      {
        b[39].vb = 5;
      }      
      if (sec >= 66)
      {
        b[55].vb = 5;
      }

      if (sec >= 67)
      {
        b[9].vb = 5;
      }
      if (sec >= 68)
      {
        b[24].vb = 5;
      }
      if (sec >= 69)
      {
        b[40].vb = 5;
      }      
      if (sec >= 70)
      {
        b[56].vb = 5;
      }
      if (sec >= 71)
      {
        b[10].vb = 4;
      }
      if (sec >= 74)
      {
        b[25].vb = 4;
      }
      if (sec >= 73)
      {
        b[41].vb = 4;
      }      
      if (sec >= 72)
      {
        b[57].vb = 4;
      }

      if (sec >= 75)
      {
        b[11].vb = 4;
      }
      if (sec >= 78)
      {
        b[26].vb = 4;
      }
      if (sec >= 77)
      {
        b[42].vb = 4;
      }      
      if (sec >= 76)
      {
        b[58].vb = 4;
      }

      if (sec >= 79)
      {
        b[12].vb = 4;
      }
      if (sec >= 80)
      {
        b[27].vb = 4;
      }
      if (sec >= 79)
      {
        b[43].vb = 4;
      }      
      if (sec >= 80)
      {
        b[59].vb = 4;
      }

      if (sec >= 82)
      {
        b[13].vb = 4;
      }
      if (sec >= 81)
      {
        b[28].vb = 4;
      }
      if (sec > 82)
      {
        b[44].vb = 4;
      }      
      if (sec >= 81)
      {
        b[60].vb = 4;
      }

      if (sec >= 83)
      {
        b[14].vb = 5;
      }
      if (sec >= 83)
      {
        b[29].vb = 5;
      }
      if (sec >= 83)
      {
        b[45].vb = 5;
      }      
      if (sec >= 83)
      {
        b[61].vb = 5;
      }

      if (sec >= 87)
      {
        b[15].vb = 7;
      }
      if (sec >= 87)
      {
        b[30].vb = 7;
      }
      if (sec >= 87)
      {
        b[46].vb = 7;
      }      
      if (sec >= 87)
      {
        b[62].vb = 7;
      }


    }
    else

        if (gamescreen == 3)
      {
        background(155);
        fill(220,30,40);
        textSize(35);
        text("YOU LOSE",width/2.43,height/3);
        textSize(24);
        text("Click To Start Over",width/2.6,height/2.5);
        
        
      }




  //END DRAW   
}

void mouseReleased()
{
  if (gamescreen == 3)
  {
    gamescreen = 1;


kirbyx=width/2;
kirbyy=height/2;
a[0].v = 10;
a[0].rgbred = (int)random(0,255);
a[0].rgbgreen = (int)random(0,255);
a[0].rgbblue = (int)random(0,255);

    b = new Deathball[64];

    for(int i=0; i<16; i++)
    {
      b[i] = new Deathball();
      b[i].rb = 25;
      b[i].vb = 0;
      b[i].rgbred = (int)random(0,255);
      b[i].rgbgreen = (int)random(0,255);
      b[i].rgbblue = (int)random(0,255);
      b[i].greyscale = (int)random(0,200);
      b[i].dballx = width/2;
      b[i].dbally = height/25;
    }

    for(int i=16; i<32; i++)
    {
      b[i] = new Deathball();
      b[i].rb = 25;
      b[i].vb = 0;
      b[i].rgbred = (int)random(0,255);
      b[i].rgbgreen = (int)random(0,255);
      b[i].rgbblue = (int)random(0,255);
      b[i].greyscale = (int)random(0,200);
      b[i].dballx = width-width/25;
      b[i].dbally = height/2;
    }

    for(int i=32; i<48; i++)
    {
      b[i] = new Deathball();
      b[i].rb = 25;
      b[i].vb = 0;
      b[i].rgbred = (int)random(0,255);
      b[i].rgbgreen = (int)random(0,255);
      b[i].rgbblue = (int)random(0,255);
      b[i].greyscale = (int)random(0,200);
      b[i].dballx = width/2;
      b[i].dbally = height-height/25;
    }

    for(int i=48; i<64; i++)
    {
      b[i] = new Deathball();
      b[i].rb = 25;
      b[i].vb = 0;
      b[i].rgbred = (int)random(0,255);
      b[i].rgbgreen = (int)random(0,255);
      b[i].rgbblue = (int)random(0,255);
      b[i].greyscale = (int)random(0,200);
      b[i].dballx = width/25;
      b[i].dbally = height/2;
    }

  }

}







void checkCollision(Deathball b)
{

  float distance = dist(kirbyx, kirbyy, b.dballx, b.dbally);
  float radiiSum = a[0].r/2 + b.rb/2;
  if (distance <= radiiSum)
  {

    gamescreen = 3;
  }

}


class Kirby
{

  int r; // size (r for radius)
  int v; // velocity
  int rgbred; // color 1
  int rgbgreen; // color 2
  int rgbblue; // color 3
  int opacity; //opacity, duh

  void show()
  {
    fill(rgbred,rgbgreen,rgbblue);
    ellipse(kirbyx, kirbyy, r, r);
    fill(250,128,114);
    ellipse(kirbyx+10, kirbyy + 17, r/2, r/2.31);
    ellipse(kirbyx-9, kirbyy + 17, r/2, r/2.31);
    fill(0);
    ellipse(kirbyx-6, kirbyy-3, r/5, r/3);
    ellipse(kirbyx+6, kirbyy-3, r/5, r/3);
    fill(255);
    ellipse(kirbyx-7, kirbyy-5, r/15, r/7.5);
    ellipse(kirbyx+5, kirbyy-5, r/15, r/7.5);
    fill(250,128,114);
    ellipse(kirbyx, kirbyy+6, r/5, r/10);
    fill(205,92,92);
    ellipse(kirbyx+9, kirbyy+4, r/6, r/10);
    ellipse(kirbyx-8, kirbyy+4, r/6, r/10);
  }

  void move()
  {
    //Kirby

    if (wPressed) 
    {
      kirbyy = kirbyy - random(v,v*2);
      kirbyx = kirbyx - random(-8,8);
    }
    if (sPressed) 
    {
      kirbyy = kirbyy + random(v,v*2);
      kirbyx = kirbyx + random(-8,8);
    }
    if (dPressed) 
    {
      kirbyx = kirbyx + random(v,v*2);
      kirbyy = kirbyy + random(-8,8);
    }
    if (aPressed) 
    {
      kirbyx = kirbyx - random(v,v*2);
      kirbyy = kirbyy - random(-8,8);
    }

    if(kirbyx<=((width/25)+r/2))
    {
      kirbyx = (width/25)+r/2; 
    }  


    if(kirbyx>=(width-width/25)-r/2)
    { 
      kirbyx = (width-width/25)-r/2;
    }


    if(kirbyy<=((height/25)+r/2))
    {
      kirbyy = (height/25)+r/2;
    }


    if(kirbyy>=(height-height/25)-(r/2)-9)
    {
      kirbyy = (height-height/25)-(r/2)-9;
    }

  }
  //End Kirby
}

void keyPressed()
{
  if (key == 'w') wPressed = true;
  if (key == 'a') aPressed = true;
  if (key == 's') sPressed = true;
  if (key == 'd') dPressed = true;
}

void keyReleased()
{
  if (key == 'w') wPressed = false;
  if (key == 'a') aPressed = false;
  if (key == 's') sPressed = false;
  if (key == 'd') dPressed = false;
}






class Deathball
{


  float dballx;
  float dbally;
  int rb; // size (r for radius)
  int vb; // velocity
  int rgbred; // color 1
  int rgbgreen; // color 2
  int rgbblue; // color 3
  int greyscale;
  int opacity; //opacity, duh

  void show()
  {
    fill(random(0,100),100);
    ellipse(dballx, dbally, rb, rb);
    fill(0, random(141,241),255,random(200,250));
    ellipse(dballx, dbally, rb/3, rb+rb/2);
    ellipse(dballx, dbally, rb+rb/2, rb/3);
  }

  void move()
  {

    if (kirbyx >= dballx)
    {
      dballx = dballx + vb;
    }
    if (kirbyx <= dballx)
    {
      dballx = dballx - vb;
    }
    if (kirbyy >= dbally)
    {
      dbally = dbally + vb;
    }
    if (kirbyy <= dbally)
    {
      dbally = dbally - vb;
    }

  }














  //END  
}












