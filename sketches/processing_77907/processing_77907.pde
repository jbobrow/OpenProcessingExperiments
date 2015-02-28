
void setup () {
  size (600,600);
  background (255);
}
//definimos colores
int pintarcolor = #000000;
int negro = 0;
int rojo = #FF0000;
int blanco = #FFFFFF;
int verde = #00CC00;
int amarillo = #FFFF33;
int azul = #00FFFF;
//servira per incrementar/disminuir el tamany del que dibuixem
int tamany = 10;

void draw (){
  noStroke();
  fill (pintarcolor);
  if (mousePressed){
    rect (mouseX,mouseY,tamany,tamany);
  }
  else{
    ellipse(mouseX,mouseY,tamany,tamany);
  }
  if (keyPressed){
    if (key == 'r'){
      pintarcolor = rojo;
    }
    if (key == 'n'){
      pintarcolor = negro;
    }
    if (key == 'w'){
      pintarcolor = blanco;
    }
    if (key == 'g'){
      pintarcolor = verde;
    }
    if (key == 'a'){
      pintarcolor = amarillo;
    }
    if (key == 'b'){
      pintarcolor = azul;
    }
    if(key == '9'){
      pintarcolor = int (random(#000000,#FFFFFF));
    } 
    if (key == '+'){
      tamany = tamany+1;
    } 
    if (key == '-' && tamany != 1){
      tamany = tamany-1;
    }
  }
}

//neteja pantalla
void keyPressed (){
  if (key == '0'){  
    background (255);
  }
}

