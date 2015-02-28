
int x,y;
int xspeed,yspeed;
int ellipseRadius;
int x2,y2;
int xspeed2,yspeed2;
int ellipseRadius2;
int x3,y3;
int xspeed3,yspeed3;
int ellipseRadius3;

void setup()
{
 size(500,500);  //pencerenin büyüklüğü
 smooth();
 ellipseMode(CENTER);
 x=60;    //konumu
 y=60;    //konumu
 xspeed=2;  //topun x ekseninde hızı
 yspeed=5;   //topun y ekseninde hızı
 ellipseRadius = 5;  //topun büyüklüğü
  x2=440;    //konumu
 y2=440;    //konumu
 xspeed2=-2;  //topun x ekseninde hızı
 yspeed2=-1;   //topun y ekseninde hızı
 ellipseRadius2 = 10;  //topun büyüklüğü
  x3=250;    //konumu
 y3=250;    //konumu
 xspeed3=3;  //topun x ekseninde hızı
 yspeed3=3;   //topun y ekseninde hızı
 ellipseRadius3 = 15;  //topun büyüklüğü
 noStroke();
}

void draw()
{
  fill(255,15); //fill(brightness, transparency) arka plan için buda arkasında süzülen şeyi değiştiriyor
  rect(0,0,width,height); //semi-transparent rectangle instead of opaque bg. 
//  background(150,150,1); 

//ilerlemesini sağlayan kod
  x=x+xspeed;
  y=y+yspeed;
    x2=x2+xspeed2;
  y2=y2+yspeed2;
    x3=x3+xspeed3;
  y3=y3+yspeed3;
  
  //duvara çarptığında sekmesi için
  if(y>=height-ellipseRadius || y<=ellipseRadius)
  {
    yspeed=yspeed*-1;
  }
  if (x>=width-ellipseRadius || x<=ellipseRadius)
  {
    xspeed=xspeed*-1;
  }
 
  fill(255,0,0);   //topun rengi
  ellipse(x,y,ellipseRadius*2,ellipseRadius*2); 
  
    if(y2>=height-ellipseRadius2 || y2<=ellipseRadius2)
  {
    yspeed2=yspeed2*-1;
  }
  if (x2>=width-ellipseRadius2 || x2<=ellipseRadius2)
  {
    xspeed2=xspeed2*-1;
  }
 
  fill(0,255,0);   //topun rengi
  ellipse(x2,y2,ellipseRadius2*2,ellipseRadius2*2);
 
   if(y3>=height-ellipseRadius3 || y3<=ellipseRadius3)
  {
    yspeed3=yspeed3*-1;
  }
  if (x3>=width-ellipseRadius3 || x3<=ellipseRadius3)
  {
    xspeed3=xspeed3*-1;
  }
 
  fill(0,0,255);   //topun rengi
  ellipse(x3,y3,ellipseRadius3*2,ellipseRadius3*2);  
}


