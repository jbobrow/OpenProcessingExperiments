
/* @pjs preload="Bowser.png, Luigi.png, mario.png, star.png"; 
 */
//Adan bachir 1r asix (Bowser descartado)V_V
Input entrada; 

PImage r1; //mario
PImage r2; //luigi
PImage star;
//respuestas spoiler
String resp1 = "mario"; 
String resp2 = "luigi"; 
boolean respuesta1=false; 
boolean respuesta2=false; 

void setup(){ 
  size(400,400); 
  entrada = new Input(); 


} 



void draw(){ 
  //println(mouseX+","+mouseY);
  background(104,90,90); 

  entrada.dibuixa(); 

//textos de las pistas
fill(4,11,109);
textSize(25);
text ("Adivina a los dos personajes!",34,40);
text ("*Pistas*",50,80);
textSize(15);
text ("*Los dos son unas leyendas de nintendo",50,120);
text ("*Son hermanos",50, 140);
text ("*Enemigos de Wario y Waluigi",50, 160);

//respuesta1
  if(entrada.texte==resp1){ 
     respuesta1=true; 
  } 

//respuesta2
  if(entrada.texte==resp2){ 
     respuesta2=true; 
  } 
  //mario png
  if(respuesta1==true){r2 =loadImage("mario.png");
image(r2,40,280,80,80);
star =loadImage("star.png");
image(star,40,205,80,80);
  }
  //luigi png
  if(respuesta2==true){r1 =loadImage("Luigi.png");
image(r1,300,280,80,80);
star =loadImage("star.png");
image(star,300,205,80,80);

}
 
  } 




void keyReleased() { 
  if (keyCode == ENTER || keyCode == RETURN) { 
   text("Oki doki", 280,380); 
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


