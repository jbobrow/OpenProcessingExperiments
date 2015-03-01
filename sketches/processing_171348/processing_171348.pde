
float rotate;
float r=250;
float scale1=0.4;
color back1;
  int woodx = 400;
  int woody = 300;


void setup()
{
  size(800,600,P3D);

}

void draw()
{
PImage wood;
wood = loadImage("wood.png");

// effect  
  rotate+=5;
  if(scale1<1.5)
  {
  scale1+=0.006;
  }
  
  background(255);

//background
  /*for(int back=0; back<600;back+=71)
  {
    if(back%2==1)
    {back1 = color(8,255,46);}
    else
    {back1 = color(6,211,38);}
    //rectMode(CORNER);
    fill(back1);
    noStroke();
    rect(0,back,width,71);
  }
*/

//woodman
  imageMode(CENTER);
  image(wood,400,300);

//leaf
translate(woodx,woody);
 pushMatrix();
 scale(scale1);
 for(int i=0; i<12 ;i++)
 {
 rotate+=30;
 leaf();
 }
 popMatrix();

}

void leaf()
{
      PImage leaf;
leaf = loadImage("leaf.png");
  
  pushMatrix();
  rotateZ(radians(rotate));
  rotateX(radians(rotate/5));  
  image(leaf,r,0);
  popMatrix();
}


