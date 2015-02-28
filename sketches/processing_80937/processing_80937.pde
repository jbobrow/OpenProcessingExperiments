
int i=65,j=97;
PFont tipo1,tipo2;
float ancho=0,aux=0,aux1=0,ancho1=0;
void setup()
{
  size(800,400);
  background(0);
}

void draw()
{
  
  frameRate(2);
  String[] fontList = PFont.list();
  println(fontList);

  tipo1=createFont("Arial",30);
  textFont(tipo1);
  

    
    text(char(i),aux,110);
    ancho=textWidth(char(i));
    aux=ancho+aux;
    i++;
    tipo2=createFont("Segoe Script",30);
    textFont(tipo2);
    text(char(j),aux1,200);
    ancho1=textWidth(char(j));
     aux1=ancho1+aux1;
    j++;
   
  if(i==91&&j==123)
  {
    noLoop();
  }

}

