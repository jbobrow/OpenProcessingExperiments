
void setup()
{
   size(300, 300); background(255); smooth();
   llena();
   textFont(loadFont("fuente.vlw"));
}

int[] lista = new int[9];
int[][] mosaico = new int[3][3];
int numero;
int indice;
void llena()
{
  
  {
  for(int i = 0; i < 9; i++)
  {
    boolean unico = false;
    while(!unico)
    {
       numero = int(random(9));
       unico = true;
       for(int a= 0; a < i; a++)
    {
      if(numero == lista[a]) unico = false;
    } 
  }
  lista[i] = numero; 
  } 
  indice = 0;
    for(int y = 0; y < 3; y++)
  { 
    for(int x = 0; x <3; x++)
    {
     mosaico[y][x] = lista[indice];
     indice++;
   
    }
  }
  }  
}
int equis = 0;
int ye = 0;
int movimientos = 0;
void draw()
{
 background(255);
 equis = 0;
 ye = 0;
 stroke(130);
 for(int y = 0; y < 3; y++)
 {
   for(int x = 0; x < 3; x++)
   {
     if(mosaico[y][x] == 0)
     {
       fill(60);
     } else{
       
        fill(255);
     }
     rect (equis, ye, 100, 100);
     fill(0);
    if (mosaico[y][x] != 0)
   {
      text(mosaico[y][x], equis+50, ye+50);
   }
     equis += 100;
   }
   
   equis = 0;
   ye += 100;
  
 }
  
}

void mouseClicked()
{
  if(!gana)
  {
     movimientos ++;
     print("movimientos" +movimientos+" ");
     juega();
     
  }
}

int indiceX;
int indiceY;

void juega()
{
  if(mouseX > 0 && mouseX < 100) indiceX = 0;
  if(mouseX > 100 && mouseX < 200) indiceX = 1;
  if(mouseX > 200 && mouseX < 300) indiceX = 2;
  
  if(mouseY > 0 && mouseY < 100) indiceY = 0;
  if(mouseY > 100 && mouseY < 200) indiceY = 1;
  if(mouseY > 200 && mouseY < 300) indiceY = 2;
  
  if(indiceY-1 >= 0)
  {
    if(mosaico[indiceY-1][indiceX]==0)
   {
     mosaico[indiceY-1][indiceX] = mosaico[indiceY][indiceX];
     mosaico[indiceY][indiceX] = 0;
     println("lo tengo arriba");
   }
  }
  
    if(indiceY+1 < 3)
  {
    if(mosaico[indiceY+1][indiceX]==0) 
    {
      mosaico[indiceY+1][indiceX] = mosaico[indiceY][indiceX];
      mosaico[indiceY][indiceX] = 0;
      println("lo tengo abajo");
    }
  }
  
    if(indiceX-1 >= 0)
  {
    if(mosaico[indiceY][indiceX-1]==0) 
    {
      mosaico[indiceY][indiceX-1] = mosaico[indiceY][indiceX];
      mosaico[indiceY][indiceX] = 0;
      println("lo tengo izq");
    }
  }
    if(indiceX+1 < 3)
  {
    if(mosaico[indiceY][indiceX+1]==0) 
    {
      mosaico[indiceY][indiceX+1] = mosaico[indiceY][indiceX];
      mosaico[indiceY][indiceX] = 0;
      println("lo tengo derecha");
    }
  }
  
 comprueba();
  
}

boolean gana = false;
void comprueba()
{
  int cuenta = 1;
  gana = true;
  for(int a = 0; a < 3; a++)
  {
    for(int b = 0; b < 3; b++)
    {
      if(mosaico [a][b] != cuenta) gana = false;
      if(cuenta == 8)
      { cuenta = 0;
      }else{
      cuenta ++;
      }
    }
  }
  if(gana)println("¡¡¡GANASTE PERRO!!! " + "  Movimientos: " + movimientos);
}

