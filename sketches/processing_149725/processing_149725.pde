
PImage picture;
PImage ritch;
int poppy;
int crobat;
void setup()
{
  size (960,960);
  picture=loadImage("justice.jpg");
  ritch=loadImage("mario.jpg");
  PFont comic;
  comic = loadFont("ComicSansMS-108.vlw");
  textFont(comic);
  poppy = 340;
  crobat = 0;
}

void draw()
{
   background(0,0,0);
  image(picture,210,0);
  if(poppy > 0)
{
  fill(37,51,201);
text("JUSTICE" ,100,100 + crobat);
text("JUSTICE" ,450,600 + crobat);
text ("TRUTH" ,20,600 + crobat);
text ("TRUTH" , 500, 300 + crobat);
text("HONOR", 400,250 + crobat);
text("HONOR", 500,700 + crobat);
poppy--;
crobat--;
}
if(poppy <= 0)
{
  picture = ritch;
  fill(206,2,2);
  text("FEAR",100,800);
  text("FEAR",300,900);
  text("DARKNESS",0, 400);
  text("SPICEY FOOD",0,600);
}
}


