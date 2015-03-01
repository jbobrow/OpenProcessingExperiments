
float tercio;
float y;
int i;
i = 0;

  
void setup() {
  size(300,250);
  background(50);
  colorMode(HSB, 360, 100, 100);
}
void draw()
 { 
// dibujar dinamicamente

//definir tercio de la pantalla
tercio = width/3;
y = height/2;

 

  if(mouseX <= tercio){ // 1ro verifica SI la coordenada X del puntero es menor a 1/3 de la longuitud del canvas
  background(0,100,70); // si la condicion es CIERTA, pinta el fondo de rojo
  }
  else if (mouseX <= tercio*2){background(240,100,70); // como la condicion fue falsa, pinta el fondo de azul
  } 
  else {background(120,100,70);} // pinta el fondo de verde

// Guia del slider, sobre este eje horizontal se mueven las figuras
strokeWeight(1);
stroke(0,0,100);
line(0,height/2,width,height/2);

noStroke();
fill(0,0,100);
rectMode(CENTER); 
if(mouseX <= tercio){// 2do verifica SI la coordenada X del puntero es menor a un tercio de la longitud canvas
  ellipse(mouseX,y,20,20);// de ser cierto dibuja un elipse donde se ubique el puntero de 20px por 20px
}else if (mouseX <= tercio*2) {//SI NO es cierto verifica SI es menor al dos tercios
  rect(mouseX,y,20,20);// de ser cierto dibuja un rectangulo donde este el puntero de 20px por 20px
  } else { //si tiene otro valor (que en este caso por descarte es un numero mayor 2/3 del canvas)
  quad(mouseX,y+10, mouseX+10, y-10,mouseX-10, y-10); // dibuja un triangulo
  }//cierre dela segunda peticion

// Tick marks
strokeWeight(1);
stroke(0,170);
line(tercio,(height/2) -6,tercio, (height/2) + 6);
line(tercio*2, (height/2) - 6, tercio*2, (height/2) + 6);

noStroke()
fill(0,0,40);
rect(width/2, height-20, width-2, 38);

float lineaX = 0;
for (float dondeVaElMouse = 0; dondeVaElMouse == mouseX; lineaX+=10) {
line(lineaX,0, lineaX,height);
}

// Boton 1
if (mousePressed && mouseX > tercio-20 && mouseX < tercio +20 && mouseY >height-30 && mouseY < height -10) {
fill(0,0,80);
strokeWeight(3);
stroke(0,0,60);
rect(tercio,height-20,40,18);
fill(0,100);
noStroke();
rect(width/2,(height/2)-20,width-10,height-50);
 }
 else {
fill(0,0,100);
strokeWeight(4);
stroke(0,0,70);
rect(tercio,height-20,40,18);
}
// Boton 2
//strokeWeight(4);
//stroke(0,0,70);
//rect(tercio * 2,height-20,40,18);

// Estas lineas me ayudaron para ubicar la zona clikleable del boton
//strokeWeight(1);
//stroke(0,50);
//line(0,height-30,width,height-30);
//line(0,height-10,width,height-10);
// ellipse
fill(200, 80, 80);
noStroke();
ellipse(i-20,height/4 ,20,20);
i ++;

 
 }
