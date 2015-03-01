
//Posem variables
Input i;
Boolean introduit;

//Posem tamany de sketch entre d'altres

void setup(){
  size(600,800);
  introduit = false;
  i=new Input();
}

void draw(){
  
  background(0);
  rect(0,0,width, 50);
  rect(0,0,50, height);
  i.dibuixa();
  
}

//Per el moment on es premi tecles o es vulgui esborrar

void keyPressed() {
  if (keyCode == ENTER || keyCode == RETURN) {
    i.posar(true);
    
  }
  
  if (keyCode == BACKSPACE || keyCode == DELETE){
    i.esborrar();
  } 
  else if (key != CODED && key != ENTER && key != RETURN){
    if(i.texta.length() < i.limit){
        i.afegir(key);
      }
  }
  
}

//La class Input, per introduir el que posarem

class Input {
  String texta;
  float xPos;
  float yPos;
  int limit;
  PFont fonBoto;
  String [] resposta = new String[8];
  String answer;
 
  Input (){
    texta = "";
    xPos = width/2;
    yPos = height/2;
    limit = 80;
    fonBoto = createFont("Georgia", 17);
    fill(#00FF29);
    textFont(fonBoto);
    for  (int i = 0; i<resposta.length; ++i){
      resposta[i]="";
    }

  }
  
  Input (String r, float x, float y, int l){
    texta = r; 
    xPos = x;
    yPos = y;
    limit = l;
    fonBoto = createFont("Georgia", 17);
    textFont(fonBoto);
  }
  
  //Aquí es dibuixará el que es mostrará en pantalla, disseny, quadrat de texte, i les respostes, entre d'altres
  
  void dibuixa(){
    stroke (0);
    fill(255);
    rect (60, height-50, width-100, 40);
    fill(#00FF29);
    text (texta+(frameCount/10 % 2== 0 ? "_" : ""), 70, height-25);
    for(int i = 0; i < resposta.length; ++i){
      text("> " + resposta[i], 60, 80+60*i);
    }
  }
  
  void esborrar(){ 
      texta = texta.substring(0,max(0,texta.length()-1));
  }
  
  void afegir(char key){
    texta = texta.concat (new String(key));
  }
  
  void posar(Boolean fora){
    for (int i = 0; i < resposta.length-1; ++i){
      resposta[i]=resposta[i+1];
    }
    resposta[resposta.length-1]=texta;
    texta="";
    
    if (fora){
      fora=!fora;
      answer="01000101 01010010 01010010 01001111 01010010";
      texta="Alejandro: " + answer;
      posar(fora);
    }
  }
  
}



