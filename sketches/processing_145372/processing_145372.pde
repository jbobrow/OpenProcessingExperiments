
//PERSONAJE ANIMADO QUE SE MUEVE REBOTANDO EN LOS BORDES LATERALES (DCHA - IZQ)
//Y EN LOS BORDES SUPERIOR E INFERIOR. ADEMAS CON LA FUNCION DE MOUSEPRESSED EL
//COLOR DEL FONDO VARIA Y SE REDIRECCIONA EL PERSONAJE.Y POR OTRO LADO LAS LETRAS
//VARÍAN EL COLOR EN FUNCIÓN DE LA POSICIÓN QUE ADQUIERE EL PERSONAJE.
float posX, posY, velX, velY;
int sx=20;
color colorback; //DEFINIMOS COLOR PARA PODER EJECUTARLO MAS TARDE EN MOUSEPRESSED

void setup(){
  posX = width/2;
  posY = height/2;
  velX = random(1,2);
  velY = random(1,2);
  size(600,600);
  colorback=0; //DEFINIMOS COMO COLOR INICIAL EL NEGRO = 0
}

//

void draw(){
  
  background(colorback); //COLOR INICIAL
  
//ACTUALIZAMOS POSICIONES
  posX=posX+velX;
  posY=posY+velY;
    
//YA QUE EL LOS ELEMENTOS "CARA", "CUERPO", "COLA", "OREJAS EXTERIORES",
//"PATAS", Y "PIES", SON DEL MISMO COLOR, Y SON LA BASE DE NUESTRO MUÑECO,
//DEFINIREMOS EL COLOR EN UN PRINCIPIO PARA QUE SIRVA PARA TODOS ELLOS
    
//COLOR MARRON, SIN LINEA DE CONTORNO, Y UN POCO DE TRANSPARENCIA PARA DIFERENCIAR
//LAS PARTES

 fill(183,121,55,200); 
 strokeWeight(0);
 stroke(183,121,55,200); 
 
//CARA
  rect (posX-25,posY-30,50,60); 

//CUERPO
  rect(posX-35,posY+40,70,150);

//PATA IZQ
  rect(posX-20,posY+40,15,160);
  
//PATA DCHA
  rect(posX+5,posY+40,15,160);
  
//PIE IZQ  
  rect(posX-45,posY+175,40,20);
  
//PIE DRCHO
  rect(posX+5,posY+175,40,20);
  
//OREJA DRCHA EXT
  triangle(posX-25,posY-30,posX-15,posY-50,posX-5,posY-30);
  
//OREJA IZQ EXT
  triangle(posX+5,posY-30,posX+15,posY-50,posX+25,posY-30);


//PARA EL MORRO ES VÁLIDO EL MISMO GROSOR DE LÍNEA QUE LAS LÍNEAS DE MOVIMIENTO DE LA 
//COLA PERO MODIFICAREMOS EL COLOR, QUE SERÁ EL MISMO QUE SE UTILIZARÁ PARA LOS OJOS,
//LA NARIZ, Y LAS MANCHITAS.

//LÍNEA MORRO
stroke(52,34,15);
line(posX,posY,posX,posY+15); 

//DEFINIMOS DE NUEVO UN GROSOR DE LÍNEA DE 0, PARA LA NARIZ, OJOS Y MANCHITAS, 
//ELEMENTOS CUYO COLOR ES EL MISMO QUE LA LÍNEA DEL MORRO

strokeWeight(0); 
fill(52,34,15);

//OJO IZQ  
 ellipse(posX-10,posY-15,3,3);
  
//OJO DCHO
  ellipse(posX+10,posY-15,3,3);
  
//NARIZ
  ellipse (posX,posY,15,10); 
  
//MANCHITAS  
  rect(posX-35,posY+60,10,10);
  rect(posX-35,posY+125,10,5);
  rect(posX+25,posY+110,10,10);
  
  
//DEFINIMOS EL COLOR QUE SERVIRÁ DE RELLENO DE LAS OREJAS INTERIORES
 fill(247,212,231); 
  
//OREJA DCHA INT
  triangle(posX-20,posY-30,posX-15,posY-40,posX-10,posY-30);
  
//OREJA IZQ INT
  triangle(posX+10,posY-30,posX+15,posY-40,posX+20,posY-30);


//COLLAR, NUEVO COLOR APARTE
  fill(76,175,198); 
  rect(posX-25,posY+30,50,10);
  
//COLGANTE, NUEVO COLOR APARTE
  fill(245,235,30);
  quad(posX-5,posY+45,posX,posY+35,posX+5,posY+45,posX,posY+55);
  
//PARA EL TEXTO NO ES NECESARIO DEFINIR DE NUEVO UN GROSOR Y COLOR DE LÍNEA,
//SI NO QUE ES UN "RELLENO", Y A LA VEZ HAREMOS QUE CAMBIE DE COLOR SEGUN
//LA POSICION X Y LA POSICION Y DEL MUÑECO.
  fill(posX-100,100,posY-200);
  text("SCOOBY DOO",posX,posY+230); 
  textSize(12);
  textAlign(CENTER);
  
  
  //COMPROBAMOS POS CARA X, DELIMITANDO LA POSICION X.
  if((posX-45<0)||(posX+45>width)){
    velX=-velX;
  }
  //COMPROBAMOS POS CARA Y, DELIMITANDO LA POSICION Y.
  if((posY-50<0)||(posY+230>height)){
    velY=-velY;
  }
}

//ESTABLECEMOS QUE CUANDO SE CLICKEE EN CUALQUIER PUNTO DE LA PANTALLA
//SE SIGA MOVIENDO REESTABLECIENDO SU TRAYECTORIA Y A LA VEZ QUE VARÍE EL 
//COLOR DEL FONDO.
  void mousePressed(){
    posX=mouseX;
    posY=mouseY;
    velX=random(1,2);
    velY=random(1,2);
    colorback= color(mouseX,200,mouseY);
  }



