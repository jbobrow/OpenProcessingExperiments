
PFont type;
PImage img;
PImage nave1;
PImage ovni;
int[] coordenadasXinvasor={int(random(450)),int(random(450)),int(random(450)),int(random(450)),int(random(450))};
int[] coordenadasYinvasor={10,10,10,10,10};
int diametroInvasor=40;
int eliminados=0;
int numbombas=5;
void setup()
{
  size(450,450);
  img =loadImage("galaxia.jpg");
  nave1=loadImage("nave.gif");
  ovni=loadImage("ovni.gif");
}
void draw()
{
  type=loadFont("GillSans-UltraBold-48.vlw");
  background(img);
  inicio();
  finjuego();   
}
void inicio()
{
  arma();
  invasores() ;
}
void arma()
{
  fill(0,200,255);
  stroke(color(0,200,255));
  image(nave1,mouseX-27,415);
  //triangle(mouseX-8,430,mouseX,415,mouseX+8,430);
  marcador();
}
void invasores()
{
  stroke(255);
  fill(255);
  for(int i=0; i<5; i++)
  {
   image(ovni,coordenadasXinvasor[i],coordenadasYinvasor[i]+5); 
    //ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i],diametroInvasor,diametroInvasor); 
    coordenadasYinvasor[i]=coordenadasYinvasor[i]+5;
  
  }
}
void mousePressed()
{
  proyectil(mouseX);

}
void proyectil(int disparoX)
{
  boolean acertar=false;
  for(int i=0; i<5; i++)
  {
    if((disparoX>=(coordenadasXinvasor[i]-diametroInvasor/2))&& (disparoX<=(coordenadasXinvasor[i]+diametroInvasor/2)))
    {
      acertar=true;
      line(mouseX,565,mouseX,coordenadasYinvasor[i]);
      fill(255,0,0);
      ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i], diametroInvasor+20, diametroInvasor+20);
      coordenadasXinvasor[i]=int(random(450));
      coordenadasYinvasor[i]=0;
      eliminados++;
    }
    if(acertar==false)
    {
      line(mouseX, 415,mouseX,0);
    }
  }
}
void keyPressed()
{
  bomba(mouseX);
}
void bomba(int disparoX)
{
  boolean acertar=false;
  fill(255,255,0);
  if(numbombas!=0)
  {
    for(int i=0; i<5; i++)
    {
      if(keyPressed)
      {
        if(key=='b'||key=='B')
        {
          if((disparoX>=(coordenadasXinvasor[i]-diametroInvasor*40))&& (disparoX<=(coordenadasXinvasor[i]+diametroInvasor*40)))
          {
             acertar=true;
             ellipse(mouseX,coordenadasYinvasor[i],60,60);
             ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i], diametroInvasor+40, diametroInvasor+40);
             coordenadasXinvasor[i]=int(random(450));
             coordenadasYinvasor[i]=0;
             eliminados++;  
          }
          if(acertar==false)
          {
            ellipse(mouseX,0,60,60);
          }    
        }
      }
    }
    numbombas--;
  }   
}
void finjuego()
{
  for(int i=0; i<5; i++)
  {
    if(coordenadasYinvasor[i]==450)
    {
       lose();
    }
  }
}
void marcador()
{
  fill(255,200,100);
  textFont(type,20);
  text(eliminados,400,20);
  textFont(type,9);
  fill(200,250,150);
  text("Bombas press(B/b):"+numbombas,10,440);
}
void lose()
{
  background(0);
  textFont(type,50);
  fill(255,0,0);
  text("GAME OVER",40,210);
  noLoop();
}  


