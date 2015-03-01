
color bgcolor = color(110,226,255); //Color de fondo por defecto
int cloudsNum = 12; //Numero de nubes para mostrar
float cloudsPosX[] = new float[cloudsNum]; //Array para la posición X de la nube
float cloudsPosY[] = new float[cloudsNum]; //Array para la posición Y de la nuve
float planePosY = 0.0; //Posición Y del avión (Para noise)
float planeFinalY = 0.0; //Posición final Y del avión
float planeFinalX = 190.0; //Posición final X del avión
boolean rain = false; //Boolean Trigger (Lluvia)
int CloudsFill = 255; //Fondo de las nubes por defecto
color windowsFill = color(220,241,255); //Color de las ventanas por defecto
int j = 0; //Variable de control para bucle

void setup(){
  
  //Hacemos la medida de 1000x600px
   size(1000,600);
   
   //Creamos un bucle para posicionar las nubes através de arrays
   while(j < cloudsNum){
    
     //Comprobamos si el numero es menor a 6 reniciar la X a 0. (Fila inferior);
     if(j >= cloudsNum/2){
       cloudsPosX[j] = ((j-cloudsNum/2)*200);
     }else{
       cloudsPosX[j] = (j*200);  
     }
     
     //A partir de la división del 4 determinamos la altura de cada nube
     if(j % 4 == 0){
       cloudsPosY[j] = 50;
     }else if(j % 4 == 1){
       cloudsPosY[j] = 190;   
     }else if(j % 4 == 2){
       cloudsPosY[j] = 320;   
     }else if(j % 4 == 3){  
       cloudsPosY[j] = 430; 
     }
     
     j++; //Aumentamos el contador;
     
   }
  
   
}

void draw(){
  
  //Comprobamos si se ha ejecutado la lluvia y cambiamos los valores por defecto.
  if(rain){
    CloudsFill = 40;
    bgcolor = color(14,36,46);
    windowsFill = color(255,248,131);
    planePosY = planePosY +0.1;
  }else{
    CloudsFill = 255;
    bgcolor = color(110,226,255);
    windowsFill = color(220,241,255);
    planePosY = planePosY +0.006;
  }
     
     
 background(bgcolor);  //Establecemos un fondo que se limpirá constantemente

 
 //Creamos un bucle nuevamente para dibujar las nubes
 for(int i = 0; i < cloudsNum; i++){
   
   //Comprobamos que la nube no haya sobrepasado el ancho del documento
   if(cloudsPosX[i] > width){
     cloudsPosX[i] = -160; //Lo reiniciamos a la posición -160px para que vuelva a aparecer.
   }else{
     cloudsPosX[i] = cloudsPosX[i] + 10; //Lo movemos 10px.
   }
 
 
     //DIBUJAMOS UNA NUBE
     noStroke();
     fill(CloudsFill);
     ellipse(cloudsPosX[i]+50,cloudsPosY[i]+50,60,60);
     ellipse(cloudsPosX[i]+80,cloudsPosY[i]+60,60,60);
     ellipse(cloudsPosX[i]+110,cloudsPosY[i]+60,60,60);
     ellipse(cloudsPosX[i]+140,cloudsPosY[i]+50,60,60);
     ellipse(cloudsPosX[i]+110,cloudsPosY[i]+50,60,60);
     ellipse(cloudsPosX[i]+80,cloudsPosY[i]+60,60,60);
     ellipse(cloudsPosX[i]+70,cloudsPosY[i]+35,60,60);
     ellipse(cloudsPosX[i]+70,cloudsPosY[i]+75,60,60);
     ellipse(cloudsPosX[i]+100,cloudsPosY[i]+75,60,60);
     ellipse(cloudsPosX[i]+130,cloudsPosY[i]+75,60,60);

 }
 
 //Generamos el número aleatorio con la función noise para el avión.
 planeFinalY = noise(planePosY)*200;
 
 //  DIBUJAMOS EL AVIÓN //
  fill(255);
  stroke(0);
  strokeWeight(2);
  
    //Morro
    arc(planeFinalX+70,planeFinalY +198,100,98,PI-1.7,PI+1.7);
    
    //Luces
    if(rain){
      //Solo se ejecutarán en caso que llueva.
      fill(255,248,131);
      noStroke();
      triangle(planeFinalX+23,planeFinalY +190, planeFinalX-150, planeFinalY +170, planeFinalX-150,planeFinalY +216);
    }
    
    stroke(0);
    fill(255);
    
    //Estructura 
    line(planeFinalX+77,planeFinalY +248,planeFinalX+277,planeFinalY +248);
    line(planeFinalX+277,planeFinalY +248,planeFinalX+300,planeFinalY +358);
    arc(planeFinalX+361,planeFinalY +360,120,70,0,PI);
    line(planeFinalX+421,planeFinalY +359,planeFinalX+405,planeFinalY +248);
    line(planeFinalX+405,planeFinalY +248, planeFinalX+606,planeFinalY +248);
    arc(planeFinalX+608,planeFinalY +213,70,70,0,HALF_PI);
    line(planeFinalX+642,planeFinalY +211,planeFinalX+642,planeFinalY +66);
    arc(planeFinalX+597,planeFinalY +65,90,90,-PI,0);
    line(planeFinalX+551,planeFinalY +64,planeFinalX+551,planeFinalY +150);
    line(planeFinalX+551,planeFinalY +150,planeFinalX+77,planeFinalY +150);
    
    line(planeFinalX+277,planeFinalY +150, planeFinalX+260, planeFinalY +40);
    line(planeFinalX+397,planeFinalY +150, planeFinalX+379,planeFinalY +39);
    arc(planeFinalX+320,planeFinalY +39,120,70,-PI,0);
    
    noStroke();
    fill(255);
    
    //Relleno
    rect(planeFinalX+70,planeFinalY +153,540,94);
    rect(planeFinalX+554,planeFinalY +63,87,160);
    triangle(planeFinalX+261,planeFinalY +38,planeFinalX+280,planeFinalY +153,planeFinalX+332,planeFinalY +153);
    triangle(planeFinalX+380,planeFinalY +38,planeFinalX+396,planeFinalY +153,planeFinalX+332,planeFinalY +153);
    triangle(planeFinalX+260,planeFinalY +39,planeFinalX+380,planeFinalY +39, planeFinalX+333,planeFinalY +170);
    
    triangle(planeFinalX+421,planeFinalY +362,planeFinalX+360,planeFinalY +362,planeFinalX+405,planeFinalY +245);
    triangle(planeFinalX+302,planeFinalY +362,planeFinalX+360,planeFinalY +362,planeFinalX+280,planeFinalY +245);
    triangle(planeFinalX+359,planeFinalY +370,planeFinalX+407,planeFinalY +244,planeFinalX+279,planeFinalY +244);
    
    stroke(0);
    line(planeFinalX+278,planeFinalY +151,planeFinalX+397,planeFinalY +151);
    rect(planeFinalX+95,planeFinalY +172, 30,60);
    line(planeFinalX+120,planeFinalY +195,planeFinalX+120,planeFinalY +205);
    
    fill(windowsFill);
    
    //Generamos un bucle para dibujar 10 ventanas
    for(int i = 0; i < 10; i ++){
      rect(planeFinalX+159+(i*45),planeFinalY +172, 30,30);
    }
    
    noFill();
    arc(planeFinalX+42,planeFinalY +152,90,120,0,HALF_PI+0.4);
   
   fill(255);

// FIN DIBUJO AVIÓN //

 //Si llueve dibujaremos líneas moviéndose por toda la pantalla
 if(rain){
  stroke(0);
  for(int i = 0; i < width; i = i + 10){
   
    for(int j = 0; j < height; j = j + 50){
      line(i,j,i+random(10,12),j+50+random(10,12));
    }
   
  } 
  
 }
 
}

void mouseOver(){
  //Al poner el cursor encima, lloverá.
 rain = true; 
}

void mouseOut(){
  //Al sacar el cursor de encima, dejará de llover.
 rain = false; 
}


