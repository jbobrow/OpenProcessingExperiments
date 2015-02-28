
//Paint básico por Adrian Díaz López

int tamany=15;

void setup(){
  size(500,500);
  background(255);
  smooth();
}

void draw(){ 
  //Fondo negro
  if (keyPressed && (key=='1')){
    background(0);
  }
  //Fondo blanco
  if (keyPressed && (key=='2')){
    background(255);
  }
  //Pincel
  if (mousePressed){
    ellipse(mouseX,mouseY,tamany,tamany);
    noStroke();
  }
  //Zoom + Pincel
  if (keyPressed && key=='+'){
    tamany=tamany+1;
  //Zoom - Pincel
  }else if (keyPressed && (key=='-')){
    tamany=tamany-1;
  }
  
  //Normalizar pincel
  if(tamany==0){
    tamany=1;
  }
 
  //Colores
  if (keyPressed)
  //Azul
    if(key=='b'){
      fill(0,0,255);
  //Verde
    }else if (key=='g'){
      fill(0,255,0);
  //Rojo
    }else if (key=='r'){
      fill(255,0,0);
  //Amarillo
    }else if (key=='y'){
      fill(255,255,0);
  //Naranja
    }else if (key=='o'){
      fill(255,130,50);
   //Negro
    }else if (key=='v'){
      fill(0);
   //Lila
    }else if (key=='f'){
      fill(255,0,255);
   //Gris
    }else if (key=='z'){
      fill(120,120,120);
    }
    
  } 
  




