
int pantalla =1;
int [] nombres = {0,0,0,0,0,0,0,0,0,0};
int nombreOpcio = 0;
int yPos = 75;
int i = 1;
int variable = 99999999;

Input entrada;
void setup(){
  size(400,400);
  entrada = new Input();
  background(0);
}

void draw(){
  background(0);
  
  switch(pantalla){
    case 1:
    fill(255);
  textSize(20);
  text("AGENDA",160,25);
  textSize(12);
  text("Escribe el número de la opción deseada",85,50);
  text("(1) Ver los números guardados",30,75);
  text("(2) Añadir un número nuevo",30,100);
  text("(3) Borrar todos los números",30,125);
  text("(4) Borrar un número",30,150);
  
  if(keyPressed){
    if(key =='1'){
    pantalla = 2;
  }
  if(key =='2'){
    pantalla =3;
  }
  if(key =='3'){
    pantalla =4;
  }
  if(key =='4'){
    pantalla =5;
  }
  }
  break;
  
  case 2:
  
  textSize(20);
  text("AGENDA",160,25);
  textSize(12);
  text("Números guardados",85,50);
   if(yPos >=25 && yPos<= 225){
  for(int i =1;i<nombres.length;i++){
    nombreOpcio = i;
  text("("+nombreOpcio+") "+nombres[i],30,yPos);
  yPos = yPos + 25;
  }
  if (yPos >= 225){
   yPos = 75;
 }
   }
  text("(R)Volver",30,350);
  
  if(keyPressed){
    if(key =='r' | key =='R'){
    pantalla = 1;
  }
  }
  
  break;
  
  case 3:
  
   fill(255);
  textSize(20);
  text("AGENDA",160,25);
  textSize(12);
  text("Añadir un número nuevo",85,50);
  text("Para guardar el número pulsa la tecla SHIFT",30,100);
  entrada.dibuixa();
  text("(R)Volver",30,350);
  if(keyPressed){
    if(key =='r' | key =='R'){
    pantalla = 1;
  }
  }
 
  break;
  
  case 4:
  
  textSize(20);
  text("AGENDA",160,25);
  textSize(12);
  text("Borrar todos los números",85,50);
  text("Desea borrar todos los números?",30,100);
  text("(1) Si",30,125);
  text("(2) No",30,150);
  text("(R)Volver",30,350);
  if(keyPressed){
    if (key =='1'){
     nombres[1] = "No guardado";nombres[2] = "No guardado";nombres[3] = "No guardado";nombres[4] = "No guardado";nombres[5] = "No guardado"; 
     nombres[6] = "No guardado";nombres[7] = "No guardado";nombres[8] = "No guardado";nombres[9] = "No guardado"; 
      pantalla = 6;
    }
    if(key =='r' | key =='R'){
    pantalla = 1;
  }
  }
  
  break;
  
  case 5:
  fill(255);
  textSize(20);
  text("AGENDA",160,25);
  textSize(12);
  text("Que número quieres borrar?",85,50);
  entrada.dibuixa();
  text("(R)Volver",30,350);
  
  if(keyPressed){
    if(key =='r' | key =='R'){
    pantalla = 1;
  }
  }
  
  break;
  
  case 6:
  textSize(20);
  text("AGENDA",160,25);
  textSize(12);
  text("Todos los números han sido borrados!",85,150);
  text("(R)Volver",30,350);
  if(keyPressed){
    if(key =='r' | key =='R'){
    pantalla = 1;
  }
  }
  break;
  
  case 7:
  textSize(20);
  text("AGENDA",160,25);
  textSize(12);
  text("El número ha sido borrado!",85,50);
  text("(R)Volver",30,350);
  if(keyPressed){
    if(key =='r' | key =='R'){
    pantalla = 1;
  }
  }
}

}

void keyReleased() {
  if (pantalla == 3){
    if (keyCode == ENTER) {
    }
    // y para cada pantalla
    if (keyCode == BACKSPACE || keyCode == DELETE){
      entrada.borrar();
    } else if (key != CODED){
      if(entrada.texte.length() < entrada.limit){
          entrada.afegeix(key);
        }
    }
  }
  }
void keyPressed(){
  if (pantalla ==3){
    if (keyCode == SHIFT){
       fill(255);
       print(entrada.dibuixa());
      nombres[i] = key ;
      i++;
    }
    }
    if (pantalla ==5){
     if(keyCode == SHIFT){
      i = key;
       nombres[i] = "Borrado";
       
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
    limit = 9;
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
    rect (xPos, yPos, 100, 40);
    fill(#030000);
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


