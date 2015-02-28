
boolean fi;//funciona
  Enemigos[] calle1= new Enemigos[50];
  Enemigos[] calle2= new Enemigos[50];
  Enemigos[] calle3= new Enemigos[50];
int miau;
float m;
float time;
int seguent;
int x;
int a;
PImage fons0,fons1,fons3,fons4,fons5,fons100,fons1000;
PImage fons9;
PImage mort;
int pantalla;
Input entrada;
int vida;
Boolean entrat;
int lane;
PImage bruce;

void setup(){  
  miau=1000;
  mort = loadImage("mort.jpg");
  bruce = loadImage("bruce.png"); 
  entrat = false;
  lane=2;
  vida=3;
  entrada = new Input();
  size(800, 600);
  fons0 = loadImage("MENU.png");
  fons1 = loadImage("1.jpg");
  fons3 = loadImage("3.png");
  fons4 = loadImage("5.png");
  fons5 = loadImage("7.png");
  fons6 = loadImage("d.png");
  fons7 = loadImage("nave.png");
  fons9 = loadImage("cid4.png");
  fons100 = loadImage("CREDITOS.jpg");
  fons1000= loadImage("INSTRUCCIONES.jpg");
  pantalla=0; //0 menu, 1-8 partida, 9 dialogo final, 100 creditos, 1000 instrucciones
  fi=false;
  seguent=0;
  x=0;
  a=0;
  m=millis();
  size (800, 600);
  
  time= (millis()-m)/1000;
  
  for (int i = 0; i < calle1.length;i++){
    calle1[i] = new Enemigos(random(-100, 0), height*0.75, random(1,0.5+pantalla/4), color (random(255),random(255),random(255)));
  }
  for (int i = 0; i < calle1.length;i++){
    calle2[i] = new Enemigos(random(-100, 0), height*0.85, random(1,0.5+pantalla/4), color (random(255),random(255),random(255)));
  }
  for (int i = 0; i < calle1.length;i++){
    calle3[i] = new Enemigos(random(-100, 0), height*0.95, random(1,0.5+pantalla/4), color (random(255),random(255),random(255)));
  }
}
void draw(){
    ++miau;
    
  
    textSize(16);
  switch(pantalla){
    case 0: menu(); break;
    case 1: cutscene0();break;
    case 2: desierto();break;

    case 3: cutscene1(); break;
    case 4: ciudad();break;
    case 5: cutscene2();break;
    case 6: volcan();break;
    case 7: cutscene3();break;
    case 8: rayos();break;
    case 9: dialogo();break;
    case 100: creditos();break;
    case 202: cutscene2(); break; 
    case 203: cutscene3(); break;
    case 204: cutscene4(); break;
    case 1000: instrucciones();break;
  }
  
  if (time > 60 || fi || vida < 0){
    
    if(vida < 0){ 
      image(mort,0,0);
      rect(40, 500, 200, 50); fill(#0000FF);textSize(20);text("REINTENTAR",55, 525);fill(#FF0000);textSize(12);
      if (mousePressed){
        redo();
      }
    }
    else if (time > 60){
      rect(100, 100, 200, 50); fill(#0000FF);textSize(20);text("Siguiente Pantalla",115, 125);fill(#FF0000);textSize(12);
      if (mousePressed && mouseY<0.4*height){
        redo();
        ++pantalla;
      }
    }
    
  }
  else{
  if (pantalla==0){if (mousePressed && mouseY<0.4*height) pantalla=1; else if(mousePressed && mouseY<0.6*height && mouseY>0.4*height) pantalla=1000; else if (mousePressed&&mouseY>0.6*height) pantalla=100;}
   if (pantalla==100  || pantalla == 1000 || pantalla == 1 || pantalla == 3 || pantalla == 5 || pantalla == 7 || pantalla==9){if (pantalla == 1 || pantalla == 3 || pantalla == 5 || pantalla == 7){rect(40, 500, 200, 50); fill(#0000FF);textSize(20);text("CONTINUAR",55, 525);fill(#FF0000);textSize(12);if (mousePressed && mouseX<0.4*width && mouseY>0.8*height){ pantalla+=1;  redo();}} else{ rect(40, 500, 200, 50); fill(#0000FF);textSize(20);text("VOLVER AL MENU",55, 525);fill(#FF0000);textSize(12);if (mousePressed && mouseX<0.4*width && mouseY>0.8*height) pantalla=0;}}

  else if (pantalla != 0 && pantalla != 100 && pantalla !=1000 && pantalla != 1 && pantalla != 3 && pantalla != 5 && pantalla != 7 && pantalla != 9){
  time= (millis()-m)/1000;
  rect(220, 20, (max(0,vida)/1)*100, 20);
  text(vida+"/3", 530, 35);
  text("Tiempo Restante: " + int(60-time), 50, 30);
  strokeWeight(5);
  fill(255,0,0);
  line(0.8*width, height, 0.8*width, height*0.55);
  
  strokeWeight(1);
  
  if (time>a && time <60) {
    calle1[seguent].neix();
    calle2[seguent].neix();
    calle3[seguent].neix();
   
    ++seguent;
    a+=8-pantalla/2;
  }
  
  entrada.dibuixa();
  for (int i = 0; i < calle1.length;i++){
    calle1[i].dibuixa();
    calle1[i].moure();
  }
  
for (int i = 0; i < calle2.length;i++){
    calle2[i].dibuixa();
    calle2[i].moure();
  }
  
  for (int i = 0; i < calle3.length;i++){
    calle3[i].dibuixa();
    calle3[i].moure();
  }

  prota();
  }}
fill(#FF0000);
    rect(700-miau*50, height*(0.55+0.10*lane), 50, 10);
}

 void keyPressed() {
  
  if (keyCode == UP && lane > 1) 
     --lane;
  if (keyCode == DOWN && lane < 3)
     ++lane; 
   
  if (keyCode == ENTER || keyCode == RETURN) {
   
    check();
    entrada.fient();
    miau=0;
     
  }
  if (keyCode == BACKSPACE || keyCode == DELETE){
    entrada.borrar();
  }
  else if (key != CODED && key != ENTER && key != RETURN){
    if(entrada.texte.length() < entrada.limit){
        entrada.afegeix(key);
      }
  }
  
  
   
}

void check(){
  
  
  
  for (int i = 0; i < calle1.length; ++i){
    
    switch(lane){
    
      case 1: 
        if(parseInt(entrada.texte) == calle1[i].eq.resultat)// INTRODUIR || parseInt(entrada.texte) == 1 PER TESTEJAR (MATES TOT AMB UN 1)
          calle1[i].mor()
        ;break;
      case 2: 
        if(parseInt(entrada.texte) == calle2[i].eq.resultat)
          calle2[i].mor()
        ;break;
      case 3: 
        if(parseInt(entrada.texte) == calle3[i].eq.resultat)
          calle3[i].mor()
        ;break;
    }
    
  }
  
}

void prota(){ /*FUNCIO DEL PROTAGONISTA*/
    if(vida >=0 && time <60){
    switch(lane){
    
      case 1: 
        image(bruce, width*0.8, height*0.55);
        break;
      case 2: 
        image(bruce, width*0.8, height*0.65);
        break;
      case 3: 
        image(bruce, width*0.8, height*0.75);
        break;
    }
    }
}

void redo(){
  
  entrat = false;
  lane=2;
  vida=3;
  fi=false;
  seguent=0;
  x=0;
  a=0;
  m=millis();
  
  time= (millis()-m)/1000;
  
  for (int i = 0; i < calle1.length;i++){
    calle1[i] = new Enemigos(random(-100, 0), height*0.75, random(1,pantalla/3)-0.2, color (random(255),random(255),random(255)));
  }
  for (int i = 0; i < calle1.length;i++){
    calle2[i] = new Enemigos(random(-100, 0), height*0.85, random(1,pantalla/3)-0.2, color (random(255),random(255),random(255)));
  }
  for (int i = 0; i < calle1.length;i++){
    calle3[i] = new Enemigos(random(-100, 0), height*0.95, random(1,pantalla/3)-0.2, color (random(255),random(255),random(255)));
  }
}
class Equacio{
  String pregunta;
  int resultat;
   int k,j,h;
  
  Equacio(){
    k=((int) random(1,10));
    j=((int) random(1,10));
    h=Math.pow(2, 4);
    pregunta= k + "";
    pregunta+=(" + ");
    pregunta+=j + "";
    resultat=(int)(k+j);
  }
  
  Equacio(int x){
    switch(x){
      case 1: 
      k=((int) random(1,10));
      j=((int) random(1,10));
      h=Math.pow(2, 4);
      pregunta= k + "";
      pregunta+=(" + ");
      pregunta+=j + "";
      resultat=(int)(k+j);
      break;
      
      case 2:
      
      k=((int) random(1,10));
      j=((int) random(1,10));
      l=Math.pow(2, 4);
      pregunta= k + "";
      pregunta+=(" - ");
      pregunta+=j + "";
      resultat=(int)(k-j);
      break;
      
      case 3:
      
      k=((int) random(1,10));
      j=((int) random(1,10));
      l=Math.pow(2, 4);
      pregunta= k + "";
      pregunta+=(" * ");
      pregunta+=j + "";
      resultat=(int)(k*j);
      break;
      
      case 4:
      
      k=((int) random(1,10));
      j=((int) random(1,4));
      l=Math.pow(k, j);
      pregunta= k + "";
      pregunta+=(" ^ ");
      pregunta+=j + "";
      resultat=(int)(l);
      break;
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
    rect (xPos, yPos, 150, 30);
    fill(#030000);
    text (texte+(frameCount/10 % 2== 0 ? "_" : ""), xPos + 10, yPos + 20);
    
  }
   
  void borrar(){
      texte = texte.substring(0,max(0,texte.length()-1));
  }
   
  void afegeix(char key){
   texte = texte.concat (new String(key));
  }
  
  void fient(){
  
      texte="";
  }
}

void menu(){
  image(fons0,0,0);
  fill(#C90808);
}
void desierto(){
  image(fons1, 0, 0);
  fill(#C90808);

}


void ciudad(){
  image(fons3, 0, 0);
  fill(#C90808);

}

void volcan(){
  image(fons4, 0, 0);
  fill(#C90808);

}

void rayos(){
  image(fons5, 0, 0);
  fill(#C90808);

}

void creditos(){
  image(fons100, 0, 0);
  fill(#C90808);

}

void instrucciones(){
  image(fons1000, 0, 0);
  fill(#C90808);

}

void dialogo(){
  image(fons6,0,0);
   fill(#C90808); 
}


void cutscene0(){
  image(fons1, 0, 0);
  fill(#C90808);
  textAlign(LEFT);  
  text("La humanidad siempre ha querido saber si hay vida mas allá de nuestro planeta, hace poco se avistaron", 60,170);
  text("OVNIS en los cielos terrícolas y la gente comenzó a ser abducida para los propósitos científicos y curiosos",60,185);
  text("de los aliens. Tú eres uno de esos abducidos y eres el único que ha conseguido escapar de la nave con",60,200); 
  text("vida. Debido a los experimentos que los alienigenas hicieron con tu cuerpo, ahora tienes poderes para",60,215);
  text("combatirlos. Al caer de la nave, pierdes el conocimiento y, al despertarte, te encuentras en un desierto.",60,230);
}

void cutscene1(){
   image(fons3, 0, 0);
  fill(0,255,255);
  textAlign(LEFT);  
  text("Cuando llegas a la ciudad, te la encuentras destruida por los ataques alienígenas.", 90,20);
}

void cutscene2(){
  image(fons9, 0, 0);
  fill(#047910);
  textAlign(LEFT);  
  text("De repente ves que en medio de la ciudad ha crecido un enorme volcán.", 90,20);
}

void cutscene3(){
  image(fons7,0,0);
   fill(#0000FF); 
   
  text("Cuando llegas a la parte más alta del volcán, te encuentras con la nave de los alienigenas.", 90,20);
  fill(#FF0000);
}


class Enemigos {
  color c;
  float xPos;
  float yPos;
  float xSpeed;
  PImage m;
  boolean viu;
  Equacio eq;
  
  
  Enemigos(){
    eq=new Equacio();
    c = color(255,0,0);
    xPos = width/2;
    yPos = height/2;
    xSpeed = 3;
    m=loadImage("Juer.png");
    viu=false;
  }
  Enemigos(float x, float y, float vel, color newC){
    
    c = newC;
    xPos = x;
    yPos = y;
    xSpeed = vel; //cambiado de 1 a vel
    textSize(20);
    textSize(12);
    int g=(int)random(1,4);
    
    switch(g){
      case 1: m=loadImage("Juer.png");break;
      case 2: m=loadImage("Bestia.png");break;
      case 3: m=loadImage("Centurion.png");xSpeed+=0.5;break;
      case 4: m=loadImage("Lasionse.png");break;
    }
    eq=new Equacio(g);
    
    if (vel > 2) m=loadImage("Lasionse.png");
    viu=false;
  }
  void dibuixa(){
    if(viu){fill(255);
    rect(xPos-5, yPos-115, 50, 20);  fill(0);
    text(eq.pregunta, xPos, yPos-100);
    fill(c);
    image(m, xPos, yPos-100);
    fill(0);
    }
  }
  void moure(){
    if (viu) xPos = (xPos + xSpeed)%width;
    if  (xPos>width*0.8&&viu) {mor();--vida;}
    
    
    
  }
  
  void neix(){
    viu=true;
  }
  
  void mor(){
    viu= false;
  }
  
  
}

/*
class Calles{
  Enemigos[] enem;
  int ypos;
  
  calles(int y){
    ypos=y;
  }
    */
  


