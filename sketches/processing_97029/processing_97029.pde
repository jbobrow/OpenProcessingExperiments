
int posX, posY, velX, velY;
int mida = 30;

void setup(){
  size(500,550);
  posX = width/2;
  posY = height/2;
  velX = 4;
  velY = 4;
  posY= height/3;
  
}

void draw(){
  background(255);
  
//rectangulosuperior
fill(200);
rect(0,0,500,25);

//linea rebote stop
fill(44);
rect(0,290,500,2);

//recangulo play
fill(85,81,90,255);
rect(0,27,500,30);
//letras
fill(10);
createFont("Arial",16,true);
text("File",10,17);
text("Edit",40,17);
text("Sketch",70,17);
text("Tools",115,17);
text("help",155,17);
//comandos rectangulo play
fill(227,172,21);
strokeWeight(0);
ellipse(20,42,20,20);
//comandos triangulo play
fill(85,81,90);
triangle(18,37,18,47,24,42);
//rectangulo p1final exterior
fill(140,140,140);
rect(0,57,500,35);
//rectangulo p1final interior
fill(175,175,175);
rect(5,63,70,28);
fill(10);
text("p1final",20,80);
//comandos zona blanca
fill(10);
createFont("Arial",16,true);
text("size(500,500);",10,110);
text("background(255);",10,130);
fill(160,160,160);
text("//rectangulosuperior",10,150);
fill(1);
text("rect(0,0,500,25);",10,170);
text("fill(85,81,90,255);",10,190);
fill(160,160,160);
text("//recangulo play",10,210);
fill(1);
text("rect(0,27,500,30);",10,230);
fill(160,160,160);
text("//letras",10,250);
fill(1);
text("fill(10);",10,270);
text("createFont(Arial,16,true);",10,290);
//rectangulo flechas horizontal
fill(230,230,230);
rect(0,430,500,20);
fill(85,81,90);
triangle(10,440,20,435,20,444);
fill(85,81,90);
triangle(480,440,470,435,470,444);
//rectangulo flechas vertical
fill(230,230,230);
rect(480,92,20,339);
fill(85,81,90);
triangle(495,420,485,420,490,430);
fill(85,81,90);
triangle(495,105,485,105,490,95);
//rectangulo inferior flechas orizontales
fill(140,140,140);
rect(0,450,500,30);
//rectangulo negro inferior
fill(0,0,0);
rect(0,480,480,50);
//rectangulo  inferior
fill(50,50,50);
rect(0,530,500,30);
fill(230,230,230);
rect(480,480,20,50);
//flechas verticales pequeño
fill(85,81,90);
triangle(495,490,485,490,490,480);
fill(85,81,90);
triangle(495,520,485,520,490,530);
fill(200,200,200);
rect(480,500,20,10);
//rectangulo java
fill(85,81,90,255);
stroke(180,180,180);
strokeWeight (2);
rect(450,34,35,18);
fill(160,160,160);
text("JAVA",454,48);
//rectangulos superiores
stroke(1);
strokeWeight(0);
rect(70,32,20,20);
rect(100,32,20,20);
rect(130,32,20,20);
rect(160,32,20,20);
fill(85,81,90);
triangle(170,37,170,47,175,42);
rect(165,40,8,4);
triangle(135,40,145,40,140,45);
rect(138,35,5,8);
triangle(105,40,115,40,110,35);
rect(108,38,5,8);
line(75,34,75,50);
line(75,34,82,34);
line(75,50,85,50);
line(85,50,85,40);
line(85,40,82,34);
//rectangulo debajo java
fill(160,160,160);
rect(465,65,20,20);
fill(85,81,90);
rect(470,73,8,4);
triangle(474,70,474,80,482,75);

  
//actualizar posiciones
posX = posX+velX;
posY = posY+velY;

  
//dibujar stop
fill(mouseX,mouseY,1);
ellipse(posX,posY,mida,mida);
fill(85,81,90);
rect(posX-4,posY-3,8,8);

//dibujar barra rectangular

fill(200,200,200);
rect(480,111+posY,20,85);
fill(85,81,90);
rect(485,145+posY,10,3);
rect(485,150+posY,10,3);
rect(485,155+posY,10,3);
  
//comprobar la posicion X
if((posX<0)||(posX>width)){
velX = -velX;
  } 
//comprobar la posicion Y
if((posY<0)||(posY>(height/2))){
velY = -velY;
  } 



  
  
}


