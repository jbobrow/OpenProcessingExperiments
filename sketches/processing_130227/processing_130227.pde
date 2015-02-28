
Input i;
Boolean entrat;

void setup(){
  size(600,800);
  entrat = false;
  i=new Input();
}
void draw(){
  
  background(100,100,255);
  rect(0,0,width, 50);
  rect(0,0,50, height);
  i.dibuixa();
  
}


void keyPressed() {
  if (keyCode == ENTER || keyCode == RETURN) {
    i.fient(true);
    
  }
  // y para cada pantalla
  if (keyCode == BACKSPACE || keyCode == DELETE){
    i.borrar();
  } 
  else if (key != CODED && key != ENTER && key != RETURN){
    if(i.texte.length() < i.limit){
        i.afegeix(key);
      }
  }
  
}

class Input {
  String texte;
  float xPos;
  float yPos;
  int limit;
  PFont fonBoto;
  String [] respostes = new String[8];
  String ans;
 
  Input (){
    texte = "";
    xPos = width/2;
    yPos = height/2;
    limit = 80;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    for  (int i = 0; i<respostes.length; ++i){
      respostes[i]="";
    }

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
    rect (60, height-50, width-100, 40);
    fill(#030000);
    text (texte+(frameCount/10 % 2== 0 ? "_" : ""), 70, height-25);
    for(int i = 0; i < respostes.length; ++i){
      text("> " + respostes[i], 60, 80+60*i);
    }
  }
  
  void borrar(){ 
      texte = texte.substring(0,max(0,texte.length()-1));
  }
  
  void afegeix(char key){
    texte = texte.concat (new String(key));
  }
  
  void fient(Boolean fora){
    for (int i = 0; i < respostes.length-1; ++i){
      respostes[i]=respostes[i+1];
    }
    respostes[respostes.length-1]=texte;
    texte="";
    
    if (fora){
      fora=!fora;
      ans="Hola!";
      texte="(Ascii): " + ans;
       fient(fora);
    }
  }
  
}


