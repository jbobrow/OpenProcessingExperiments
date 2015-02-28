
float x = 0;
float y = 0;
float tamany = 0;
int color0 = 40;
int color1 = 255;
int pintar = 50;

void setup(){
  size(600,400);
  background(210);
  fill (239,240,111);
  quad (20,50,575,50,575,300,20,300);
  fill (0); 
  text ("Opciones:", 30, 60, 60, 50);
  text ("1.- Pulsa '1' para empezar a poner redondas aleatoriamente", 40, 90, 550, 50);
  text ("2.- Pulsa '2' para empezar a poner cuadrados aleatoriamente", 40, 110, 550, 150);
  text ("3.- Pulsa '3' para empezar a poner redondas con la gama de colores rojo", 40, 130, 550, 150);
  text ("4.- Pulsa '4' para empezar a poner redondas con la gama de colores azul", 40, 150, 550, 150);
  text ("5.- Pulsa '5' para empezar a poner redondas con la gama de colores verde", 40, 170, 550, 150); 
  text ("6.- Pulsa boton izquierdo del mouse para dibujar en la pantalla",40, 190, 550, 150);
  text ("7.- Pulsa boton derecho del mouse para dibujar dos redondas a la vez en la pantalla",40, 210, 550, 150);
  text ("8.- Pulsa boton '+' o '-' para cambiar tamaño de las redondas dibujadas",40, 230, 550, 150);
  text ("9.- Pulsa cualquier boton para parar movimientos",40, 250, 550, 150);
  text ("10.- Pulsa 'SPACE' para limpiar la pantalla", 40, 270, 550, 150);
  
}

void draw(){
  
  x = random(800);
  y = random(600);
  tamany = random(15,50);
  
  
  if (key =='1'){
    fill (int(random(20,180)),int(random(20,180)),int(random(20,180)));
    ellipse(x,y,tamany,tamany);
  }
  
  if (key =='2'){
    fill (int(random(color0 + 130,color1)),int(random(color0 + 130,color1)),int(random(color0 + 130,color1)));
    rect(x,y,tamany,tamany);
  }
  
  if (key == '3') {
    x = random(800);
    y = random(550);
    tamany = random(10,40);  
    fill (int(random(color0,color1)),int(random(color0)),int(random(color0)));
    ellipse(x,y,tamany,tamany);
  }
  if (key == '4') {
    x = random(800);
    y = random(550);
    tamany = random(10,40); 
    fill (int(random(color0)),int(random(color0,color1)),int(random(color0)));
    ellipse(x,y,tamany,tamany);
  }  
  if (key == '5') {
    x = random(800);
    y = random(550);
    tamany = random(10,40); 
    fill (int(random(color0)),int(random(color0)),int(random(color0 + 30,color1)));
    ellipse(x,y,tamany,tamany);
  }
  
  if(mousePressed){
    fill (random(30,220),random(30,220),random(30,220));
    ellipse(mouseX,mouseY,pintar,pintar);
  }
  if(keyPressed && key =='+'){
    pintar=pintar+1;    
    }
  if(keyPressed && key =='-'){
    pintar=pintar-1;
   }
  if(pintar==0){
    pintar=1;
  }
  
  if(mousePressed && mouseButton == RIGHT){
    fill (random(30,220),random(30,220),random(30,220));
    ellipse(mouseX,mouseY,pintar,pintar);
    ellipse(mouseY,mouseX,pintar,pintar);
  }
  if(keyPressed && key =='+'){
    pintar=pintar+1;    
    }
  if(keyPressed && key =='-'){
    pintar=pintar-1;
   }
  if(pintar==0){
    pintar=1;
  }
  
}

void keyPressed (){
  
  if (key == ' '){
  background(255);
  fill (239,240,111);
  quad (20,50,575,50,575,300,20,300);
  fill (0); 
  text ("Opciones:", 30, 60, 60, 50);
  text ("1.- Pulsa '1' para empezar a poner redondas aleatoriamente", 40, 90, 550, 50);
  text ("2.- Pulsa '2' para empezar a poner cuadrados aleatoriamente", 40, 110, 550, 150);
  text ("3.- Pulsa '3' para empezar a poner redondas con la gama de colores rojo", 40, 130, 550, 150);
  text ("4.- Pulsa '4' para empezar a poner redondas con la gama de colores azul", 40, 150, 550, 150);
  text ("5.- Pulsa '5' para empezar a poner redondas con la gama de colores verde", 40, 170, 550, 150); 
  text ("6.- Pulsa boton izquierdo del mouse para dibujar en la pantalla",40, 190, 550, 150);
  text ("7.- Pulsa boton derecho del mouse para dibujar dos redondas a la vez en la pantalla",40, 210, 550, 150);
  text ("8.- Pulsa boton '+' o '-' para cambiar tamaño de las redondas dibujadas",40, 230, 550, 150);
  text ("9.- Pulsa cualquier boton para parar movimientos",40, 250, 550, 150);
  text ("10.- Pulsa 'SPACE' para limpiar la pantalla", 40, 270, 550, 150);
  }
  
}


