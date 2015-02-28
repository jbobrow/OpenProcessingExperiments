
PImage pic;

void setup()
{
size (540,720);
frameRate(8);
pic = loadImage("pic.png");
}

void draw()
{
  background (#A0A0A0);
  stroke(noise(0),60);
  for (int i = 0; i < 540; i++)
  {
    float b = random (10);
    strokeWeight(b);
    float offset = b * 5;
    line (i-5, 720, i+offset, 0);
  }
  noStroke();
  for(int y = 0; y < 720; y += 10)
  {
    for (int x = 0; x < 540; x += 10)
    {
      fill ((x+y) * 0.5,0,10,210);
      rect(x,y,10,10);
    }
  }

  if (pic.width >0)
  {
    pic.filter(GRAY);
    //pic.filter(POSTERIZE,8);
    pic.filter(THRESHOLD,0.4);
    image(pic,0,0,width,height);
  }
  noStroke();
  smooth();
  fill(#00BC1D,200);
  int r = 38;
  for (int degree = 60; degree < 180; degree += 35)
  {
    float angle = radians (degree);
    float xx = 190 + (cos(angle) * r);
    float yy = 320 + (sin(angle) * r);
    ellipse (xx,yy,10,25);
  }
noSmooth();
fill(#001ABC,230);
beginShape();
vertex(30,300);
vertex(10,370);
vertex(20,450);
vertex(60,540);
vertex(140,610);
vertex(155, 612);
vertex(160,390);
vertex(90,295);
endShape();

color from = color(#FF0077);
color to = color(#00BC1D);
color a = lerpColor(from, to, .25);
color b = lerpColor(from, to, .375);
color c = lerpColor(from, to, .5);
color d = lerpColor(from, to, .625);
color e = lerpColor(from, to, .75);
color f = lerpColor(from, to, .875);
strokeWeight(4);
stroke(from);
line(150,610,150,445);
ellipse(150,445,11,11);
stroke(a);
line(140,608,140,470);
ellipse(140,470,11,11);
stroke(b);
line(120,590,120,391);
ellipse(120,391,11,11);
stroke(c);
line(115,587,115,350);
ellipse(115,350,11,11);
stroke(d);
line(80,556,80,495);
ellipse(80,495,11,11);
stroke(e);
line(60,538,60,304);
ellipse(60,304,11,11);
stroke(f);
line(50,512,50,460);
ellipse(50,460,11,11);
stroke (to);
line(30,467,30,332);
ellipse(30,332,11,11);
}



