
int y = 100;
int x = 200;
int a = 350;
int b = 350;

void setup(){
    //definim les dimensions del sketch
    size(500,400);

}

void draw(){
  //definim el color del fons
  background(#ffffff);  
  //definir el color del punt
  fill(#0000FF);
  //dibuiexem un punt
  point(100,200);
  line(a, b, x, y);
  y = y + 1;
  x = x + 3;
  a = a - 1;
  b = b - 3;
}


