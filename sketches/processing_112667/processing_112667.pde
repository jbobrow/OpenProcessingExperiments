
float a=0, s= 0.0, counter=0;
float r=0, g=0, b=0, r2=30, g2=5, b2=10;
boolean first=true;
void setup()
{
  size(1000, 800);
  background(255);
  //frameRate(1000000000);
}

void draw()
{
  stroke(r, g, b);
  r+=r2;
  g+=g2;
  b+=b2;
  if (r>=255)
    r2*=-1;
  if (g>=255)
    g2*=-1;
  if (b>=255)
    b2*=-1;
  if (r<=0)
    r2*=-1;
  if (g<=0)
    g2*=-1;
  if (b<=0)
    b2*=-1;
  if (counter>1260)
  {
    translate(width/2, height/2);
    rotate(a);
    scale(s);
    if (first)
      s-=.01;
    if (!first)
      s+=.01;
    if (s<-1)
      first=false;
    if (s>1)
      first=true;
  }
  pushMatrix();
  translate(width/2, height/2);
  rotate(a);
  fill(r,g,b);
  ellipse(0, 0, 10, 10);
  line(0, 10, 0, 40);
  line(250, 260, 270, 270);
  line(250, 260, 230, 270);
  line(250, 290, 260, 330);
  line(250, 290, 240, 330);
  popMatrix();
  if (counter>315)
  {
    pushMatrix();
    translate(width/2, height/2);
    rotate(a);
    fill(random(255), random(255), random(255));
    ellipse(0, 0, 20, 20);
    line(0, 10, 0, 80);
    line(220, 230, 240, 240);
    line(220, 230, 200, 240);
    line(220, 260, 230, 300);
    line(220, 260, 210, 300);
    line(0, -10, 0, -80);
    line(-220, -230, -240, -240);
    line(-220, -230, -200, -240);
    line(-220, -260, -230, -300);
    line(-220, -260, -210, -300);
    popMatrix();
  }
  if (counter>630)
  {
    pushMatrix();
    translate(width/2, height/2);
    rotate(a*counter);
    line(50, 0, random(100, 150), 0);
    if (random(100)>70)
    {
      line(50, 0, random(150, 250), 0);
    }
    scale(random(5));
    rectMode(CENTER);
    //noStroke();
    rect(0, 0, 30, 30);
    popMatrix();
  }
  a+=.02;
  counter++;
}



