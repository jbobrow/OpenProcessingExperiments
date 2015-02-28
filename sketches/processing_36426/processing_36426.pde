
float a=150;
float b=150;
float c=255;
float ballsize =20;

void setup()
{

  size(700,400);
  background(255);
  stroke(0);
}

void draw()
{



  background(255);
  stroke(0);
  fill(c);
  if(dist(a,b,mouseX,mouseY)>105)
    c=(255);
  ellipse(a,b,ballsize,ballsize);


  if(dist(a,b,mouseX,mouseY)<100) {
    {  
      a=a-(mouseX-a)/15;
      b=b-(mouseY-b)/15;
    }
    {

      if(dist(a,b,mouseX,mouseY)<10) {
        a=random(700);
        b=random(400);
      }
      if(dist(a,b,mouseX,mouseY)<120) {
        c=(0);
      }
      //if(dis//
    }
  }
}


