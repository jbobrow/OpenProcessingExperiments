
PImage foto,foto2,foto3,foto4,foto5,foto6,foto7,foto8,foto9,foto10;
Boto b1,b2,b3,b4,b5;
Input entrada;
int pantalla=1;
//nom persona
String texte="";
//medalles
int y=150;
int yy=150;
int yyy=150;
void setup(){
  size(600,400);
  background(0);
  b1 = new Boto((width/2)-40, height/3*2, color(255), 30, 30, 1, 2,"Jugar");
  b2 = new Boto(506, 313, color(255), 20, 50, 2, 3,"");
  b3 = new Boto(412, 147, color(255), 25, 55, 3, 4,"");
  b4 = new Boto(350, 253, color(255), 50, 100, 4, 5,"");
  b5 = new Boto(242,220, color(255), 25, 55, 5, 6,"");
  entrada = new Input(texte,width/3,200,10);
  foto = loadImage("http://1.bp.blogspot.com/-KEUuDAGf8ag/Uky6siiAdYI/AAAAAAAAn38/t-J3yxgEwvY/s30/WMP_Play_button-740053.png");
  foto2 = loadImage("http://files.coloribus.com/files/adsarchive/part_481/4811155/file/kin-nature-dental-hygiene-wheres-wally-small-44252.jpg");
  foto3 = loadImage("http://db2.stb.s-msn.com/i/94/185C34B25FDE3DA556E38E729664E7.jpg");
  foto4 = loadImage("http://www.blogdehumor.com/wp-content/2010/07/Wally.jpg");
  foto5 = loadImage("http://files.gamebanana.com/img/ico/sprays/wally.png");
  foto6 = loadImage("http://www.trofeosps4.es/trofeos/White-Knight-Chronicles/19-Medalla-de-bronce.png");
  foto7 = loadImage("http://www.trofeosps4.es/trofeos/White-Knight-Chronicles/20-Medalla-de-plata.png");
  foto8= loadImage("http://www.karatejoel.com/imagenes/oro.png");
  foto9= loadImage("http://img59.imageshack.us/img59/8354/article009d55976000005d.jpg");
  foto10= loadImage("http://static.guim.co.uk/sys-images/Business/Pix/pictures/2007/01/22/WalkingWaldo128.jpg");
}
void draw(){
  switch(pantalla){
    case 1: menu();break;
    case 2: u();break;
    case 3: dos();break;
    case 4: tres();break;
    case 5: quatre();break;
  }
  println(mouseX+", "+mouseY);
}
void mousePressed(){
  b1.apreta();
  b2.apreta();
  b3.apreta();
  b3.apreta();
  b4.apreta();
  b5.apreta();
}

class Boto {
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti; 
  PFont fonBoto;
  String texte;
  
  Boto(){
    xPos = width/2-20;
    yPos = height/3*2;
    c = color(255,0,0);
    widthB = 40;
    heightB = 40;
    pantallaActual = 1;
    pantallaDesti = 2;
    fonBoto = createFont("Georgia", 12);
    textFont(fonBoto);
    texte = "Boto";
  }
  
  Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){
    fonBoto = createFont("Georgia", 15);
    textFont(fonBoto);
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = inici;
    pantallaDesti = fi;
    texte = t;
  }
  
  //boto daplicacions
  void dibuixaa(){
    strokeWeight(1);
    fill(c, 100);
    rect(xPos, yPos, widthB, heightB, 5);
    fill(255);
    text (texte, xPos+5, yPos + heightB+20);
  }
  
  //boto per cada pantalla
  void casa(){
    strokeWeight(1);
    stroke(255);
    noFill();
    rect(xPos, yPos+10, widthB-10, heightB-10, 5);
    triangle(xPos-15,yPos+10,xPos+45,yPos+10,xPos+15,yPos-10);
  }
  void casa2(){
    strokeWeight(1);
    stroke(255);
    fill(0);
    rect(xPos, yPos+10, widthB-10, heightB-10, 5);
    triangle(xPos-15,yPos+10,xPos+45,yPos+10,xPos+15,yPos-10);
  }
  
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
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
void dos(){
  background(0);
  fill(0);
  rect(0,0,width,30);
  fill(255);
  text(entrada.texte,10,13);
  fill(214,137,13);
  ellipse(70,y,10,10);
   //medalla bronze
   if(y>=10){
       text("Enhorabona "+entrada.texte + " te'ns la medalla de bronze!",100,100);
       image(foto6,242,130);
       y--;
    }
  if(y<=10){
    image(foto3,0,30);
    b3.dibuixaa();
  }
  
}
void menu(){
  image(foto,(width/2)-40, height/3*2);
   textSize(20);
   text("Benvingut al joc de Cercant a Wally!",50,100);
   textSize(15);
   text("Posa el teu nom aqui i comença a jugar!",50,150);
   entrada.dibuixa();
   b1.dibuixaa();
   image(foto5,350,150);
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
void quatre(){
  background(0);
  textSize(30);
  fill(0);
  text("Enhorabona "+entrada.texte + " te'ns la medalla d'or!",100,100);
  image(foto8,242,150);
}

void tres(){
  background(0);
  fill(0);
  rect(0,0,width,30);
  fill(255);
  text(entrada.texte,10,13);
  fill(111);
  ellipse(70,yy,10,10);
   //medalla plata
   if(yy>=10){
       text("Enhorabona "+entrada.texte + " te'ns la medalla de plata!",100,100);
       image(foto7,242,130);
       yy--;
    }
  if(yy<=10){
    image(foto4,0,30);
    b4.dibuixaa();
  }
  
}
void u(){
  background(0);
  image(foto2,0,0);
  b2.dibuixaa();
  fill(0);
  rect(0,0,width,30);
  fill(255);
  noStroke();
  text(entrada.texte,10,13);
}


