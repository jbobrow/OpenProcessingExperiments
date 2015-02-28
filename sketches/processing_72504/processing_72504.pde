
int counter;
//Stephanie Wong mods:14-15 Ticklish Penguin
//STPrograms.webs.com

int x=0;
int y=10;
PImage tank;
void setup()
{
  size(500,500);
  tank=loadImage("images.jpg");
  frameRate(10);
}
void draw()
{
  background(10,9,70);
  fill(247,177,34);
  //FishTank
  image(tank,0,0,500,500);
  //head
  ellipse(x,y,200,100);
  x=x+int(random(0,20));
   y=y+int(random(0,20));
  //fin
  stroke(232,155,12);
  strokeWeight(5);
  triangle(x-10,y+10,x-70,y-5,x-20,y+30);
  //tail
  noStroke();
  triangle(x-60,y,x-130,y-50,x-120,y+50);
  //Eyes
  fill(255);
  ellipse(x+60,y-20,40,40);
  fill(0);
  ellipse(x+60,y-20,25,25);
}
