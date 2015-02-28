
int posx;
int posy;
color c;

void setup()
{
size (900,450);
background (0);
stroke (75);
smooth();

mouseX=2000;
mouseY=2000;
}

void draw ()
{
 
 fill (0,8); //amb l'ultim valor creem una transparencia
 rect(0,0,width,height);
 
  translate (mouseX, mouseY);
  fill(0,0,0);
  if (mousePressed)
  {
    c=color(random(255),random(255),random(255));
    fill(c);
  }

 rotate(radians(60));
 ellipse (0,0,100,80);

}
  
