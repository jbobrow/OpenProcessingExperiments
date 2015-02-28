

PImage bg;
PImage hh;
PImage mh;
PImage sh;
void setup() 
{


  size(300,300);

  bg=loadImage("k.gif");
  hh=loadImage("hh.gif");
  mh=loadImage("mh.gif");
}
void draw()
{

  background(255,255,255);


  String time = new String();
  Calendar c = Calendar.getInstance();


  Integer h=int(c.get(Calendar.HOUR));
  Integer m=int(c.get(Calendar.MINUTE));

  float hr;
  float mr;

  mr=map(m,0,59,0,TWO_PI);
  hr=map(h*60+m,0,720,0,TWO_PI);
  translate(width/2,height/2);

  image(bg,-1*width/2,-1*height/2);
  if(mr>hr) {
    rotate(hr);
    image(hh,-1*width/2,-1*height/2);
    rotate(mr-hr);
    image(mh,-1*width/2,-1*height/2);
  }
  else {
    rotate(mr);
    image(mh,-1*width/2,-1*height/2);
    rotate(hr-mr);
    image(hh,-1*width/2,-1*height/2);
  }
}



