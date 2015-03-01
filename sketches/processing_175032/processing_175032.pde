
float color1,color2,color3; 
void setup(){ //setup previo a la ejecucion 
  size(1000,600); //tamaÃ±o de la pantalla 
  background(255); //color de fondo 

// creamos la interfaz 
  
  fill(110,110,110);
  rect(0, 0, 170, height);//SeparaciÃ³n entre la parte que se puede dibujar y la que no.
 
  fill(255,255,255); //pincel blanco 
  rect(20,30,40,40); 
    
  fill(255,0,0); //pincel rojo 
  rect(20,100,40,40); 
   
  fill(0,0,255); //pincel azul 
  rect(20,170,40,40); 
  
  fill (0,0,0); //pincel negro
  rect(95,30,40,40); 
  
  fill (65,255,0); //pincel verde flojo
  rect(95,100,40,40); 
  
  fill (255,127,0); //pincel naranja
  rect(95,170,40,40);
  
  fill (255,225,0); //pincel amarillo
  rect(95,240,40,40);
  
  fill (255,0,255); //pincel rosa
  rect(20,240,40,40);
  
  fill (0,255,200); //pincel azul marino
  rect(20,310,40,40);
  
  fill (150,30,255); //pincel lila
  rect(95,310,40,40);
  
  fill (220,170,115); //pincel beige
  rect(95,380,40,40);
  
  fill (135,90,30); //pincel marrÃ³n
  rect(20,380,40,40);
  
  fill (0,80,0); //pincel verde fuerte
  rect(20,450,40,40);
  
  fill (80,80,80); //pincel gris
  rect(95,450,40,40);
  
  fill (255,255,255); //pincel random
  rect(95,520,40,40);
  fill (0,0,0);
  textSize(25);
  text("R",108,550);
  
  fill(255,255,255); //borrar pantalla
  rect(20,520,40,40); 
  stroke(255,0,0);
  line(60,520,20,560);
  line(20,520,60,560);
  
  fill (0,0,0);
  textSize(13);
  text("Tecla R = Color Aleatorio",5,585);
  
  stroke (255,255,255); //color predeterminado blanco
  strokeWeight(2); //definir ancho de linea 

  }
void draw () {
//println (mouseX + " : " + mouseY); 
 if ((mousePressed) && (mouseY < 600) && (mouseX > 210)){  //detecta el click del mouse y analiza la posicion 
     line(mouseX,mouseY,pmouseX,pmouseY); 
  }}
  
void mousePressed(){ 
   
//pincel rojo 
if (mouseX >=20 && mouseX <= 60 && mouseY >= 100 && mouseY <= 140 ){  

color1 = 255;
color2 = 0;
color3 = 0;  
stroke(color1,color2,color3);
}
//pincel azul 
  if(mouseX >=20 && mouseX <= 60 && mouseY >= 170 && mouseY <= 210 ){  

color1 = 0; 
color2 = 0; 
color3 = 255; 
stroke(color1,color2,color3);
 }
//pincel negro
  if(mouseX >=95 && mouseX <= 135 && mouseY >= 30 && mouseY <= 70 ){  

color1 = 0; 
color2 = 0; 
color3 = 0; 
stroke(color1,color2,color3);
}
//pincel blanco
  if(mouseX >=20 && mouseX <= 60 && mouseY >= 30 && mouseY <= 70 ){  

color1 = 255; 
color2 = 255; 
color3 = 255; 
stroke(color1,color2,color3);
 }
 
//pincel verde flojo
 
 if(mouseX >=95 && mouseX <= 135 && mouseY >= 100 && mouseY <= 140 ){  
 
color1 = 65; 
color2 = 255; 
color3 = 0; 
stroke(color1,color2,color3);
 
 }
 
 //pincel naranja
 
 if(mouseX >=95 && mouseX <= 135 && mouseY >= 170 && mouseY <= 210 ){  
 
color1 = 255; 
color2 = 127; 
color3 = 0; 
stroke(color1,color2,color3);
 
 } 
 
 //pincel amarillo
 
 if(mouseX >=95 && mouseX <= 135 && mouseY >= 240 && mouseY <= 280 ){  
 
color1 = 255; 
color2 = 225; 
color3 = 0; 
stroke(color1,color2,color3);
 
} 

//pincel rosa
 
  if(mouseX >=20 && mouseX <= 60 && mouseY >= 240 && mouseY <= 280 ){  

color1 = 255; 
color2 = 0; 
color3 = 255; 
stroke(color1,color2,color3);

 }
  
//pincel azul marino
 
if(mouseX >=20 && mouseX <= 60 && mouseY >= 310 && mouseY <= 350 ){  

color1 = 0; 
color2 = 255; 
color3 = 200; 
stroke(color1,color2,color3);
  
  }
  
//pincel lila
 
if(mouseX >=95 && mouseX <= 135 && mouseY >= 310 && mouseY <= 350 ){  

color1 = 150; 
color2 = 30; 
color3 = 255; 
stroke(color1,color2,color3);
  
  }
  
//pincel beige
 
if(mouseX >=95 && mouseX <= 135 && mouseY >= 380 && mouseY <= 420 ){  

color1 = 220; 
color2 = 170; 
color3 = 115; 
stroke(color1,color2,color3);
  
  }
  
//pincel marrÃ³n
 
if(mouseX >=20 && mouseX <= 60 && mouseY >= 380 && mouseY <= 420 ){  

color1 = 135; 
color2 = 90; 
color3 = 30; 
stroke(color1,color2,color3);
  
  }
  
//pincel verde fuerte
 
if(mouseX >=20 && mouseX <= 60 && mouseY >= 450 && mouseY <= 490 ){  

color1 = 0; 
color2 = 80; 
color3 = 0; 
stroke(color1,color2,color3);
  
  }
  
//pincel gris
 
if(mouseX >=95 && mouseX <= 130 && mouseY >= 450 && mouseY <= 490 ){  

color1 = 80; 
color2 = 80; 
color3 = 80; 
stroke(color1,color2,color3);
  
 }  
  
//pincel random
 
if(mouseX >=100 && mouseX <= 145 && mouseY >= 515 && mouseY <= 559 ){  

color1 = random(255); 
color2 = random(255); 
color3 = random(255); 
stroke(color1,color2,color3);
  
}
//borrar pantalla
 if(mouseX >=20 && mouseX <= 65 && mouseY >= 515 && mouseY <= 559 ){ 
 background(255);
  
strokeWeight(1);
stroke (0,0,0);
 
  fill(110,110,110);
  rect(0, 0, 170, height);//SeparaciÃ³n entre la parte que se puede dibujar y la que no.
 
  fill(255,255,255); //pincel blanco 
  rect(20,30,40,40); 
    
  fill(255,0,0); //pincel rojo 
  rect(20,100,40,40); 
   
  fill(0,0,255); //pincel azul 
  rect(20,170,40,40); 
  
  fill (0,0,0); //pincel negro
  rect(95,30,40,40); 
  
  fill (65,255,0); //pincel verde
  rect(95,100,40,40); 
  
  fill (255,127,0); //pincel naranja
  rect(95,170,40,40);
  
  fill (255,225,0); //pincel amarillo
  rect(95,240,40,40);
  
  fill (255,0,255); //pincel rosa
  rect(20,240,40,40);
  
  fill (0,255,200); //pincel azul marino
  rect(20,310,40,40);
  
  fill (150,30,255); //pincel lila
  rect(95,310,40,40);
  
  fill (220,170,115); //pincel beige
  rect(95,380,40,40);
  
  fill (135,90,30); //pincel marrÃ³n
  rect(20,380,40,40);
  
  fill (0,80,0); //pincel verde fuerte
  rect(20,450,40,40);
  
  fill (80,80,80); //pincel gris
  rect(95,450,40,40);
  
  fill (255,255,255); //pincel random
  rect(95,520,40,40);
  fill (0,0,0);
  textSize(25);
  text("R",108,550);
  
  fill(255,255,255); //borrar pantalla
  rect(20,520,40,40); 
  stroke(255,0,0);
  line(60,520,20,560);
  line(20,520,60,560);
 
  fill (0,0,0);
  textSize(13);
  text("Tecla R = Color Aleatorio",5,585);
 
 stroke (255,255,255); //color predeterminado blanco
 strokeWeight(2); //definir ancho de linea
 
}}
 void keyPressed() { //color aleatorio
  if (key == 'r' || key == 'R') { 
  color1 = random(255);
  color2 = random(255);
  color3 = random(255);
  stroke(color1,color2,color3);
 } else {
  color1 = 0;
  color2 = 0;
  color3 = 0;
 }}


