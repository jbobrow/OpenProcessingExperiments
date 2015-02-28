
//Derek Kwong, Mods 14/15
PImage pikachu;
float x=0;
float y=0;
void setup()
{ 
  size(500, 500);
  background(255);
  frameRate(10);
  smooth();
  pikachu= loadImage("http://cutiemay45place.webs.com/photos/Pikachu-and-Pichu/Pikachu_thunderbolt.png");
}
void draw()
{ 
  image(pikachu, 0, 0, 500, 500);
  if (mousePressed==true)
  { 
    image(pikachu, x, y, 500, 500);
    x=int(random(-5, 5));
    y=int (random(-5, 5));
  }
}
