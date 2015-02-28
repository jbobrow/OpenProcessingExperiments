
PImage imag;
String[]  mensajes;
float rot;
float velrot;
float posx;
float posx2;
float veltra;
float posy;
int indice;


void setup ()
{
 
 size (1000,1000);
  
imag= loadImage("jamaica.jpeg");
rot= 0;
 velrot=0.01;
 veltra=3;
 posx=251;
 posx2=0;
//posy= random(height);
posy= height/2;
indice=0;
 mensajes = loadStrings("onelove.txt");
}

  void draw()
{

background (255);
  
  

  
  pushMatrix();
translate(posx, posy);
rotate(rot);
imageMode (CENTER);
image (imag,0,0,500,500);  
rot=rot+velrot;


posx+=veltra;



if (posx>=750)
{

veltra = veltra*(-1);
velrot = velrot*(-1);

//noLoop ();
}

if (posx<=250)
{

veltra = veltra*(-1);
//noLoop ();
}
popMatrix();

fill (25,80);
noStroke ();
rect(0,0, width,10);
PFont f= loadFont("NewPeninimMT-Inclined-28.vlw");
textFont(f,40);
text(mensajes [indice], posx2,120);
posx2=posx2-5;

if (posx2 < 0- textWidth( mensajes[indice]))
{
 
  indice =indice +1;
  if (indice >=mensajes.length)
  {
    indice=0;
   
  }

 posx2=width;

}
  






  }

