
Input entrada;
void setup(){
  // mida del sketch i input de la clase
  size(700,600);
  entrada = new Input();
}

void draw(){
// dibuixar tot el procesing
  background(255);
  entrada.dibuixa();
}


void keyReleased() {
  // ifs per agregar i borrar text
  if (keyCode == BACKSPACE || keyCode == DELETE){
    entrada.borrar();
  } else if (key != CODED){
    if(entrada.texte.length() < entrada.limit){
        entrada.afegeix(key);
      }
  }
  
}



class Input {
  //variables necesaries
  String texte;
  float xPos;
  float yPos;
  int limit;
  PFont fonBoto;
 
  Input (){
    texte = "";
    xPos = 100;
    yPos = 50;
    limit =100;
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
  //tota la part del dibuix del processing
  void dibuixa(){
    stroke (0);
    fill(34,139,34);
    rect (xPos, yPos, 500, 200);
    fill(#030000);
    text (texte+(frameCount/10 % 2== 0 ? "_" : ""), xPos + 10, yPos + 20);
    fill(255,165,0);
    rect(100,311,150,100);
    rect(450,311,150,100);
    ellipse(169,434,30,30);
    ellipse(522,434,30,30);
    ellipse(342,285,50,50);

  }
  //borrar text
  void borrar(){ 
      texte = texte.substring(0,max(0,texte.length())-1);
  }
  //afegir text
 void afegeix(char key){
   texte = texte.concat (new String(key));
 }
  
  int aEnter(){
    return parseInt(texte);
  }
}


