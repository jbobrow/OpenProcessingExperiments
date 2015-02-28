
//Created by Luke Noonan 2008
//fareastcoastnoise.blogspot.com/

float x = 250;
float y = 250;
float xn = 250;
float yn = 250;
float xc;
float yc;
float Sx;
float Sy;

void setup(){
size(900,900);
background(255);
smooth();
Sx = random(width);
Sy = random(height);

}
void draw(){
    xc = random(-100,100);
  yc = random(-100,100);
  if (dist(x+xc,y+yc,Sx,Sy)<100)
  {stroke(255,0,0);  }
  else
  {stroke(0);  }
  
  xn=x+xc;
  yn=y+yc;
  
  if(xn<0){xn=abs(xn);}
  if(yn<0){yn=abs(yn);}
  
  if(xn>width){xn=width-abs(width-xn);}
  if(yn>height){yn=height-abs(height-yn);}
  
  line(x,y,xn,yn);
  x=xn;
  y=yn;
      if (mousePressed==true)
 {
   noLoop();
   //save("bloodspot.png");
   }
  
}

