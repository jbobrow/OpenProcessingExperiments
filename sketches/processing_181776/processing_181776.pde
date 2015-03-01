
/* Soraya I. Pérez Rodríguez
Práctica 2 - Taller de Creación de Videojuegos
Grado en Comunicación Audiovisual
Universidad Pompeu Fabra
Enero 2015 */


/* Precarga de imágenes */
  /* @pjs preload="texturemap.jpg"; */


// Variables

  // -- Color

  color beige = color(255,223,147);
  color black = color(0);
  color blue = color(57,190,221);
  color brown = color(160,85,15);
  color darkblue = color(28,147,186);
  color darkgreen = color(89,157,35);
  color green = color(183,232,64);
  color pink = color(244,122,160);
  color red = color(255,0,0);
  color white = color(255);
  
  // -- Medidas

  float ladorect = 30;
  float x = 150;
  float x2 = 300;
  int ladobarco = 60;
  int ladoisla = 70;
  int ladoIslaGrande = 200;
  
  // -- Movimientos barcos
  
  float velocidad = 1;
  float velocidad2 = 1.5;
    

void setup(){
  size(500,700);
}


void draw(){
  background(beige);
  noCursor();
  
  // Mar
  
  fill(darkblue);
  noStroke();
  rect(width-480,height-690,width-40,height-20,100); // -- Mar fondo --
  
  fill(blue);
  ellipse(width/2,height/2,width-70,height-70); // -- Elipse grande --
  
  ellipse(width-400,height-570,width-400,height-600); // -- Elipse pequeña -- 
  
  // Roturas Mapa
  
  fill(darkblue);
  triangle(22,90,10,92,22,94); // -- 1era rotura lado izquierdo --
  triangle(22,100,5,105,22,110); // -- 2nda rotura lado izquierdo --
  triangle(40,50,22,22,53,35); // -- Rotura esquina superior izquierda --
  triangle(465,650,470,670,445,665); // -- Rotura esquina inferior derecha grande --
  triangle(472,629,481,638,470,638); // -- Rotura esquina inferior derecha pequeña --
  triangle(40,650,23,675,53,666); // -- Rotura esquina inferior izquierda --
  
  // Islas
  
    // -- Isla tesoro
   
    fill(darkgreen);
    ellipse(width-180,height-120,ladoisla,ladoisla-25); 
  
    fill(green);
    ellipse(width-180,height-122,ladoisla-7,ladoisla-33); 
   
      // --- Cruz tesoro
      
      stroke(red);
      strokeWeight(5);
      line(width-187,height-129,width-173,height-115);
      line(width-173,height-129,width-187,height-115);
     
    // -- Isla grande
  
    noStroke();  
    fill(darkgreen);
    ellipse(width/2,height/2,ladoIslaGrande,ladoIslaGrande); 
    ellipse(290,300,ladoIslaGrande-50,ladoIslaGrande-50);
    
    fill(green);
    ellipse(width/2,height/2-5,ladoIslaGrande-13,ladoIslaGrande-13);
    ellipse(290,295,ladoIslaGrande-63,ladoIslaGrande-63);
    
      // --- Calavera
      
      fill(white);
      rect(width/2-25,height/2,50,35);
      ellipse(width/2,height/2-20,ladoIslaGrande/2.5,ladoIslaGrande/2.5);
      
      fill(random(255),0,0);
      ellipse(width/2-15,height/2-20,20,25);
      ellipse(width/2+15,height/2-20,20,25);
      
      stroke(green);
      line(width/2-10,height/2+20,width/2-10,height/2+40);
      line(width/2+10,height/2+20,width/2+10,height/2+40);
        
      noStroke(); 
      
  // Barco 1
   
  if (x>=width-140){
     velocidad = -velocidad; 
    }else{
      if(x<140){
       velocidad = -velocidad;
    }
  }
  
  x += velocidad;
 
  fill(pink);
  arc(x,height-550,ladobarco,49,0,PI);
  stroke(pink);
  line(x,height-550,x,height-580);
  triangle(x,height-580,x+10,height-575,x,height-570);
  
  // Barco 2
   
  if (x2>=width-140){
     velocidad2 = -velocidad2; 
    }else{
      if(x2<140){
      velocidad2 = -velocidad2;
    }
  }
    
  x2 += velocidad2;
 
  noStroke();
  fill(pink);
  arc(x2,height-190,ladobarco,49,0,PI);
  stroke(pink);
  line(x2,height-190,x2,height-220);
  triangle(x2,height-220,x2+10,height-215,x2,height-210);
  
  // Lupa
    
    // -- Mango
    
    stroke(brown);
    strokeWeight(12);
  
    strokeWeight(mouseY/12);
    line(mouseX,mouseY,mouseX+30,mouseY+50); 
     
    // -- Lente

    strokeWeight(8);
   
    if( (mouseX>=(x-30) && mouseX<=(x+30)) && (mouseY>=(height-590) && mouseY<=(height-510)) ){
      if(mousePressed){
        fill(white);
        textSize(18);
        textAlign(CENTER);
        text("¡Has encontrado el tesoro! :D",width/2,30);
        fill(random(255),random(255),0);
     }else{  
        fill(red);
     }
     }else{
      fill(0,0,mouseX);
     }
  
    ellipse(mouseX,mouseY,mouseY/5,mouseY/5); 
     
  // Posición en el mapa (X,Y)

  fill(white,90);
  stroke(green);
  strokeWeight(3); 
  rect(width-145,height-70,ladorect*3,ladorect);
 
  textAlign(CENTER);
  textSize(12);
  fill(black);
  text(mouseX, width-120,height-50); 
  textSize(16);
  text(":", width-100,height-50); 
  textSize(12);
  text(mouseY, width-80,height-50); 

  // Textura

  PImage img;

  tint(255,80);
  img = loadImage("texturemap.jpg");
  image(img,0,0);

}


