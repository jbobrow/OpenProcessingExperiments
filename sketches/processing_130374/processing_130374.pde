
//**
//*
//* Hecho por Daniel Ortega, 1r ASIX
//* para Programación Básica - Processing
//*
//**

Input entrada;
int secret = ((int) (Math.random()*6))+1;
String respuesta1 = "rojo";
String respuesta2 = "verde";
String respuesta3 = "azul";
String respuesta4 = "amarillo";
String respuesta5 = "magenta";
String respuesta6 = "cyan";

void setup(){
  size(500,500);
  entrada = new Input();
}

void draw(){
  background (127);
  entrada.dibuixa();
  fill (0);
  textSize (20);
  text ("¿Que color es?", 50,50);
  if (secret==1){
    if (entrada.texte==respuesta1){
      fill (255,0,0);
      text ("¡CORRECTO!", 50,450);
    }
  }else if (secret==2){
    if (entrada.texte==respuesta2){
      fill (0,255,0);
      text ("¡CORRECTO!", 50,450);
    }
  }else if (secret==3){
    if (entrada.texte==respuesta3){
      fill (0,0,255);
      text ("¡CORRECTO!", 50,450);
    }
  }else if (secret==4){
    if (entrada.texte==respuesta4){
      fill (255,255,0);
      text ("¡CORRECTO!", 50,450);
    }
  }else if (secret==5){
    if (entrada.texte==respuesta5){
      fill (255,0,255);
      text ("¡CORRECTO!", 50,450);
    }
  }else if (secret==6){
    if (entrada.texte==respuesta6){
      fill (0,255,255);
      text ("¡CORRECTO!", 50,450);
    }
  }
}
void keyReleased(){
   
  if (keyCode == ENTER){
    fill(0);
    text("OKEY", 450,475);
    secret = ((int) (Math.random()*6))+1;
    entrada.texte();
  }
  
  if (keyCode == BACKSPACE || keyCode == DELETE){
    entrada.borrar();
    fill (0);
    text ("OKEY", 450,475);
  }else if (key != CODED){
    if (entrada.texte.length() < entrada.limit){
        entrada.afegeix(key);
    }
  }
}
class Input {
  String texte;
  float xPos;
  float yPos;
  int limit;
  PFont fonBoto;
 
  Input (){
    texte = "";
    xPos = 330;
    yPos = 400;
    limit = 10;
    fonBoto = createFont("Georgia", 12);
    textFont (fonBoto);

  }
  
  Input (String r, float x, float y, int l){
    texte = r; 
    xPos = x;
    yPos = y;
    limit = l;
    fonBoto = createFont("Georgia", 12);
    textFont (fonBoto);
  }
  
  void dibuixa(){
    stroke (0);
    fill (255);
    rect (xPos, yPos, 100, 40);
    fill (#030000);
    text (texte+(frameCount % 20== 0 ? "_" : ""), xPos + 10, yPos + 20);
    if (secret==1){
      fill (255,0,0);
    }else if (secret==2){
      fill (0,255,0);
    }else if (secret==3){
      fill (0,0,255);
    }else if (secret==4){
      fill (255,255,0);
    }else if (secret==5){
      fill (255,0,255);
    }else if (secret==6){
      fill (0,255,255);
    }
    noStroke();
    ellipse (250,225,150,150);
  }
  void borrar(){ 
      texte = texte.substring(0,max(0,texte.length()-1));
  }
  
  void afegeix(char key){
    texte = texte.concat (new String(key));
  }
  
  int aEnter(){
    return parseInt(texte);
  }
}


