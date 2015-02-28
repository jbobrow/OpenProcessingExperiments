
void setup(){
  size(600,600);
  
}

void draw(){
  PImage miImagen;
miImagen=loadImage("galaxia.jpg");
image(miImagen, 0,0);
loadPixels();
  arma();
  invasores();
  finJuego(); 
}

void mousePressed()
{
  proyectil(mouseX);
}
  

  void arma()
  {
    fill(128,255,0);
    stroke(color(0,0,255));
    triangle(mouseX-8,580,mouseX,565,mouseX+8,580);
    
  }   


int[] coordenadasXinvasor={int(random(600)), int(random(600)),int(random(600)), int(random(600)), int(random(600))};
int[]  coordenadasYinvasor={0,0,0,0,0};
int diametroinvasor=10;

void invasores()
{
  stroke(255,255,0);
  fill(255,255,0);
  for(int i=0;i<5;i++){
    ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i]++,diametroinvasor,diametroinvasor);
  }
}


void proyectil(int disparoX)
{
  boolean acertar=false;
  for(int i=0;i<5;i++)
  {
    if((disparoX>=(coordenadasXinvasor[i]-diametroinvasor/2))&& (disparoX<=(coordenadasXinvasor[i]+diametroinvasor/2)))
    {
      acertar=true;
      line(mouseX,565,mouseX,coordenadasYinvasor[i]);
      ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i],diametroinvasor+25,diametroinvasor+25);
      coordenadasXinvasor[i]=int(random(600));
      coordenadasYinvasor[i]=0;
    }
  }
  if(acertar==false)
  {
    line(mouseX,565,mouseX,0);
  }
}
  
void finJuego()
{
  for(int i=0;i<5;i++)
  {
    if(coordenadasYinvasor[i]==600)
    {
        noLoop();
    }
  }
}





