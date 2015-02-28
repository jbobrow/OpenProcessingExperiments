
// philip H  ticklish penguin 
// 14/15
//slender man pic
PImage scary;
// randomizer for slender man
int rx;
int ry;
// annie pic
PImage annie;
//randomizer for annie 
int rx2;
int ry2;
int X2;
int Y2;
//mech for slowing slender
int count =0;
// tibber scare
PImage tibbers;
void setup()
{
  size(371, 491);
  scary = loadImage("http://philipsprograms.webs.com/Slender_man.jpg");
  annie = loadImage("http://philipsprograms.webs.com/annie_1.jpg");
  tibbers = loadImage("http://philipsprograms.webs.com/Tibbers_2.jpg");
}
void draw()
{
  count=count+1;
  background(0);
   
  //annie
  int x=161;
  int y=205;
  rx2 = rx2+int(random(-2, 2));
  ry2 = ry2+int(random(-2, 2));
  X2=x+rx2;
  Y2=y+ry2;
  image(annie,X2,Y2 , 42, 55);
  //slenderman
  image(scary, rx, ry, 50, 70);
  if (count`==0)
  {
    rx = int(random(10, 441));
    ry = int(random(10, 441));
  }

 if(rx==X2 && ry == Y2)
  {
    image(tibbers,0,0,371,491);
  }
  
}
