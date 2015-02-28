


float c=255;
float ballsize =20;
float[] ball = {
  random(700),random(400)
  };
  float a=ball[0];
float b=ball[1];
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
      if(a < 0) {
        a=0;
      }
      if(a > 700) {
        a=700;
      }
      if(b < 0) {
        b=0;
      }
      if(b > 400) {
        b=400;
      }
    }
  }
}


