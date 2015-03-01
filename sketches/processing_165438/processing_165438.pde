
int i =0;

void setup (){
  size (300,300);
}

void draw (){
  background(255);
  int x=50;
  int ancho = width - 5*x;
  int y = x;
  int alto = height - 2*y;
  cuadrados(5+i,height/2-10,20,20,0);
  
  cuadrados(x,y,ancho,alto,128);
  
  cuadrados(width - x - ancho,y,ancho,alto,128);
  i = i +1;
  if (i==300)
    i=0;
}

void cuadrados(int x,int y,int a,int h, int c){
  fill(c);
  rect(x,y,a,h);
}


