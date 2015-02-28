
PImage foto;
int[] coorXinvasor={int(random(600)),int(random(600)),int(random(600)),int(random(600)),int(random(600))};
int[] coorYinvasor={50,50,50,50,50};
int diamInvasor;
int punt;
int vidas;
int extra;
void setup()
{
  size(600,600);
   foto=loadImage("galaxia.jpg");
   diamInvasor=10;
   punt=0;
   vidas=3;
   extra=0;
}
void nave()
{
 pushMatrix();
   stroke(0,0,255);
   fill(0,255,0);
   rect(0,70.5,16,30);
   triangle(0,70,8,55,16,70);
   triangle(-18,100,0,73,0,100);
   triangle(16,100,16,73,34,100);
 popMatrix();
}
void life()
{
  for(int i=1;i<vidas;i++)
  {
   pushMatrix();
    translate((55*i)-20,-50);
    nave();
   popMatrix();
  }
}
void arma()
{
  fill(0,255,0);
  //triangle(mouseX-8,580, mouseX,565,mouseX+8,580);
  pushMatrix();
    translate(mouseX,500);
    nave();
  popMatrix();  
  
}

void invasores()
{
  stroke(255);
  fill(255);
 
  for(int i=0; i<5;i++)
  {
    ellipse(coorXinvasor[i],coorYinvasor[i]++,diamInvasor,diamInvasor);
    
  }
}
void proyectil(int disp)
{

 boolean acertar=false;
 pushMatrix();
  stroke(255,0,0);
  line(disp,565,disp,500);
  line(disp+15,565,disp+15,500);
 popMatrix(); 
  for(int i=0;i<5;i++)
  {
    if((disp<=(coorXinvasor[i]+5))&&(disp>=(coorXinvasor[i]-5))||(disp+15<=(coorXinvasor[i]+5))&&(disp+15>=(coorXinvasor[i]-5)))
    {
      acertar=true;
      coorXinvasor[i]=int(random(600));
      coorYinvasor[i]=50;
      punt+=10;
    }
    if (acertar==false)
    {
    pushMatrix();
     stroke(255,0,0);  
     line(disp,coorYinvasor[i]-5,disp,coorYinvasor[i]-65);
     line(disp+15,coorYinvasor[i]-5,disp+15,coorYinvasor[i]-65);
    popMatrix(); 
    } 
  }
  if(punt-extra==1000)
  {
    vidas++;
    extra=punt;
  }
}
void finJuego()
{
  PFont myFont;
  String Fin;
  Fin= new String("GAME OVER");
  myFont = createFont("Arial MT", 50);
  textFont(myFont);
  for(int i=0;i<5;i++)
  {
    if(coorYinvasor[i]>=600)
    {
      vidas--;
      coorYinvasor[0]=50;
      coorYinvasor[1]=50;
      coorYinvasor[2]=50;
      coorYinvasor[3]=50;
      coorYinvasor[4]=50;
    }
  }
  if(vidas<0)
   {
     text(Fin,150,300);
     life();
     noLoop();
   }
}
void puntuacion()
{
  PFont myFont;
  String Puntos;
  Puntos=String.valueOf(punt);
  myFont = createFont("Arial MT", 20);
  textFont(myFont);
  text(Puntos, 550,20);
}
void draw()
{
  background(0);
  image(foto,0,0);
  life();
  arma();
  invasores();
  puntuacion();
  finJuego();
}
void mousePressed()
{
  proyectil(mouseX);
}


