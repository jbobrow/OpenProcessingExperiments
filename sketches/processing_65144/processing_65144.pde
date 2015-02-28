



PImage text1;
float x = 150;
float y = 200;

float a = 200;
float b = 200;
float aa = 200;
float bb = 200;
float xx = 150;
float yy = 200;
float c = 300;
float d = 300;
float cc = 300;
float dd = 200;
float e = 400;
float f = 150;
float ee = 300;
float ff = 150;
float g = 300;
float h = 200;
float gg = 400;
float hh = 200;
float i = 400;
float j = 300;
float ii = 400;
float jj = 400;
float k = 150;
float l = 400;
float kk = 150;
float ll = 300;

float targetX1 = 150;
float targetY1 = 200;
float targetX2 = 200;
float targetY2 = 200;
float targetX3 = 150;
float targetY3 = 400;

float easing1 = 0.25;

boolean flip1 = false;

float psecond;

void setup() 
{

  size(650, 650); 
  smooth();
  noStroke();
  text1 = loadImage("text1.png");
}

void draw() 
{

  /////////1
  {

    translate(50, 22);


    background( #F5F5F2 );
    image(text1, 150, 427);
    {
      fill(39, 147, 175);//1
      rect(150, 150, 50, 50);

      fill(229, 128, 88);//2
      rect(150, 200, 50, 100);

      fill(111, 224, 165);//3
      rect(150, 300, 50, 100);
      fill(222, 210, 83);
      //middle
      rect(200, 200, 100, 100);

      fill(232, 89, 89); //r1
      rect(300, 150, 100, 50);

      fill(202, 177, 203); //r3
      rect(300, 300, 100, 100);

      fill(173, 218, 245); //r2
      rect(300, 200, 100, 100);
    }


    if ( millis() > 3000) {

      fill(229, 128, 88);
      beginShape();   
      vertex(150, 150);
      vertex(200, 200);
      vertex(x, y);
      endShape();
      if (second() != psecond) {

        flip1 = !flip1;
      }
    }

    if (flip1) {
      targetX1 = 200;
      targetY1 = 150;
    }

    else {
      targetX1 = 150;
      targetY1 = 200;
    }


    float dx = targetX1 - x;

    if (abs(dx) > 1) {
      x += dx * easing1;
    }
    float dy = targetY1 - y;
    if (abs(dy) > 1) {
      y += dy * easing1;
    }
  }

  psecond = second();

  /////////////1-1


  {
    {
      if ( millis()> 19500) {
        fill(222, 210, 83);
        beginShape();
        vertex(150, 200);
        vertex(200, 150);
        vertex(aa, bb);
        endShape();

        if (second() !=psecond) {
          flip1=!flip1;
        }

        if (flip1) {
          targetX1 =150;
          targetY1 =150;
        }

        else {
          targetX1 = 200;
          targetY1 = 200;
        }

        float dx = targetX1 - aa;
        if (abs(dx) > 1) {
          aa +=dx* easing1;
        }
        float dy = targetY1 - bb;
        if (abs(dy) >1) {
          bb += dy* easing1;
        }
      }
    }
  }


  psecond = second();


  /////////////3-3


  {
    {
      if ( millis()> 20000) {
        fill(232, 89, 89);
        beginShape();
        vertex(150, 400);
        vertex(200, 300);
        vertex(kk, ll);
        endShape();

        if (second() !=psecond) {
          flip1=!flip1;
        }

        if (flip1) {
          targetX1 =200;
          targetY1 =400;
        }

        else {
          targetX1 = 150;
          targetY1 = 300;
        }

        float dx = targetX1 - kk;
        if (abs(dx) > 1) {
          kk +=dx* easing1;
        }
        float dy = targetY1 - ll;
        if (abs(dy) >1) {
          ll += dy* easing1;
        }
      }
    }
  }


  psecond = second();




  //////////3




  {
    {
      if ( millis()> 11500) {
        fill(173, 218, 245);
        beginShape();
        vertex(150, 300);
        vertex(200, 400);
        vertex(k, l);
        endShape();

        if (second() !=psecond) 
          flip1=!flip1;

        if (flip1) {
          targetX3 =200;
          targetY3 =300;
        }

        else {
          targetX3 = 150;
          targetY3 = 400;
        }

        float dx = targetX3 - k;
        if (abs(dx) > 1) {
          k +=dx* easing1;
        }
        float dy = targetY3 - l;
        if (abs(dy) >1) {
          l += dy* easing1;
        }
      }
    }


    psecond = second();



    /////////////  2-2


    {
      {
        if ( millis()> 16000) {
          fill(202, 177, 203);

          beginShape();
          vertex(150, 300);
          vertex(200, 200);
          vertex(xx, yy);
          endShape();

          if (second() !=psecond) {
            flip1=!flip1;
          }

          if (flip1) {
            targetX1 =200;
            targetY1 =300;
          }

          else {
            targetX1 = 150;
            targetY1 = 200;
          }

          float dx = targetX1 - xx;
          if (abs(dx) > 1) {
            xx +=dx* easing1;
          }
          float dy = targetY1 - yy;
          if (abs(dy) >1) {
            yy += dy* easing1;
          }
        }
      }
    }


    psecond = second();



    ////////////2


    {
      {
        if ( millis()> 25500) {

          fill(222, 210, 83);
          beginShape();
          vertex(150, 200);
          vertex(200, 300);
          vertex(a, b);
          endShape();

          if (second() !=psecond) {
            flip1=!flip1;
          }

          if (flip1) {
            targetX1 =150;
            targetY1 =300;
          }

          else {
            targetX1 = 200;
            targetY1 = 200;
          }
          float dx = targetX1 - a;
          if (abs(dx) > 1) {
            a +=dx* easing1;
          }
          float dy = targetY1 - b;
          if (abs(dy) >1) {
            b += dy* easing1;
          }
        }
      }
    }
  }
  psecond = second();



  /////////////  middle2


  {
    {
      if ( millis()> 22000) {
        fill(173, 218, 245);

        beginShape();
        vertex(200, 200);
        vertex(300, 300);
        vertex(cc, dd);
        endShape();

        if (second() !=psecond) {
          flip1=!flip1;
        }

        if (flip1) {
          targetX1 =200;
          targetY1 =300;
        }

        else {
          targetX1 = 300;
          targetY1 = 200;
        }

        float dx = targetX1 - cc;
        if (abs(dx) > 1) {
          cc +=dx* easing1;
        }
        float dy = targetY1 - dd;
        if (abs(dy) >1) {
          dd += dy* easing1;
        }
      }
    }
  }


  psecond = second();






  ////////////middle


  {
    {
      if ( millis()> 14000) {
        fill(111, 224, 165);
        beginShape();
        vertex(200, 300);
        vertex(300, 200);
        vertex(c, d);
        endShape();

        if (second() !=psecond) {
          flip1=!flip1;
        }

        if (flip1) {
          targetX1 =300;
          targetY1 =300;
        }

        else {
          targetX1 = 200;
          targetY1 = 200;
        }
        float dx = targetX1 - c;
        if (abs(dx) > 1) {
          c +=dx* easing1;
        }
        float dy = targetY1 - d;
        if (abs(dy) >1) {
          d += dy* easing1;
        }
      }
    }
  } 
  psecond = second();




  /////////////  right 1-1


  {
    {
      if ( millis()> 24000) {
        fill(39, 147, 175);

        beginShape();
        vertex(300, 200);
        vertex(400, 150);
        vertex(ee, ff);
        endShape();

        if (second() !=psecond) {
          flip1=!flip1;
        }

        if (flip1) {
          targetX1 =400;
          targetY1 =200;
        }

        else {
          targetX1 = 300;
          targetY1 = 150;
        }

        float dx = targetX1 - ee;
        if (abs(dx) > 1) {
          ee +=dx* easing1;
        }
        float dy = targetY1 - ff;
        if (abs(dy) >1) {
          ff += dy* easing1;
        }
      }
    }
  }


  psecond = second();





  ////////////right 1


  {
    {
      if ( millis()> 17500) {

        fill(202, 177, 203);
        beginShape();
        vertex(300, 150);
        vertex(400, 200);
        vertex(e, f);
        endShape();

        if (second() !=psecond) {
          flip1=!flip1;
        }

        if (flip1) {
          targetX1 =300;
          targetY1 =200;
        }

        else {
          targetX1 = 400;
          targetY1 = 150;
        }
        float dx = targetX1 - e;
        if (abs(dx) > 1) {
          e +=dx* easing1;
        }
        float dy = targetY1 - f;
        if (abs(dy) >1) {
          f += dy* easing1;
        }
      }
    }
  }
  psecond = second();


  ////////////right 2


  {
    {
      if ( millis()> 2500) {
        fill(39, 147, 175);

        beginShape();
        vertex(300, 300);
        vertex(400, 200);
        vertex(g, h);
        endShape();

        if (second() !=psecond) {
          flip1=!flip1;
        }

        if (flip1) {
          targetX1 =300;
          targetY1 =200;
        }

        else {
          targetX1 = 400;
          targetY1 = 300;
        }
        float dx = targetX1 - g;
        if (abs(dx) > 1) {
          g +=dx* easing1;
        }
        float dy = targetY1 - h;
        if (abs(dy) >1) {
          h += dy* easing1;
        }
      }
    }
  }
  psecond = second();


  /////////////  right 2-2


  {
    {
      if ( millis()> 6500) {
        fill(111, 224, 165);

        beginShape();
        vertex(300, 200);
        vertex(400, 300);
        vertex(gg, hh);
        endShape();

        if (second() !=psecond) {
          flip1=!flip1;
        }

        if (flip1) {
          targetX1 =300;
          targetY1 =300;
        }

        else {
          targetX1 = 400;
          targetY1 = 200;
        }

        float dx = targetX1 - gg;
        if (abs(dx) > 1) {
          gg +=dx* easing1;
        }
        float dy = targetY1 - hh;
        if (abs(dy) >1) {
          hh += dy* easing1;
        }
      }
    }
  }


  psecond = second();

  ////////////////////////////right3

  {
    {
      if ( millis()> 9000) {
        fill(232, 89, 89);
        beginShape();
        vertex(300, 300);
        vertex(400, 400);
        vertex(i, j);
        endShape();

        if (second() !=psecond) {
          flip1=!flip1;
        }

        if (flip1) {
          targetX1 =300;
          targetY1 =400;
        }

        else {
          targetX1 = 400;
          targetY1 = 300;
        }
        float dx = targetX1 - i;
        if (abs(dx) > 1) {
          i +=dx* easing1;
        }
        float dy = targetY1 - j;
        if (abs(dy) >1) {
          j += dy* easing1;
        }
      }



      psecond = second();

      /////////////  right 3-3


      {
        {
          if ( millis()> 27500) {
            fill(229, 128, 88);

            beginShape();
            vertex(300, 400);
            vertex(400, 300);
            vertex(ii, jj);
            endShape();

            if (second() !=psecond) {
              flip1=!flip1;
            }

            if (flip1) {
              targetX1 =300;
              targetY1 =300;
            }

            else {
              targetX1 = 400;
              targetY1 = 400;
            }

            float dx = targetX1 - ii;
            if (abs(dx) > 1) {
              ii +=dx* easing1;
            }
            float dy = targetY1 - jj;
            if (abs(dy) >1) {
              jj += dy* easing1;
            }
          }
        }
      }


      psecond = second();
    }
  }
}



