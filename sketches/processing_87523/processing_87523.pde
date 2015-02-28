
// copyright Kelechi Anyadiegwu
// HW 5

  PImage cherrypinklips, darkerpinklips, turqlips, limegreenlips, purplelips;

  float x,y,wd,ht;

void setup ()
{
  size(400,400);
  smooth();
  frameRate(20);
  imageMode(CENTER);
  
  cherrypinklips = loadImage("lipscherrypink.png");
  darkerpinklips = loadImage("lipsdarkerpink.png");
  turqlips = loadImage("lipsturq.png");
  limegreenlips = loadImage("lipslimegreen.png");
  purplelips = loadImage("lipspurple.png");

  x=width-1;
  y=height-1;
  wd=200;
  ht=103;

  //background(200);
}

void draw ()

{
//background(248);
//  pushMatrix();
//  translate(random(width), random(height));
//  rotate(radians(random(360)));
 
  placeLips(mouseX, mouseY);
  placeLips( 0,0 , wd, ht);
  //popMatrix();
//placeLips(mouseX,mouseY);
}

void placeLips(float mouseX, float mouseY)

{
  
  image(purplelips, mouseX, mouseY, pmouseX, pmouseY);
}

void placeLips(float x, float y, float wd, float ht)
{
   translate(random(width), random(height));
  rotate(radians(random(360)));

  image(limegreenlips, x,y, wd,ht);
   translate(random(width), random(height));
  rotate(radians(random(360)));
  image(cherrypinklips,x*1.5,y*1.5, wd*1.5, ht*1.5);
   translate(random(width), random(height));
  rotate(radians(random(360)));
  image(turqlips,x*2,y*2 , wd*2, ht*2);
}


