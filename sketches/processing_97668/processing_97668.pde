
/* Alexandre Acsensi Valiente
Seminari 4 */

//definim variables de les estrelles
int numestrelles = 200;
int [] posx= new int [numestrelles];
int [] posy= new int [numestrelles];
int [] velx= new int [numestrelles];
int [] vely= new int [numestrelles];

//definim variables rectangles
int amprect,altrect;

//definim variables posició de la lluna
int posllunax,posllunay;

void setup()
{
  size(500,500);
  smooth();
  
  //donem valor a les variables de les estrelles
  for(int i=0; i<numestrelles; i++)
  {
  posx[i]= width/2;
  posy[i]= height/2;
  velx[i]= int (random(1,10));
  vely[i]= int (random(0,10));
  }
  
  //variables fons pantalla
  amprect=10;
  altrect=10;
  
  //variables lluna
  posllunax=350;
  posllunay=100;
  
  //variables estrella
}

void draw()
{
  //dibuixem el fons amb un bucle.
  for(int x=0; x<=width; x+=10)
  {for(int y=0; y<=height; y+=10)
  {fill(12,82,165);
   stroke(11,66,130);
   rect(x,y,amprect,altrect);}}
   
   //dibuixem la lluna del fons de pantalla amb un altre bucle.
   for(int xx=posllunax; xx<=posllunax+50; xx+=10)
   {for(int yy=posllunay; yy<=posllunay+100; yy+=10)
   {fill(250,250,25);
   stroke(240,205,40);
   rect(xx,yy,amprect,altrect);
   rect(xx-10,posllunay-10,amprect,altrect);
   rect(xx-20,posllunay-20,amprect,altrect);
   rect(xx-10,posllunay+110,amprect,altrect);
   rect(xx-20,posllunay+120,amprect,altrect);
   fill(0);
   rect(posllunax+20,posllunay+30,amprect,altrect);}}
   
   //fem un bucle per les estrelles
   for(int i=0; i<numestrelles; i+=10)
   {
     posx[i]=posx[i]+velx[i];
     posy[i]=posy[i]+vely[i];
   
   //comprovem els límits
   if((posx[i]<=0)||(posx[i]>=width)){velx[i]=-velx[i];}
   if((posy[i]<=0)||(posy[i]>=height)){vely[i]=-vely[i];}
   
   //dibuixo les estrelles
   fill(250,250,25);
   stroke(240,205,40);
   rect(posx[i],posy[i],amprect,altrect);
   }
}


