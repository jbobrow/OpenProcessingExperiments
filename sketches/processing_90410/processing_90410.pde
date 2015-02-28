
int colour = 150;
int z = -10;
int y = 300;
int x = 400;
PImage img;

color c1 =#000000;
color c2 =#FFFFFF;            
color c3 =#FF0000;
color c4 =#00FF00;
color c5 =#0000FF;
color c6 =150;

void setup ( ) {
  size (800, 600, P3D);
  img = loadImage("img.jpg");

  frameRate (30);
  smooth ( );
}
void draw()



{
  // background (255) ;
  lights();
  translate(x, y, z);


  box(5);
  fill(colour);
  noStroke();

  if (mousePressed) {
    x = 400;
    y = 300;
    image(img,0,0);
  }

  if (mousePressed) {

    translate(0, 0);
    imageMode(CENTER);
  }
}
void keyPressed()
{
  if (key == 'a')
  {
    z=z-10;
  }
  {
    if (key=='z')
    {
      z+=10;
    }
    if (key=='i')
    {
      y-=10;
    }

    if (key=='k')
    {
      y+=10;
    }
    if (key=='l')
    {
      x+=10;
    }
    if (key=='j')
    {
      x-=10;
    }
    if (key=='b')
    {
      colour=c1 ;
    }
    if (key=='n')
    {
      colour=c2 ;
    }
    if (key=='m')
    {
      colour=c3 ;
    }
    if (key=='c')
    {
      colour=c4 ;
    }
    if (key=='x')
    {
      colour=c5 ;
    }
     if (key=='v')
    {
      colour=c6 ;
    }
  }
}




void mouseReleased() {
  image(img, 0, 0);
}



