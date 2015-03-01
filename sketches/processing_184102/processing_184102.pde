
String vuelta;
PImage pant0, pant1, pant2, pant3, pant4;
Boton primerb, segundob, tercerb, cuartob, quintob;
int pantalla = 1;
boolean icanclick = true;
Input entrada;
void setup(){
  size(400,400);
  pant0 = loadImage("0.png");
  pant1 = loadImage("1.png");
  pant2 = loadImage("2.png");
  pant3 = loadImage("3.png");
  pant4 = loadImage("4.png");
  entrada = new Input();
  //declarando botones -- 1pantalla pokemon
  primerb = new Boton(0, 0, 400, 1, 2);//pantalla pokemon
  //seleccionar poner nombre
  segundob = new Boton(350, 360, 30, 2, 3);//dar para poner el nombre
  //poner el nombre
  tercerb = new Boton(350, 40, 30, 3, 4);//poner nombre
  //te dice el nombre
  cuartob = new Boton(350, 360, 30, 4, 5);//lo reconoce
  //despedida
  quintob = new Boton(0, 0, 50, 5, 6);//feliz aventura
  
  
}

void draw(){

  println(mouseX + ","+ mouseY);
  println(pantalla);
  background(255);
  
   //cambio de pantallas
  switch (pantalla){
   case 1: primera(); break;
   case 2: segunda(); break;
   case 3: tercera(); break;
   case 4: cuarta(); break;
   case 5: quinta(); break; 
  }
  
}

void mouseReleased(){
  primerb.click();
  segundob.click();
  tercerb.click();
  cuartob.click();
  quintob.click();
}


void cuarta(){
 image(pant3, 0, 0);
icanclick = true; 
  fill(255);
  stroke(1);
    rect (0, 350, 399, 59);
    rect (2, 352, 396, 46);
  fill(0);
    text("Ya me acuerdo! te llamas", 20, 380);
     text(vuelta, 155, 380);
     text(", perdón por mi memòria.", 205, 380);
  //boton
  fill(125);
  noStroke();
  rect(350, 360, 30, 30);
  fill(0);
  triangle(375,375,355,365,355,385);
 
 

}
class Input {
  String texte;
  float xPos;
  float yPos;
  int limit;
  PFont fonBoto;
 
  Input (){
    texte = "";
    limit = 8;
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
  
    fill(#030000);
    text (texte+(frameCount/10 % 2== 0 ? "_" : ""), 200, 70);
  }
  void borrar(){ 
      texte = texte.substring(9,max(1,texte.length()-1));
  }
  
  void afegeix(char key){
    texte = texte.concat (new String(key));
  }
  
  int aEnter(){
    return parseInt(texte);
  }
  
  String devolver() {
    return texte;
  }
  
}
void primera(){
  image(pant0, 0, 0);
  println("hola");
  icanclick = true;
}
void quinta(){
  image(pant4, 0, 0);
  
 
  fill(255);
  stroke(1);
    rect (0, 350, 399, 59);
    rect (2, 352, 396, 46);
  fill(0);
    text(vuelta, 20, 380);
     
     text(",ya estas listo para tu aventura Pokemon", 70, 380);
  //boton
  fill(125);
  noStroke();
  rect(350, 360, 30, 30);
  fill(0);
  triangle(375,375,355,365,355,385);
    if(mousePressed){
    if(mouseX > 350 && mouseX < 380 && mouseY > 360 && mouseY < 390) {
      pantalla = 1;
    }
  }
}
void segunda(){
image(pant1, 0, 0);
icanclick = true;

//caja de dialogo
  fill(255);
  stroke(1);
    rect (0, 350, 399, 59);
    rect (2, 352, 396, 46);
  fill(0);
    text("Hola, no me acuerdo de tu nombre, puedes decírmelo?", 20, 380);
  //boton
  fill(125);
  noStroke();
  rect(350, 360, 30, 30);
  fill(0);
  triangle(375,375,355,365,355,385);
}
class Boton {
  int x; 
  int y;
  int longitud;
  int pantalla1;
  int pantalla2;
  
  Boton(int xx, int yy, int longitudd, int pantallaa1, int pantallaa2) {
    x = xx;
    y = yy;
    longitud = longitudd;
    pantalla1 = pantallaa1; 
    pantalla2 = pantallaa2;
    
    
  }
   void click() {
     if ((x <= mouseX && mouseX <= x + longitud) && (y <= mouseY && mouseY <= y + longitud) && pantalla == pantalla1 && icanclick){
     pantalla = pantalla2;
     icanclick = false; 
   }
   }
 /*  void enter(){
   if (keyPressed == ENTER && pantalla == pantalla1){
     pantalla = pantalla2; 
     }
   }*/
}
void tercera(){
  icanclick = true;
  image(pant2, 0, 0);
  textSize(32);
  entrada.dibuixa();
  vuelta = entrada.devolver();
  textSize();
  
  //boton
  fill(125);
  noStroke();
  rect(350, 40, 30, 30);
  fill(0);
  triangle(375, 55, 355, 45, 355, 65);


}

void keyPressed() {
  if (keyCode == BACKSPACE || keyCode == DELETE){
    entrada.borrar();
  } else if (key != CODED){
    if(entrada.texte.length() < entrada.limit){
        entrada.afegeix(key);
      }
  }
}











