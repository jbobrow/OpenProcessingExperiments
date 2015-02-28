
/* Alexandre Acsensi Valiente. Seminari 3 Informàtica.
Un pallaso fa malabars, cada cop que fas un click a la pantalla les boles seran més grosses */

//definim variables boles de malabars
int posX1,posY1,velX1,velY1,mida,midagran;
int posX2,posY2,velX2,velY2;
int posX3,posY3,velX3,velY3;
int posX4,posY4,velX4,velY4;
//variables del nas del pallaso
int nas,nasgran,velnas;

void setup()
{
  size(500,500);
  noCursor();
  smooth();
  noStroke();
  
  //donem un valor a les variables del nas.
  nas=1;
  nasgran=50;
  velnas=1;
  
  //donem un valor a les variables de les boles de malabars.
  //bola1
  mida=width/50;
  posX1=10;
  posY1=20;
  velX1=5;
  velY1=1;
  
  //bola2
  mida=width/50;
  posX2=50;
  posY2=100;
  velX2=3;
  velY2=1;
  
  //bola3
  mida=width/50;
  posX3=15;
  posY3=20;
  velX3=1;
  velY3=5;
  
  //bola4
  mida=width/50;
  posX4=100;
  posY4=200;
  velX4=3;
  velY4=2;
}
  

void draw()
{
  //faig el background que canvii en funciona de com mous el ratolí.
  background(mouseX,mouseY,150);
  
  //dibuixo el pallaso.
  fill(250);
  ellipse(width/2,height,150,200);
  
  fill(0);
  ellipse(width/2,height-125,width/5,width/5);
  ellipse(width/2,height-125-50,width/10,width/10);
  ellipse(width/2-50,height-125,width/10,width/10);
  ellipse(width/2+50,height-125,width/10,width/10);
  
  fill(250,200,5);
  ellipse(width/2,height-100,width/5,width/5);
  
  fill(255,222,245);
  ellipse(width/2+25,height-100,25,25);
  ellipse(width/2-25,height-100,25,25);
  triangle(width/2,height-50,width/2+15,height-75,width/2-15,height-75);
  
  fill(250);
  ellipse(width/2+20,height-125,width/25,width/25);
  ellipse(width/2-20,height-125,width/25,width/25);
  
  fill(0);
  ellipse(width/2+20,height-125,width/50,width/50);
  ellipse(width/2-20,height-125,width/50,width/50);
  
  fill(70,250,250);
  triangle(width/2,height-50,width/2-25,height-40,width/2-25,height-60);
  triangle(width/2,height-50,width/2+25,height-40,width/2+25,height-60);
  
  
  //faig que el nas del pallaso creixi fins a un punt i es torni a fer petit.
  fill(250,10,10);
  ellipse(width/2,height-100,nas,nas);
  nas=nas+velnas;
  if(nas>=nasgran){nas=1;}
  
  //faig que les boles de malabars rebotin per la pantalla.
  //bola 1
  fill(0,250,100);
  ellipse(posX1,posY1,mida,mida);
  posX1=posX1+velX1;
  posY1=posY1+velY1;
  if(posX1<=mida/2||posX1>=width-mida/2){velX1=-velX1;}
  if(posY1<=mida/2||posY1>=width-mida/2){velY1=-velY1;}
  
  //bola 2
  fill(250,250,0);
  ellipse(posX2,posY2,mida,mida);
  posX2=posX2+velX2;
  posY2=posY2+velY2;
  if(posX2<=mida/2||posX2>=width-mida/2){velX2=-velX2;}
  if(posY2<=mida/2||posY2>=width-mida/2){velY2=-velY2;}
  
  //bola 3
  fill(255,0,0);
  ellipse(posX3,posY3,mida,mida);
  posX3=posX3+velX3;
  posY3=posY3+velY3;
  if(posX3<=mida/2||posX3>=width-mida/2){velX3=-velX3;}
  if(posY3<=mida/2||posY3>=width-mida/2){velY3=-velY3;}
  
  //bola 4
  fill(0,150,255);
  ellipse(posX4,posY4,mida,mida);
  posX4=posX4+velX4;
  posY4=posY4+velY4;
  if(posX4<=mida/2||posX4>=width-mida/2){velX4=-velX4;}
  if(posY4<=mida/2||posY4>=width-mida/2){velY4=-velY4;}
}

//Quan es clicki la pantalla les boles de malabars es faran cada cop més grans, fins un punt en el que retornaran.
void mousePressed() 
{
  if(mida==mida){mida=mida+10;}
  if(mida>=150){mida=10;}
}


