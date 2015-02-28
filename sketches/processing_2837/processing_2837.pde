
int esp = 27; // espaciador

void setup(){
  size ( 800, 800);
}

void draw(){
  background(13,1,26);
  for (int y = 0; y < height; y += esp){
    for (int x = 0; x < width; x += esp){
       float d;
      d = dist(mouseX, mouseY, x, y)/50; //diatncia al mouse
  stroke(136,188,222);
     ave(x,y);
      cuadrado(x,y);
    }
  }
}

void ave (int _x, int _y){
  fill(50);
stroke(8,30,85);
float d = dist(mouseX, mouseY, _x, _y); // calcula la distancia
pushMatrix();{
  translate(_x,_y);
rotate(d * millis()*0.000001); //velocidad

 beginShape();
vertex(44, 252);
vertex(81, 212);
vertex(109, 226);
vertex(131, 205);
vertex(164, 231);
vertex(135, 222);
vertex(115, 239);
vertex(82, 228);
vertex(46, 254);  //aves
endShape(CLOSE);

popMatrix();}
}

void cuadrado (int _x, int _y){
float d = dist(mouseX, mouseY, _x, _y); 
pushMatrix();{
  translate(_x,_y);
rotate(d * millis()*0.000001); //millis:milisgdos. transcurridos desde que empieza programa
stroke(162,5,162);
fill(30);
rect(_x,_y,3,4);
stroke(12,132,155);
fill(70);
rect(_x,_y,5,7);
stroke(69,227,212);
fill(80);
rect(_y,_x,0.003,0.004);}
popMatrix();
}

