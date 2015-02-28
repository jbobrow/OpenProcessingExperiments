
//Shela H. Repeating Shapes. CP1 mods 16-17

int ballx = 100;
int bally = 150;
int ballz = 250;
int charamov1 = 10;
int charamov2 = 50;
int charamov3 = -50;
int ballooncirc = 250;
int balloonoval = 350;

PImage b;
PImage c;
PImage k;
PImage m;
PImage t;

void setup()
{
  size(650,550);
  b = loadImage("http://www.hawaiikawaii.net/wp-content/uploads/2011/04/02_1024_768.jpg");
  c = loadImage("http://i.imgur.com/xW2cd.png");
  k = loadImage("http://i.imgur.com/ZzQPK.png");
  m = loadImage("http://i.imgur.com/ULqqH.png");
  t = loadImage("http://i.imgur.com/nRF7U.png");
  smooth();
}
void draw()
{
  balls();
  characters();
}
void balls()
{
  image(b, 0, 0,650,550);
   fill(240,131,131,110);
   ellipse(ballx,450,50,50);
   fill(187,137,242,110);
   ellipse(bally,460,30,30);
   fill(137,167,242,110);
   ellipse(ballz,455,40,40);

   ballx = ballx + int(random(-12,12));
   bally = bally + int(random(-5,5));
   ballz = ballz + int(random(-10,10));
}

void characters()
{
  image(c,540+charamov3,0,95,135);
  image(m,30+charamov1,400,55,65);
  image(k,250+charamov2,380,65,85);
  image(t,590,245+charamov1,45,65);
  charamov1 = charamov1 + int(random(-2,2));
  charamov2 = charamov2 + int(random(-10,10));
  charamov3 = charamov3 + int(random(-7,7));
}
