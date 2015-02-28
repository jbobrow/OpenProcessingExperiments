
//PERSONAJE ANIMADO CON MOVIMIENTO, EN FUNCIÓN DEL QUE REALIZA EL MOUSE

void setup(){
  size(600,600);
}

//

void draw(){
  
  background(152,198,143,200); //FONDO
  strokeWeight(1); //LÍNEAS - HIERBA
  stroke(7,144,68);
line(0,580,250,580);  //1 
    line(250,580,260,570);
    line(260,570,270,580);
    line(270,580,599,580);
line(0,560,110,560);  //2 
    line(110,560,120,550);
    line(120,550,130,560);
    line(130,560,599,560);
line(0,540,599,540);  //3 
line(0,520,470,520);  //4 
    line(470,520,480,510);
    line(480,510,490,520);
    line(490,520,599,520);
 line(0,500,370,500);  //5
    line(370,500,380,490);
    line(380,490,390,500);
    line(390,500,599,500);
  line(0,480,200,480);  //6
    line(200,480,210,470);
    line(210,470,220,480);
    line(220,480,599,480);
  line(0,460,599,460);//7
  line(0,440,400,440);//8
    line(400,440,410,430);
    line(410,430,420,440);
    line(420,440,599,440);
    
//YA QUE EL LOS ELEMENTOS "CARA", "CUERPO", "COLA", "OREJAS EXTERIORES",
//"PATAS", Y "PIES", SON DEL MISMO COLOR, Y SON LA BASE DE NUESTRO MUÑECO,
//DEFINIREMOS EL COLOR EN UN PRINCIPIO PARA QUE SIRVA PARA TODOS ELLOS
    
//COLOR MARRON, SIN LINEA DE CONTORNO, Y UN POCO DE TRANSPARENCIA PARA DIFERENCIAR
//LAS PARTES

 fill(183,121,55,200); 
 strokeWeight(0);
 stroke(183,121,55,200); 
 
//CARA
  rect (mouseX-25,mouseY-30,50,60); 
  
//CUERPO
  rect(mouseX-35,mouseY+40,70,150);

//PATA IZQ
  rect(mouseX-20,mouseY+40,15,160);
  
//PATA DCHA
  rect(mouseX+5,mouseY+40,15,160);
  
//PIE IZQ  
  rect(mouseX-45,mouseY+175,40,20);
  
//PIE DRCHO
  rect(mouseX+5,mouseY+175,40,20);
  
//OREJA DRCHA EXT
  triangle(mouseX-25,mouseY-30,mouseX-15,mouseY-50,mouseX-5,mouseY-30);
  
//OREJA IZQ EXT
  triangle(mouseX+5,mouseY-30,mouseX+15,mouseY-50,mouseX+25,mouseY-30);
  
//PARA LA "COLA" EL COLOR ES EL MISMO, PERO VA EN FUNCIÓN DEL GROSOR DE LINEA
//EL CUAL HAY QUE DEFINIR Y POR TANTO DEFINIR COLOR DE LÍNEA.
  
//COLA  
  beginShape(); 
  noFill();
  strokeWeight(10);
  stroke(183,121,55,200);
  curveVertex(mouseX-30,mouseY+125);
  curveVertex(mouseX-30,mouseY+125);
  curveVertex(mouseX-70,mouseY+70);
  curveVertex(mouseX-75,mouseY+10);
  curveVertex(mouseX-75,mouseY+10);
  endShape();

//MOVIMIENTO COLA (LINEAS BÁSICAS NEGRAS)
strokeWeight(1); 
stroke(0);
line(mouseX-85,mouseY+10,mouseX-85,mouseY+15);
line(mouseX-90,mouseY+8,mouseX-90,mouseY+17);
line(mouseX-65,mouseY+10,mouseX-65,mouseY+15);
line(mouseX-60,mouseY+8,mouseX-60,mouseY+17);
  
  
//PARA EL MORRO ES VÁLIDO EL MISMO GROSOR DE LÍNEA QUE LAS LÍNEAS DE MOVIMIENTO DE LA 
//COLA PERO MODIFICAREMOS EL COLOR, QUE SERÁ EL MISMO QUE SE UTILIZARÁ PARA LOS OJOS,
//LA NARIZ, Y LAS MANCHITAS.

//LÍNEA MORRO
stroke(52,34,15);
line(mouseX,mouseY,mouseX,mouseY+15); 

//DEFINIMOS DE NUEVO UN GROSOR DE LÍNEA DE 0, PARA LA NARIZ, OJOS Y MANCHITAS, 
//ELEMENTOS CUYO COLOR ES EL MISMO QUE LA LÍNEA DEL MORRO

strokeWeight(0); 
fill(52,34,15);

//OJO IZQ  
 ellipse(mouseX-10,mouseY-15,3,3);
  
//OJO DCHO
  ellipse(mouseX+10,mouseY-15,3,3);
  
//NARIZ
  ellipse (mouseX,mouseY,15,10); 
  
//MANCHITAS  
  rect(mouseX-35,mouseY+60,10,10);
  rect(mouseX-35,mouseY+125,10,5);
  rect(mouseX+25,mouseY+110,10,10);
  
  
//DEFINIMOS EL COLOR QUE SERVIRÁ DE RELLENO DE LAS OREJAS INTERIORES
 fill(247,212,231); 
  
//OREJA DCHA INT
  triangle(mouseX-20,mouseY-30,mouseX-15,mouseY-40,mouseX-10,mouseY-30);
  
//OREJA IZQ INT
  triangle(mouseX+10,mouseY-30,mouseX+15,mouseY-40,mouseX+20,mouseY-30);


//COLLAR, NUEVO COLOR APARTE
  fill(76,175,198); 
  rect(mouseX-25,mouseY+30,50,10);
  
//COLGANTE, NUEVO COLOR APARTE
  fill(245,235,30);
  quad(mouseX-5,mouseY+45,mouseX,mouseY+35,mouseX+5,mouseY+45,mouseX,mouseY+55);

  
//PARA EL TEXTO NO ES NECESARIO DEFINIR DE NUEVO UN GROSOR Y COLOR DE LÍNEA,
//SI NO QUE ES UN "RELLENO"
  fill(7,144,68);
  text("SCOOBY DOO",mouseX,mouseY+230); 
  textSize(12);
  textAlign(CENTER);

}



