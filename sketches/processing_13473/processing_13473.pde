
//Elliot Kaufman


import processing.video.*;
import ddf.minim.*;

AudioInput song;
Minim minim;

Capture video;

void setup()
{
  size(640, 480);
  video = new Capture(this, width, height);
  minim = new Minim(this);
  song = minim.getLineIn(Minim.STEREO, 1024);
  

}

void draw()
{
  if (video.available())
  {
    video.read();

    float averageamp = 0;
    for (int a = 0; a < song.bufferSize(); a++)
    {
      averageamp = averageamp + abs (song.left.get(a));
    }
    averageamp = averageamp / song.bufferSize();

    for (int i = 0; i < width; i = i + 1)
    {
      for (int j = 0; j < height; j = j + 1)
      {
        color px = video.get(i,j);
        float r = red(px);
        float g = green(px);
        float b = blue(px);
        float m = millis();
        color c = color(r, g, b);


        //User can interact with keyboard to control effects

        if (key == '1')
        {
          float gt = color(RGB);
          if(gt < averageamp)
          {
            gt=9;
          }
          if (gt > averageamp)
          {
            gt= 30;
          }
          colorMode(HSB); 
          color gq = color((r +10) * (averageamp*4), (g + 50) * (averageamp*6), (b +100) * (averageamp * 20));
          set(i, j, gq);
          colorMode(RGB);        
        }

        else if (key == '2')
        {
          float ef = color(R%G%B);
          if(ef < averageamp)
          {
            ef=9;
          }
          if (ef > averageamp)
          {
            ef= 30;
          }
          colorMode(HSB); 
          color wf = color((r +10) * (averageamp*20), (g + 40) * (averageamp*45), (b +20) * (averageamp * 17));
          set(i, j, wf);
          colorMode(RGB);
        }

        else if (key == '3')
        {
          float v3 = color(R%G%B);
          if(v3 < averageamp)
          {
            v3=12;
          }
          if (v3 > averageamp)
          {
            v3= 30;
          }
          colorMode(HSB); 
          color rc3 = color((g-15) * (averageamp*5000), (b) * (averageamp * 1000));
          set(i, j, rc3);
          colorMode(RGB);
        }

        else if (key == '4')
        {
          float as4 = color(R%G%B);
          if(as4 < averageamp)
          {
            as4=12;
          }
          if (as4 > averageamp)
          {
            as4= 27;
          }
          colorMode(HSB); 
          color jk4 = color((r + 100) * (averageamp*10), (g + 100) * (averageamp*15), (b +100) * (averageamp * 15));
          set(i, j, jk4);
          colorMode(RGB);
        }

        else if (key == '5')
        {
          float ex5 = color(R%G%B);
          if(ex5 < averageamp)
          {
            ex5=12;
          }
          if (ex5 > averageamp)
          {
            ex5= 27;
          }
          colorMode(HSB); 
          color di5 = color((r - 100) * (averageamp*10), (g - 100) * (averageamp*25), (b +100) * (averageamp * 15));
          set(i, j, di5);
          colorMode(RGB);
        }

        else
        {
          float t = color(r % g % b);
          if (t < averageamp)
          {
            t = 10;
          }
          if (t > averageamp)
          {
            t = 28;
          }
          colorMode(HSB);
          color o = color((r -50) * (averageamp*10), (g + 80) * (averageamp*14), (b +100) * (averageamp * 15));
          set(i, j, o);
          colorMode(RGB);
        }  


      }
    }
  }
}







