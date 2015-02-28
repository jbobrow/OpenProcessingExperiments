
//import processing.eps.*;

float x = 450;

float y = 450;

float xn = 450;

float yn = 450;

float xc;

float yc;
float avoidX = 450;
float avoidY =450;

void setup(){

size(900,900);

background(0);
stroke(255, 10);

smooth();

}

void draw(){

    xc = random(-100,100);

  yc = random(-100,100);

  if ((dist(x+xc,y+yc,avoidX,avoidY)>200))

  {

    xn=x - xc;

    yn=y - yc;

  }

  else if  ((dist(x+xc,y+yc,avoidX,avoidY)>200))

  {

    xn=x - xc;

    yn=y - yc;

  }
  else

  {

      xn=x + xc;

      yn=y + yc;

  }

  if(xn<0){xn=abs(xn);}

  if(yn<0){yn=abs(yn);}

  

  if(xn>1000){xn=1000-abs(1000-xn);}

  if(yn>1000){yn=1000-abs(1000-yn);}

  

  line(x,y,xn,yn);

  x=xn;

  y=yn;

     /* if (mousePressed==true)

 {

   noLoop();

   }

  */

}


