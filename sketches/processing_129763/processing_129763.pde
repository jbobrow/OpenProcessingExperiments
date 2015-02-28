
Input entrada;
String trianglee = "triangle";
String cuadrat = "cuadrat";
String rodona = "rodona";
String coloor= "color";
int color1= 255;
int color2= 255;
int color3= 255;
boolean cuadrado=false;
boolean triangulo=false;
boolean redonda=false;
PImage foto;
void setup(){
  size(400,400);
  entrada = new Input();
  foto= loadImage("forma.jpg");
}

void draw(){
  background(255);
  entrada.dibuixa();
  image(foto,0,0);
  text("Escriu la figura que vols fer!(en CATALÀ)",100,40);
  text("Escriu COLOR per cambiar de color aleatoriament.",100,60);
  fill(color1,color2,color3);
  if(entrada.texte==cuadrat){
     cuadrado=true;
   }
  if(entrada.texte==trianglee){
     triangulo=true;
  }
  if(entrada.texte==rodona){
     redonda=true;
  }
  if(entrada.texte==coloor){
     color1=random(0,255);
     color2=random(0,255);
     color3=random(0,255);
  }
  if(cuadrado==true){rect(width/6,150,100,100);}
  if(triangulo==true){triangle(200,200,300,300,200,300);}
  if(redonda==true){ellipse(100,300,60,60);}
}
void mousePressed(){
    color1=random(0,255);
    color2=random(0,255);
    color3=random(0,255);
}
void keyReleased() {
  if (keyCode == ENTER || keyCode == RETURN) {
    text("OK", 20,20);
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

/*
!!!! CODI PER SUBCLASSE QUE NOMÉS LLEGEIXI NOMBRES
!!!! FER BOTO PER BORRAR
  if ( key == '0' ||key == '1' || key == '2' ||key == '3' ||key == '4' ||key == '5' ||key == '6' ||key == '7' ||key == '8' ||key == '9' || key == '-') {
      if(resultat.length()<8){
        resultat = resultat.concat (new String(key));
      }
  }
  
}
void mostrarnombre(){
  fill(#030000);
  textFont(font,60);
  text(typedText+(frameCount/10 % 2== 0 ? "_" : ""), 190, 200); 
}
*/
class Input {
  String texte;
  float xPos;
  float yPos;
  int limit;
  PFont fonBoto;
 
  Input (){
    texte = "";
    xPos = width/2-60;
    yPos = 65;
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


