
/*"Pintura aleatoria"
3a Practica Processing
Sergi Garcia Calero
1r ASIX C.E.Roca.*/

boolean llansador = false;
int frames = 200;
float colora, colorb, colorc;
float randomizerx = 400;
float randomizery = 300;
void setup (){
  size (800, 600);
  background(255);
}

void draw(){
  //Ajuda
  textSize(20);
  text(frames, 750.0, 50.0);
  text("Pulsa '?' para ayuda", 50.0, 550.0);
  
  frameRate(frames);
  //Teclat
  if(keyPressed){
    if (key==' '){
    fill(#FFFFFF);
    rect(0,0,800,600);
    }
    if (key=='l'){
      line(random(0, 800), random(0,800), mouseX, mouseY);
    }
    if (key=='r'){
      colora=random(0,255);
      colorb=random(0,255);
      colorc=random(0,255);
    }
    if (key=='b'){
      background(random(0, 255), random (0, 255), random (0, 255));
    }
    if (key=='+'){
     fill(#FFFFFF);
     rect(750, 20, 50, 50);
     ++frames;
    }
    if (key=='-'){
      
     fill(#FFFFFF);
     rect(750, 20, 50, 50);
     --frames;
    }
    if (key=='?'){
      textSize(15);
      text("L - Lineas centradas en el cursor", 50.0, 50,0);
      text("R - Cambio de color aleatorio", 50.0, 100.0);
      text("B - Cambio de fondo de pantalla aleatorio. BORRARA EL DIBUJO", 50.0, 150.0);
      text("ESPACIO - Limpiar dibujo", 50.0, 200.0);
      text("+/- - Subir o bajar framerate. NOTA: No disminuir por debajo de 1", 50.0, 250.0);
      text("Haz clic para liberar el ultra-randomiser. Para mas diversion, mantén apretado R mientras rebota", 50.0, 300.0);
    }
  }
  fill(colora,colorb,colorc);
  stroke(0);
  line(random(pmouseX, mouseX),random(pmouseY, mouseY),random(pmouseX, mouseX),random(pmouseY, mouseY));
    
  if (llansador){
    float nrandx=random(0,800);
    float nrandy=random(0,800);
    line(randomizerx, randomizery, nrandx, nrandy);
    ellipse(nrandx,nrandy, 10, 10);
    randomizerx=nrandx;
    randomizery=nrandy;
  }
  
  if (mousePressed && llansador==true){
    llansador=false;
  }
  else if (mousePressed){
    llansador=true;
  }
  
  
   
}



