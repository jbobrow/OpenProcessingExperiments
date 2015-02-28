
float c=255;
float ballsize=20;
float x= random(700);
float y= random(400);

float a=random(700);
float b=random(400);
float d=random(700);
float e=random(400);
float f=255;
float g=255;
float h =random(700);
float j=random(400);
float k=255;
void setup()
{ 

  size(700, 400);
  background(255);
  stroke(0);
}

void draw()
{
  background(255);
  stroke(0);
  fill(c);
  // for (int i = 0; i<10; i++);
  {

    ellipse(x, y, ballsize, ballsize);
    if (dist(x, y, mouseX, mouseY)>105)
      c=(255);


    if (dist(x, y, mouseX, mouseY)<100) {
      {  
        x=x-(mouseX-x)/15;
        y=y-(mouseY-y)/15;
      }
      {

        if (dist(x, y, mouseX, mouseY)<10) {
          x=random(700);
          y=random(400);
        }

        if (dist(x, y, mouseX, mouseY)<120) {
          c=(0);
        }
        if (x < 0) {
          x=0;
        }
        if (x > 700) {
          x=700;
        }
        if (y < 0) {
          y=0;
        }
        if (y > 400) {
          y=400;
        }
      }
    }
  }

  {
    fill(f);
    ellipse(a, b, ballsize, ballsize);

    if (dist(a, b, mouseX, mouseY)>105)
      f=(255);


    if (dist(a, b, mouseX, mouseY)<100) {
      {  
        a=a-(mouseX-a)/15;
        b=b-(mouseY-b)/15;
      }
      {

        if (dist(a, b, mouseX, mouseY)<10) {
          a=random(700);
          b=random(400);
        }

        if (dist(a, b, mouseX, mouseY)<120) {
          f=(0);
        }
        if (a < 0) {
          a=0;
        }
        if (a > 700) {
          a=700;
        }
        if (b < 0) {
          b=0;
        }
        if (b > 400) {
          b=400;
        }
      }
    }
  }
  {
    fill(g);
    ellipse(d, e, ballsize, ballsize);

    if (dist(d, e, mouseX, mouseY)>105)
      g=(255);


    if (dist(d, e, mouseX, mouseY)<100) {
      {  
        d=d-(mouseX-d)/15;
        e=e-(mouseY-e)/15;
      }
      {

        if (dist(d, e, mouseX, mouseY)<10) {
          d=random(700);
          e=random(400);
        }

        if (dist(d, e, mouseX, mouseY)<120) {
          g=(0);
        }
        if (d < 0) {
          d=0;
        }
        if (d > 700) {
          d=700;
        }
        if (e < 0) {
          e=0;
        }
        if (e > 400) {
          e=400;
        }
      }
    }
  }
  
  {
    fill(k);
    ellipse(h, j, ballsize, ballsize);

    if (dist(h, j, mouseX, mouseY)>105)
      k=(255);


    if (dist(h, j, mouseX, mouseY)<100) {
      {  
        h=h-(mouseX-h)/15;
        j=j-(mouseY-j)/15;
      }
      {

        if (dist(h, j, mouseX, mouseY)<10) {
          h=random(700);
          j=random(400);
        }

        if (dist(h, j, mouseX, mouseY)<120) {
          k=(0);
        }
        if (h < 0) {
          h=0;
        }
        if (h > 700) {
          h=700;
        }
        if (j < 0) {
          j=0;
        }
        if (j > 400) {
          j=400;
        }
      }
    }
  }
}


