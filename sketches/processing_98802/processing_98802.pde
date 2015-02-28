
String[] palabrass = {"ALFREDO","RICHAUD","ALDEERAN","NABOO","MUSTAFAR","DAGOBA","UTAPAU","JEDI","KHASSIK","PASADO","ATRAS","SALIR","DOMINGO","FECHA","GATO","HOOT","JULIO","KOALA","LUZ","ZOMBIE"};
float opacidad=254.0; // 1 es lo minimo 255 minimo
PFont font;
float size = 0; // tamaño de fuente
int pos1 []= new int [20];
int pos12 []= new int [20];
int dir =1;

void setup()
{
  size(900,500);
  font = loadFont("letra.vlw");  
  pos(); 
}

void draw()
{
  background(#129F10);
  opacidad += 8.6 * dir;
   for(int i =0; i<20; i++)
   {  
    size +=0.02;  // se va aumentado el tamaño de letra
    textFont(font,30);
    pushMatrix(); // guardamos todo el contenido
    fill(0,opacidad);
    translate(pos1[i],pos12[i]);
    float tam=(cos(size/4.0) + 1.2) * 2.0;
    scale(tam);
    text(palabrass[i],0,0);
    popMatrix(); 
   }
    if (opacidad <0 || opacidad >255)
    dir=-dir;
}

public void pos() // coordenadas
{
for (int i=0;i<20;i++)
  {
  pos1 [i]=(int)random(10, 900);
  pos12 [i]=(int)random(10, 500);
  }
}
