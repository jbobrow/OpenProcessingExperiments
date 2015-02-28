
//CLASE 29-08-12
//JORGE SALGADO MENDOZA

//VARIABLES
int alto = 300, ancho = 400;
void setup()
{
  noFill();    //Sin relleno para las figuras
  smooth();    //Refina el dibujo
  size(400,300);    //Tamaño
  strokeWeight(5);  //Ancho de las lineas
  frameRate(1);  //Numeros de cuadros por segundo
}
void draw()
{
  //varibles locales
  int r1,x,r2,c,cc,ccc,inicial=30,i;
  float y,m;
  //Color
  background(0);
  c = (int)random(0,255);
  cc = (int)random(0,255);
  ccc = (int)random(0,255);
  stroke(c,cc,ccc);
  //Cabello
  for(i=0;i<((ancho+alto)/100)*2;i++)
  {
    r1 = (int)random(-inicial,inicial);
    r2 = (int)random(-inicial,inicial);
    m= (alto/2)-inicial;
    m= m/(inicial-ancho/2);
    x = (int)random(inicial,ancho/2);
    y= ((x-(ancho/2))*m)+inicial;
    bezier(x,y,x+r1,y+r1,0+r2,y+r2,0,y);
  }
  //rana
  beginShape();  //points lines
    vertex((ancho)/2,inicial);
    vertex(inicial,alto/2);
    vertex(inicial+50,alto-100);
    vertex(inicial,alto);
  endShape();
  beginShape();  
    vertex((ancho)/2,inicial);
    vertex(ancho-inicial,alto/2);
    vertex(ancho/2,alto/2);
    vertex((ancho/2)+(ancho/4),(alto/2)+(alto/4));
    vertex((ancho/2)-(ancho/4),(alto/2)+(alto/4)+inicial);    
    vertex(ancho/2,alto);
  endShape();
  arc(ancho/3,alto/3,alto/5, alto/5, 0, TWO_PI);  
}

