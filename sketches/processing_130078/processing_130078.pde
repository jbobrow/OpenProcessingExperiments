
Input entrada;
float xhero = 200;
float yhero = 200;

void setup(){
  size(400,400);
  entrada = new Input(r="", x=180, y=350, l=3);
}

void draw(){
  background(255);
  entrada.dibuixa();
  ellipse(xhero,yhero,entrada.aEnter(),entrada.aEnter());
}

void keyReleased() {
  if (keyCode == BACKSPACE || keyCode == DELETE){
    entrada.borrar();
  } else if (key != CODED){
    if(entrada.texte.length() < entrada.limit){
        entrada.afegeix(key);
    }
  }
}

void keyPressed(){
   if(key == CODED){
      if(keyCode == LEFT){
        xhero--;
      }
      if(keyCode == RIGHT){
        xhero++;
      }
      if(keyCode == UP){
        yhero--;
      }
      if(keyCode == DOWN){
        yhero++;
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
    xPos = width/2;
    yPos = height/2;
    limit = 3;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);

  }
  
  Input (String r, float x, float y, int l){
    texte = r; 
    xPos = x;
    yPos = y;
    limit = l;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
  }
  
  void dibuixa(){
    stroke (0);
    fill(255);
    rect (xPos, yPos, 40, 30);
    fill(#000000);
    text (texte+(frameCount/10 % 2== 0 ? "_" : ""), xPos + 10, yPos + 20);
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


