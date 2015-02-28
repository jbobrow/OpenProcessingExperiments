
int y = 0;
int x= 0;
void setup() {
  size(400,300);//x,y
  background(#ffffff); //colorear el fondo
  // (x,y) esquina superior izquierda
  
}

void draw() {
  background(#ffffff);
  fill(#0000ff);  //colorear el punto
  point(100,200); //dibuixem punt
  line (200 ,150 , x, y); //(xi ,yi ,xf , yf)
  y = y + 1;
  x = x * 3;
}


