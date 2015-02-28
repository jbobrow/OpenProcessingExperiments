
void setup(){
size(500, 500);
noStroke();
background(0);
}

//posiciones iniciales de los cuadrados  

int x1 = 0;
int y1 = 0;

int x2 = 0;
int y2 = 450;

int x3 = 450;
int y3 = 450;
 
int x4 = 450;
int y4 = 0;

void draw(){

fill(0,10); //fondo transparente del tamaño de la ventana
rect(0, 0, width, height);

stroke(0, 255, 0);// verde
line(width, 50, x1+25, y1+25); // uno de los extremos sigue el movimiento del cuadrado
line(width, 100, x1+25, y1+25);
line(width, 150, x1+25, y1+25);
line(width, 200, x1+25, y1+25);
fill(0, 255, 0);
rect(x1, y1, 50, 50);

stroke(255, 0, 255);// magenta
line(50, 0, x2+25, y2+25);
line(100, 0, x2+25, y2+25);
line(150, 0, x2+25, y2+25);
line(200, 0, x2+25, y2+25);
fill(255, 0, 255);
rect(x2, y2, 50, 50);

stroke(0, 0, 255);// azul
line(0, 450, x3+25, y3+25);
line(0, 400,x3+25, y3+25);
line(0, 350, x3+25, y3+25);
line(0, 300, x3+25, y3+25);
fill(0, 0, 255);
rect(x3, y3, 50, 50);

stroke(255, 255, 0); // amarillo
line(450, height, x4+25, y4+25);
line(400, height,x4+25, y4+25);
line(350, height, x4+25, y4+25);
line(300, height, x4+25, y4+25);
fill(255, 255, 0);
rect(x4, y4, 50, 50);

//para mover los cuadros
if(mousePressed == true && mouseX >= x1-50 && mouseX <= x1+50 && mouseY <= y1+50 && mouseY >= y1-50){
// para que solo se muevan cuando hacen click en el cuadrado
  x1= mouseX-25;
  y1 = mouseY-25;
  //en caso de que se superpongan mas 2 un cuadrado, que solo mueva 1
  if(x1 == x2 && y1 == y2){x2=0; y2=450;};
  if(x1 == x3 && y1 == y3){x3=450; y3=450;};
  if(x1 == x4 && y1 == y4){x4=450; y4=0;};
};
if(mousePressed == true && mouseX >= x2-50 && mouseX <= x2+50 && mouseY <= y2+50 && mouseY >= y2-50){
  x2= mouseX-25;
  y2 = mouseY-25;
  if(x2 == x1 && y2 == y1){x1=0; y1=0;};
  if(x2 == x3 && y2 == y3){x3=450; y3=450;};
  if(x1 == x4 && y2 == y4){x4=450; y4=0;};
};
if(mousePressed == true && mouseX >= x3-50 && mouseX <= x3+50 && mouseY <= y3+50 && mouseY >= y3-50){
  x3= mouseX-25;
  y3 = mouseY-25;
  if(x3 == x2 && y3 == y2){x2=0; y2=450;};
  if(x3 == x1 && y3 == y1){x1=0; y1=0;};
  if(x3 == x4 && y3 == y4){x4=450; y4=0;};
};
if(mousePressed == true && mouseX >= x4-50 && mouseX <= x4+50 && mouseY <= y4+50 && mouseY >= y4-50){
  x4= mouseX-25;
  y4 = mouseY-25;
  if(x4 == x2 && y4 == y2){x2=0; y2=450;};
  if(x4 == x3 && y4 == y3){x3=450; y3=450;};
  if(x4 == x1 && y4 == y1){x1=0; y1=0;};  
};
}




