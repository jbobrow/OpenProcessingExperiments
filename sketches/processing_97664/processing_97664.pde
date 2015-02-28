
//MªLuisa Espinós-Informática-GEDI
//Repeticiones y elementos en movimiento



//Guardamos algunas medidas
int posX, posY, velX, velY;
int posX1, posY1, velX1, velY1;
int posX2, posY2, velX2, velY2;
int posX3, posY3, velX3, velY3;
int posX4, posY4, velX4, velY4;
int posX5, posY5, velX5, velY5;
int posX6, posY6, velX6, velY6;
int posX7, posY7, velX7, velY7;
int posX8, posY8, velX8, velY8;
int posX9, posY9, velX9, velY9;


int sz = 60;
int st=50;
int sl=30;
int sc=120;

//Definimos funciones principales y damos a valor a los datos

void setup(){
  
  size(600,600);
  noFill();
  smooth();
  noStroke();
  
  posX = width/2;
  posY = height/2;
  velX = 4;
  velY = 2;
  
  posX1 = width/3;
  posY1 = int(height/3);
  velX1= int(random(8,12));
  velY1 = 5;
  
  posX2 = int(width/4);
  posY2 = int(height/4);
  velX2= 2;
  velY2 = 1;

  posX3 = int(width/8);
  posY3 = int(height/8);
  velX3= 8;
  velY3 = 1;
  
  posX4 = int(width/5);
  posY4 = int(height/8);
  velX4= 5;
  velY4 = 4;
  
  posX5 = int(width/2);
  posY5 = int(height/5);
  velX5= 5;
  velY5 = 7;
  
   posX6 = int(width/8);
  posY6= int(height/7);
  velX6= 3;
  velY6 = 9;
  
   posX7 = int(width/8);
  posY7= int(height/8);
  velX7= 6;
  velY7 = 9;
  
    posX8 = int(width/6);
  posY8= int(height/6);
  velX8= 3;
  velY8 = 9;
  
    posX9 = int(width/5);
  posY9= int(height/5);
  velX9= 6;
  velY9 = 3;
}
  
 //Fondo 
  
void draw(){  
    background(255);

//Cuadrado
int totalr= 8;
int tf= 62;
int tx= 43;
int tj= 33;


//Definición de ecuaciones verticales y horizontales

for(int g=0; g<totalr; g++){

for(int t=0; t<totalr; t++){
  
  //Girar el rectangulo

  pushMatrix();
  noStroke();
  fill(243,167,247,50);
  translate(tx,tj);
  rotate(PI/7);
  rect(-10,-10,tf,tf);
  tx = tx + 70; 
  popMatrix();
  
  //Especificar el espacio entre los rectangulos
  }
tj= tj + 70;
tx= 43;
}





//Elipses
//Poner datos principales

int totale= 8;
float m=width/totale;
float d=width/totale;
float radi = m/2;
float cx=radi;
float cy=radi;

//Reproduccion en vertical y en horizontal

for(int j=0; j<totale; j++){
for(int i=0; i<totale; i++){
  
  
 //Definir formas de las elipses a repetir
 fill(252,250,171,250);
 ellipse(cx,cy,50,50);
 
 stroke(8,255,162); 
 fill(215,250,244);
  ellipse(cx,cy,50,20);
  ellipse(cx,cy,20,50);
  
 noStroke(); 
  fill(255,108,197,120);
  ellipse(cx,cy,18,18);
  
 fill(132,206,242);
  ellipse(cx,cy,10,10);
  
  fill(132,206,242);
  ellipse(cx+25,cy+25,22,22); 
 
 //Avance en la x 
  cx = cx +d ; 
  
}


cy= cy + d;
cx = radi;


}



  //Actualizamos las posiciones del primer elemento en movimiento
  posX = posX+velX;
  posY = posY+velY;
  
  //Definimos el elemento(Mariposa1)
  //Alas
  
  fill(255,117,82,220);
  ellipse(posX,posY,sz,sz/2);
  ellipse(posX+60,posY,sz,sz/2);
  ellipse(posX,posY+20,sz,sz/2);
  ellipse(posX+60,posY+20,sz,sz/2);
  //Cuerpo
  
  fill(82,158,255);
   ellipse(posX+30,posY+10,sz/2,sz);
   //Ojos
   
   stroke(0);
  fill(250);
   ellipse(posX+33,posY,sz/9,sz/9);
   ellipse(posX+27,posY,sz/9,sz/9);
  
    //Comprovamos la posición X, para que el dibujo no salga de la ventana
    
  if((posX-30<0)||(posX+90>width)){
    velX = -velX;
  } 
   
   
    //comprovamos la posicion Y,para que el dibujo no salga de la ventana
  
  if((posY-20<0)||(posY+40>height)){
    velY = -velY;
  } 
  
  //Actualitzamos las posiciones del segundo elemento en movimiento
  posX1=posX1+velX1;
  posY1=posY1+velY1;
  
  //Definimos el elemento(Mariposa2)
  //Alas
  
  noStroke();
  fill(107,191,19,220);
  ellipse(posX1,posY1,st,st/2);
  ellipse(posX1+60,posY1,st,st/2);
  ellipse(posX1,posY1+20,st,st/2);
  ellipse(posX1+60,posY1+20,st,st/2);

  //Cuerpo
  
  fill(255,146,13);
   ellipse(posX1+30,posY1+10,st/2,st);
   
   //Ojos
   
   stroke(0);
  fill(250);
   ellipse(posX1+33,posY1,st/9,st/9);
   ellipse(posX1+27,posY1,st/9,st/9);
   
  
  //Comprovamos La posicion en Y, para que el dibujo no salga de la ventana
  
  if((posX1-25<0)||(posX1+85>width)){
    velX1 = -velX1;
    
  } 
    //Comprovamos la posicion Y,para que el dibujo no salga de la ventana
    
  if((posY1-25<0)||(posY1+40>height)){
    velY1 = -velY1;
  }
  
  
    
 //Actualitzamos las posiciones del tercer elemento en movimiento
  posX2=posX2+velX2;
  posY2=posY2+velY2;
  
  
  //Definimos el elemento(Mariposa3)
  //Alas
  
  noStroke();
  fill(191,28,19,220);
  ellipse(posX2,posY2,sl,sl/2);
  ellipse(posX2+20,posY2,sl,sl/2);
  ellipse(posX2,posY2+10,sl,sl/2);
  ellipse(posX2+20,posY2+10,sl,sl/2);

  //Cuerpo
  
  fill(19,163,191);
   ellipse(posX2+10,posY2+6,sl/2,sl);
   
   //Ojos
   
   stroke(0);
  fill(250);
   ellipse(posX2+13,posY2,sl/9,sl/9);
   ellipse(posX2+7,posY2,sl/9,sl/9);
   
  
  //comprovamos La posicion en Y, para que el dibujo no salga de la ventana
  
  if((posX2-15<0)||(posX2+35>width)){
    velX2 = -velX2;
  } 
    //comprovamos la posicion Y,para que el dibujo no salga de la ventana
    
  if((posY2-10<0)||(posY2+20>height)){
    velY2 = -velY2; 
    
    } 
    
    
  
  //Actualitzamos las posiciones del cuarto elemento en movimiento
  posX3=posX3+velX3;
  posY3=posY3+velY3;
  
  //Definimos la elipse
  noStroke();
  fill(252,255,116,200);
  ellipse(posX3,posY3,sc,sc);
  
   //comprovamos La posicion en Y, para que el dibujo no salga de la ventana
  
  if((posX3-60<0)||(posX3+60>width)){
    velX3 = -velX3;
  } 
    //comprovamos la posicion Y,para que el dibujo no salga de la ventana
    
  if((posY3-60<0)||(posY3+60>height)){
    velY3 = -velY3;
      } 
    
    
  
  //Actualitzamos las posiciones del quinto elemento en movimiento
  posX4=posX4+velX4;
  posY4=posY4+velY4;
  
    //Definimos la elipse
  fill(255,111,106,200);
  ellipse(posX4,posY4,sc,sc);
  
   //comprovamos La posicion en Y, para que el dibujo no salga de la ventana
  
  if((posX4-60<0)||(posX4+60>width)){
    velX4 = -velX4;
  } 
    //comprovamos la posicion Y,para que el dibujo no salga de la ventana
    
  if((posY4-60<0)||(posY4+60>height)){
    velY4 = -velY4;
        } 
    
    
  
  //Actualitzamos las posiciones del sexto elemento en movimiento
  posX5=posX5+velX5;
  posY5=posY5+velY5;
  
  //Definimos la elipse
  fill(106,189,255,200);
  ellipse(posX5,posY5,sc,sc);
  
   //comprovamos La posicion en Y, para que el dibujo no salga de la ventana
  
  if((posX5-60<0)||(posX5+60>width)){
    velX5 = -velX5;
  } 
    //comprovamos la posicion Y,para que el dibujo no salga de la ventana
    
  if((posY5-60<0)||(posY5+60>height)){
    velY5 = -velY5;
         } 
    
    
  
  //Actualitzamos las posiciones del septimo elemento en movimiento
  posX6=posX6+velX6;
  posY6=posY6+velY6;
  
   //Definimos la elipse
  fill(106,251,255,200);
  ellipse(posX6,posY6,sc,sc);
  
   //comprovamos La posicion en Y, para que el dibujo no salga de la ventana
  
  if((posX6-60<0)||(posX6+60>width)){
    velX6 = -velX6;
  } 
    //comprovamos la posicion Y,para que el dibujo no salga de la ventana
    
  if((posY6-60<0)||(posY6+60>height)){
    velY6 = -velY6;
    
    } 
    
    
  
  //Actualitzamos las posiciones del octavo elemento en movimiento
  posX7=posX7+velX7;
  posY7=posY7+velY7;
  
    //Definimos la elipse
  fill(106,251,255,200);
  ellipse(posX7,posY7,sl,sl);
  
   //comprovamos La posicion en Y, para que el dibujo no salga de la ventana
  
  if((posX7-15<0)||(posX7+15>width)){
    velX7 = -velX7;
  } 
    //comprovamos la posicion Y,para que el dibujo no salga de la ventana
    
  if((posY7-15<0)||(posY7+15>height)){
    velY7 = -velY7;
       } 
    
    
  
  //Actualitzamos las posiciones del noveno elemento en movimiento
  posX8=posX8+velX8;
  posY8=posY8+velY8;
  
  //Definimos la elipse
  fill(106,189,255,200);
  ellipse(posX8,posY8,sl,sl);
  
   //comprovamos La posicion en Y, para que el dibujo no salga de la ventana
  
  if((posX8-15<0)||(posX8+15>width)){
    velX8 = -velX8;
  } 
    //comprovamos la posicion Y,para que el dibujo no salga de la ventana
    
  if((posY8-15<0)||(posY8+15>height)){
    velY8 = -velY8;
    } 
    
    
  
  //Actualitzamos las posiciones del decimo elemento en movimiento
  posX9=posX9+velX9;
  posY9=posY9+velY9;
  
  //Definimos la elipse
  fill(255,111,106,200);
  ellipse(posX9,posY9,sl,sl);
  
   //comprovamos La posicion en Y, para que el dibujo no salga de la ventana
  
  if((posX9-15<0)||(posX9+15>width)){
    velX9 = -velX9;
  } 
    //comprovamos la posicion Y,para que el dibujo no salga de la ventana
    
  if((posY9-15<0)||(posY9+15>height)){
    velY9 = -velY9;
}

}



