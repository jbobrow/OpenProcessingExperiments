
/* @pjs preload="titulo.png,pantalla4.jpg, granger.png,balla.png,vaca0.png,vaca1.png,vaca2.png,vaca3.png,catalan.gif,castellano.gif,ingles.png,granja.png,fons.jpg,activa.png,negra.png,vaca1.png,flecha.gif",ranquing.jpg; */

/*1=IDIOMAS, 2=INPUT, 3=HISTORIA, 4=JOC, 5=GAMEOVER, 6=RANKING, 7=CREDITS*/
InputUsuari inputUsuari;
Idiomas textos = new Idiomas();

PImage img2,img3,img4,img5,img6,img8,ranquing,vaca1,vaca0,vaca2,vaca3,valla,granger,catalan,castellano,ingles,granja,titulo,vidactiva,vidanegra;
Boto b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11;
int pantalla=1;
int numidioma=2; 
  boolean repetir = true;
  PImage fons;
  PImage granger;
  PImage granja;
  int numerovacas=500;    //cantidad de vacas que aparecen!
  int numniveles=8;      //cantidad de niveles que aparecen!
  int vidasr=5;         //cantidad de vidas que aparecen!
  int tiempovaca=6;    //timpo entre vaca y vaca!   
  int quantitat = 10; //quantitat de punts que augmenta el comptador amb cada polsacio
  int[] numeroaleatorio= new int[numerovacas];
  int[] tipoaleatorio= new int[numerovacas];
  int vactual=0;  
  Vaca[] vaca = new Vaca[numerovacas]; //array de vacas
  Vidas[] lifes = new Vidas[vidasr];
  Indicador flechaa;
  int contador=0;
  boolean reiniciado = false;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Input entrada;
  String respuesta=0;
  int nivelr=0;  
  Puntuacio score;
  int punts = 0;
  float x;
  float y;
  boolean[] niveles = new boolean[numniveles];
  Niveles[] nivel = new Niveles[numniveles];
  Llamarcosa cosa = new Llamarcosa();
  Temps cronometre;
  Creditos creditosos = new Creditos();
  Ranking ranc;
  Comenzar todo = new Comenzar();
  Maxim maxim;
  AudioPlayer juego;////////////////////////////////para poner mas musicas tambien has de poner esto!
  AudioPlayer aplausos;
  AudioPlayer gameover;

void setup(){
  size(1000, 600); 
  background(0);
  textSize(30);
  textAlign(CENTER);
  text("CARGANDO EL JUEGO",width/2,height/2);
  textAlign(LEFT);
   ////////////////////////////////////////////////////////////////////////////musica!!!
  maxim = new Maxim(this); 
  juego    = maxim.loadFile( "juego.mp3"     );
  aplausos = maxim.loadFile( "aplausos.mp3"  );
  gameover = maxim.loadFile( "gameover.mp3"  );
  todo.comienzozetup(); 
}
void draw(){    
 todo.comienzodraw();
  
}
void mousePressed(){
 todo.comiezopulsaraton();
}


void keyReleased(){  
todo.comienzoentradas();   
} 

PImage jjj;
class Creditos{
  PImage jjj;
  
  Creditos(){
     jjj = loadImage("creditos.jpg");     
  }
 

  
 void drawcreditos(){ 
   background(0);  
  textSize(40);
  image(jjj,0,0,1000,600);  
  fill(255,255,0);  
  textos.textcreditos();
  fill(0);  
 } 
}
class Puntuacio{
  int xPos;
  int yPos;
  float augment;
   
  Puntuacio(int x, int y, float a){
    xPos = x;
    yPos = y;
    augment = a;
  }
 
  void dibuixa(){
    if(punts>=99999){
      punts=99999;
    }
    noStroke();
    // fill(30,30,200);
    fill(183,34,11);//color de fondo 
    rect(xPos+130,yPos-28,390,56);
    fill(255,0,0);//color del numero de puntuacion
    
    textSize(20);
    strokeWeight(2.5);
    text(punts, xPos+270, yPos+8);
    
    fill(255,255,0);//color de fondo 
    rect(xPos+175,yPos-14,305,29);//
    fill(255,0,0);//color del numero de puntuacion
    
    textSize(20);
    strokeWeight(2.5);
    text(punts, xPos+330, yPos+8);//posicio del numero en el ranking
    strokeCap(SQUARE);
    stroke(0);
    line(xPos+175,yPos-15,xPos+480,yPos-15); //primera horitzontal
    line(xPos+175,yPos-15,xPos+175,yPos+15); //primera vertical
    stroke(0);
    line(xPos+175,yPos+15,xPos+480,yPos+15); //segona horitzontal
    line(xPos+480,yPos-15,xPos+480,yPos+15); //segona vertical
    
    stroke(0);
    line(xPos+130,yPos-28,xPos+520,yPos-28); //primera horitzontal
    line(xPos+130,yPos-28,xPos+130,yPos+28); //primera vertical
    stroke(0);
    line(xPos+130,yPos+28,xPos+520,yPos+28); //segona horitzontal
    line(xPos+520,yPos-28,xPos+520,yPos+28); //segona vertical
  }
   
  void puntua(){
    if(punts<=99999){
      punts += augment;
    }else{
      punts = 99999;
    }
  }
  void puntosfinal(){
    return punts;
  }
  void puntreinicia(){
    punts = 0;
  }
}
class Vidas{
  int xPos;
  int yPos;
  PImage img;
  PImage imgn;
  boolean vida= true;
  
  
Vidas(){
  xPos = 50;
  yPos = 50;
  img = loadImage("activa.png");
  imgn = loadImage("negra.png");
} 

Vidas(int x){
  xPos = x;
  yPos = 10;
  img = loadImage("activa.png");
  imgn = loadImage("negra.png");  
}


void dibuixa(){
  if(vida==true){
 image(img,xPos,yPos,49,54);
  }else{
 image(imgn,xPos,yPos,49,54);
  }
}
void vidamenos(){
  vida=false;
}
boolean sigueviva(){
  return vida;
}

}


class Vaca{
  
  PImage vaca1;
  int posx;
  int posy;
  int velocidad;
  int limite;
  boolean viva;  
  Operacion uno;
  int tipo;
 
  
    Vaca(){
      posx=100;
      posy=height/2;
      velocidad=1;
      vaca1 = loadImage("vaca1.png");
      limite = 800;
      Operacion uno = new Operacion();
    }
    
    Vaca(int x, int y, int v,int l,int t){
      posx=x;
      posy=y;
      velocidad=v;
      tipo=t;
     if(tipo>0&&tipo<100){
      
      vaca1 = loadImage("vaca0.png");
     }if(tipo>=100&&tipo<200){
      
      vaca1 = loadImage("vaca1.png");
     }if(tipo>=200&&tipo<300){
      
      vaca1 = loadImage("vaca2.png");
     }if(tipo>=300&&tipo<400){
   
      vaca1 = loadImage("vaca3.png");
     }
      
      limite=l; 
      viva =true;
      uno = new Operacion();
    }
    int xvaca(){
      return posx;
    }
    int yvaca(){
      return posy;
    }
    int vvaca(){
      return velocidad;
    }
    String resultado(){
      return uno.resultado();
    }
    boolean estado(){
      return viva;
    }
    
    void vacacapturada(){
        posx=-300;
        velocidad=0;
        
    }
    
    void dibuja(){
   if(posx>=100&&posx<=limite){          
       image(vaca1, posx, posy,237,169);         
       fill(0);
       textAlign(RIGHT);
       if(tipo>0&&tipo<100){
       textSize(12);
       text(uno.exponentea()+"     "+uno.exponenteb(),posx+99,posy+78);
       textSize(14);
       text(uno.numeroa()+"  +"+uno.numerob()+"  = ?",posx+120,posy+85);
       textSize(13);
       }
       if(tipo>=100&&tipo<200){
       textSize(12);
       text(uno.exponentea()+"     "+uno.exponenteb(),posx+104,posy+78);
       textSize(14);
       text(uno.numeroa()+"  +"+uno.numerob()+"  = ?",posx+125,posy+85);
       textSize(13);
       }
       if(tipo>=200&&tipo<300){
       textSize(12);
       text(uno.exponentea()+"     "+uno.exponenteb(),posx+104,posy+68);
       textSize(14);
       text(uno.numeroa()+"  +"+uno.numerob()+"  = ?",posx+125,posy+75);
       textSize(13);
       }
       if(tipo>=300&&tipo<400){
       textSize(12);
       text(uno.exponentea()+"     "+uno.exponenteb(),posx+104,posy+83);
       textSize(14);
       text(uno.numeroa()+"  +"+uno.numerob()+"  = ?",posx+125,posy+90);
       textSize(13);
       }
       
       textAlign(LEFT);
   }
      if(posx>=limite){ //muerta
        posx=-300;
        velocidad=0;
        viva=false;
       // println("muerta");
        lifes[vidasr-1].vidamenos();
        if(vidasr>1){
        
        vidasr--;
        }
       
        if(vactual<numerovacas-1){
        vactual++;        
        flechaa.cambiarVaca(vaca[vactual].xvaca(),vaca[vactual].yvaca(),vaca[vactual].vvaca());
        }else{
          flechaa.cambiarVaca(-200,100,0);
        }
      }      
    }
    void moure(){
     
      posx=posx+velocidad;
      }
  
}
class Boto {
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti;
  String texte;
  
  Boto(){
    xPos = width/2-50;
    yPos = height/2+100;
    c = color(#249627);
    widthB = 120;
    heightB = 30;
    pantallaActual = 1;
    pantallaDesti = 2;
   
    texte = "Anglès";
  }
  Boto(float x, float y, color col, float w, float h, int inici, int fi, String t){
    
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = inici;
    pantallaDesti = fi;
    texte = t;
  }
  
  void dibuixaboto(){
    textSize(20);
    fill(c);
    rect(xPos, yPos, widthB, heightB, 5);
    fill(255);
    text (texte, xPos + 10, yPos + 20);
  }
  
  void apretaa(int h){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
      numidioma=h;
    }
  }
    void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && pantalla == pantallaActual){
      pantalla = pantallaDesti;
    }
  }
  void pasasig(){
    pantalla = pantallaDesti;
  }
  

}
class Comenzar{
 
  
void comienzozetup(){
 cosa.hacer();
  ranc = new Ranking();
    cronometre = new Temps();  

  /*BOTONES*/
   b1 = new Boto(); //pantalla 1- pantalla 2 es el de ingles
  b2 = new Boto(450, height/2+50, color(#249627), 120, 30, 1, 2, "Castellà");
  b3 = new Boto(450, height/2, color(#249627), 120, 30, 1, 2, "Català");
  //aquest boto es perque vegis les pantalles només, en realitat no podras clicar seguent a la pantalla de joc i demés
  b4 = new Boto(1000/2, height/2+180, color(#249627), 100, 30, 2, 3, textos.textboton());
  b5 = new Boto(1000/2+250, height/2+200, color(#249627), 100, 30, 3, 4, textos.textboton());
  b6 = new Boto(5,5, color(#249627), 100, 30, 4, 5, textos.textboton());
  b7 = new Boto(1000/2+200, height/2+200, color(#249627), 100, 30, 5, 6, textos.textboton());
  b8 = new Boto(1000/2-120, height/2+220, color(#249627), 170, 30, 7, 1, "Inici, Inicio, Start");
  b9  = new Boto(370, 500, color(#249627), 40, 30, 6, 7, "No");
  b10 = new Boto(480, 500, color(#249627), 40, 30, 6, 4, textos.textno()); 
  b11 = new Boto(1000/2+220, height/2+200, color(#249627), 250, 30, 1, 7, "Crèdits, Creditos, Credits"); 
  /*INPUT*/
   inputUsuari = new InputUsuari();
   
   ///////////////////////////////////////////////////////////////////////tiooooo tenias lo de cargar las imagenes en el draw!!!!!!!!!!!!!!!!!!!!!! cargaba las imagenes en cada vuelta!!
   ////////////////////////////////////////////////////////////////////// muy mal! XD
   
 /*animales*/
  vaca0 = loadImage("vaca0.png");
  vaca1 = loadImage("vaca1.png");
  vaca2 = loadImage("vaca2.png");
  vaca3 = loadImage("vaca3.png");
  /*imagenes de pantallas*/  
  img3= loadImage("pantalla4.jpg");  
  ranquing = loadImage("ranquing.jpg");
  valla = loadImage("balla.png");
  granger = loadImage("granger.png");
  granja =loadImage("granja.png");
  /*fondos*/
  
  /*idiomes*/
  catalan = loadImage("catalan.gif");
  castellano = loadImage("castellano.gif");
  ingles = loadImage("ingles.png");
  titulo = loadImage("titulo.png");
  vidactiva = loadImage("activa.png");
  vidanegra = loadImage("negra.png");

} 

void comienzodraw(){
textSize(20);  
  /*CANVI DE PANTALLA*/
  switch(pantalla){
    case 1: pantalla1();break;
    case 2: pantalla2();break;
    case 3: pantalla3();break;
    case 4: pantalla4();break;
    case 5: pantalla5();break;
    case 6: pantalla6();break;
    case 7: pantalla7();break;
    
  }
}

void comiezopulsaraton(){
  b1.apretaa(1);
  
  b2.apretaa(2);
   
  b3.apretaa(3);
  
  if(!inputUsuari.nombreusuari().equals("")){
  b4.apreta();
  }
  b5.apreta();  
  b7.apreta();
  b8.apreta();
  b9.apreta();
  b10.apreta();
   
  b11.apreta();
  
}

void comienzoentradas(){
    if (keyCode == BACKSPACE || keyCode == DELETE){
    if(pantalla==2){
      inputUsuari.borrarinput();
    }
    if(pantalla==4){
      entrada.borrar();
    }
}

else if ( key != CODED && !( key == '0' ||key == '1' || key == '2' ||key == '3' ||key == '4' ||key == '5' ||key == '6' ||key == '7' ||key == '8' ||key == '9' || key == ENTER)){
   if(pantalla==2){  
  if(inputUsuari.nomUsuari.length() < inputUsuari.limit){
        inputUsuari.afegeixinput(key);
      }
   }
  }
 else if ( key == '0' ||key == '1' || key == '2' ||key == '3' ||key == '4' ||key == '5' ||key == '6' ||key == '7' ||key == '8' ||key == '9'){
    if(pantalla==4){ 
   if(entrada.texte.length() < entrada.limit){
        entrada.afegeix(key);
      }
    }
  }    
}
}

class Indicador{
  int posx;
  int posy;
  int  vel;
  PImage flecha;
  
  
  Indicador(){
    posx = 200;
    posy = 200;
    vel = 1;
    flecha= loadImage("flecha.gif");
  }

  
  Indicador(int posicionx, int y, int velocidad){
    posx = posicionx;
    posy = y;
    vel = velocidad;
    flecha= loadImage("flecha.gif");
  
  }
  
  void dibuixa(){
    if(posx>=100&&posx<=800){
     image(flecha, posx+130, posy-20); 
    
    } 
    
  }
  void cambiarVaca(int posicionx, int y, int velocidad){
    posx = posicionx;
    posy = y;
    vel = velocidad;
    flecha= loadImage("flecha.gif");
  }
 void moure(){     
      posx=posx+vel;
      }
 
 void moureflecha(){
    for(int i=0;i<15;i++){
       posy++;
     }
      for(int i=0;i<15;i++){
       posy--;
     }
 
 }
   

  
  
  
  
  
  
  
  
  
}
class Input {
  String texte;
  float xPos;
  float yPos;
  int limit;
 
  String texte2;
  
 
  Input(){
    
    texte = "";
    xPos = 550;
    yPos = 300;
    limit = 3;
    
    texte2 = "";
   
  }
  
  
  Input (String r, float x, float y, int l, String t){
    texte = r; 
    xPos = x;
    yPos = y;
    limit = l;    
    texte2 = t;
  }  
  void dibuixa(){
    
    fill(#61D6D8);
    rect(0,540,1000,100);
    fill(#61D6D8);
    rect(xPos+30,yPos+250,80,40,5);
    noStroke (0);
    fill(0);
    strokeWeight(95);
    textSize(30);
    textAlign(RIGHT);
    text (texte, xPos + 90, yPos + 280);  
    text ((frameCount/10 % 2== 0 ? "_" : ""), xPos + 90, yPos + 280);
    textAlign(LEFT);
    textos.textojuego();
  }
  void borrar(){ 
      texte = texte.substring(0,max(0,texte.length()-1));
  }
  void vaciar(){
    texte = "";
  }
  
  void afegeix(char key){
    texte = texte.concat (new String(key));
  }
  int resultado(){
    return (int)texte;
  }
}
class InputUsuari {
  String nomUsuari;
  float xPos;
  float yPos;
  int limit;
  InputUsuari(){
    
    nomUsuari = "";
    xPos = 550;
    yPos = 300;
    limit = 10;
    
   
   
  }
  
  
  InputUsuari (String r, float x, float y, int l){
    nomUsuari = r; 
    xPos = x;
    yPos = y;
    limit = l;    
    
  }  
  void dibuixainput(){
   
    fill(255,0,0);
    rect(xPos-200,yPos-10,300,50,50);
    textSize(30);
    fill(0);
    textAlign(RIGHT);
    
    text (nomUsuari, xPos+50, yPos+25);  
    text ((frameCount/2 % 20== 0 ? "_" : ""), xPos+50, yPos+20);
    textAlign(LEFT);
  }
  void borrarinput(){ 
      nomUsuari = nomUsuari.substring(0,max(0,nomUsuari.length()-1));
  }
  void vaciarinput(){
    nomUsuari = "";
  }
  
  void afegeixinput(char key){
    nomUsuari = nomUsuari.concat (new String(key));
  }
  String nombreusuari(){
    return (String)nomUsuari;
  }
}
class Idiomas{
  String sig="error";
  String si="error";
  
  void textno(){
     if(numidioma==2){
   si="si";}
    if(numidioma==3){
   si="si";}
      if(numidioma==1){
   si="yes";}
   return si;
  }
  void textboton(){
    if(numidioma==2){
   sig="siguiente";}
    if(numidioma==3){
   sig=" següent";}
      if(numidioma==1){
   sig="   next";}
   return sig;
  }
    
 void introducenombre(){
   if(numidioma==3){
   text("Granger/a, introdueix el teu nom:", 150,100);
   }
   if(numidioma==1){
   text("Farmer, write your name:", 150,100);
   }
   if(numidioma==2){
   text("Grangero/a, introduce tu nombre:", 150,100);
   }
   
 }
 
 void introduccion(){
  if(numidioma==2){
  text("Hola "+inputUsuari.nombreusuari()+" Eres el único grangero/a que puede salvar ",120,370);
  text("a los animales para que no escapen de la granja!!, para conseguirlo ",120,420);
  text("necesitarás resolver cada operación i escribir su resultado con el ",120,460);
  text("teclado! No olvides resolverlas en orden i empezar por el animal",120,500);
  text("marcado con una flecha! Mucha suerte con las Matemáticas!",120,540);
   }
  if(numidioma==3){
  text("Hola "+inputUsuari.nombreusuari()+" Ets l'únic granger/a que pot salvar els animals",120,370);
  text("perque no s'escapin de la granja!!, per aconseguir-ho hauràs de",120,420);
  text("resoldre cada operació i escriu-re el resultat amb el teclat!, no",120,460);
  text("oblidis resoldre les operacions en ordre i començar per l'animal",120,500);
  text("marcat amb una fletxa! Molta Sort amb les Matemàtiques!",120,540);
  }
  if(numidioma==1){
  text("Hi "+inputUsuari.nombreusuari()+" You are the only farmer can save animals",120,370);
  text("for that they won't scape out of farm! To get it you will need",120,420);
  text("resolve each operation and write the result with keyboard! Don't",120,460);
  text("forget resolve in order and start with the animal",120,500);
  text("that have red arrow! Good Luck with Mathematics!",120,540);
  }
 }
 
 void textojuego(){
   if(numidioma==1){  
    text("Input your answer",550-300,300+280);
    fill(0);
    text("Level",650,25);
    textSize(15);
    text("Time",920,25);
   }
   if(numidioma==2){
    text("Introduce tu respuesta",550-300,300+280);
    fill(0);
    text("Nivel",650,25);
    textSize(15);
    text("Tiempo",920,25);
   }
   if(numidioma==3){  
    text("Introdueix la resposta",550-300,300+280);
    fill(0);
    text("Nivell",650,25);
    textSize(15);
    text("Temps",920,25);
   }
   
 }
 void rankingg(){
   if(numidioma==1){  
    text("Name",340,100+90);  
    text("Position",530,100+90);  
    text("Points",650,100+90); 
    text("Continue?",450,480);
   }
   if(numidioma==2){
    text("Nombre",340,100+90);  
    text("Puesto",530,100+90);  
    text("Puntos",650,100+90);
   text("Continuar?",450,480); 
   }
   if(numidioma==3){  
    text("Nom",340,100+90);  
    text("Lloc",530,100+90);  
    text("Punts",650,100+90); 
    text("Continuar?",450,480);
   }
 }
 void textgameover(){
   
 }
 void textcreditos(){
   if(numidioma==1){
     text("Head of Design - Andrea Serrano \n Head of Programming - Daniel González \n Project Manager - Xavier Andújar", 200, 300);
   }
   if(numidioma==2){
     text("Jefe de Diseño - Andrea Serrano \n Jefe de Programación - Daniel González \n Jefe de Proyecto - Xavier Andújar", 200, 300);
   }
   if(numidioma==3){
     text("Cap de Disseny - Andrea Serrano \n Cap de Programació - Daniel González \n Cap de Projecte - Xavier Andújar", 200, 300);
   }

 }
}
class Llamarcosa{

void hacer(){
  fons = loadImage("fons.jpg");
  granger = loadImage("granger.png");

       for(int i=0;i<numerovacas;i++){  
  numeroaleatorio[i]=(int)random(100,350);//numero para el random
  tipoaleatorio[i]=(int)random(0,399);//numero para el random
   }  
  for(int i=0;i<numerovacas;i++){  //genera las vacas fuera de la pantalla para que no se vena al principio
  vaca[i] = new Vaca(-180,numeroaleatorio[i],1,800,tipoaleatorio[i]);
  }
   respuesta=vaca[0].resultado();
    for(int i=0; i<lifes.length;i++){          
      lifes[i] = new Vidas((i*38)+5);         
  }
   flechaa = new Indicador(vaca[vactual].xvaca(), vaca[vactual].yvaca(), vaca[vactual].vvaca());    
   entrada = new Input();
   score = new Puntuacio(80,30,quantitat); 
   for(int i=0; i<nivel.length;i++){    
      niveles[i]= true;
      nivel[i] = new Niveles((i*30)+300,i*150);     
   }
   
}

void dibuja(){  
  
  image(fons,0,0, 1000,550);
  image(granger,-10,310, 150,240);

  cronometre.dibuixaCronometre();  
  respuesta=vaca[vactual].resultado();
 /*cada "tiempovaca" se genera una "vaca"*/
 for(int i=0;i<numerovacas;i++){
 if(cronometre.tempstotal()>=i*tiempovaca){ 
     vaca[i].moure();
  }
 }  
  /*
 for(int i=0;i<vaca.length;i++){///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  text(vaca[i].resultado(),100,100+i*20);
  text(vaca[i].xvaca(),150,100+i*20);
  text(vaca[i].estado(),200,100+i*20);  
  }
  */
  for(int i=0;i<numerovacas;i++){   
    vaca[i].dibuja();    
  }
 for(int i=0;i<vaca.length;i++){ 
 if(vaca[i].xvaca()>=800){
   escapada[i]=true;     
 } 
 }  
   for(int i=0; i<lifes.length;i++){    
    lifes[i].dibuixa();   
 }
flechaa.dibuixa();

flechaa.moure(); 
    score.dibuixa();  
  entrada.dibuixa();
  if(respuesta.equals(entrada.resultado())&&keyPressed&&key==ENTER){
     vaca[vactual].vacacapturada();
     entrada.vaciar();
     score.puntua();
     if(vactual<numerovacas-1){
     vactual++;
     flechaa.cambiarVaca(vaca[vactual].xvaca(),vaca[vactual].yvaca(),vaca[vactual].vvaca());
     }else{
          flechaa.cambiarVaca(-200,100,0);
        }
  }    
  flechaa.moureflecha();
 for(int i=0; i<nivel.length;i++){
        if(niveles[i]==false){
           nivel[i].dibuixa();
        }
 }
  if(lifes[0].sigueviva()==false){
          
          b6.pasasig();
          juego.stop();
        }
  if(vaca[vaca.length-1].xvaca()==-300){
          
          b6.pasasig();
          juego.stop();
          gameover.stop();
          aplausos.stop(); 
  }
  

}
void reiniciacosa(){
   numerovacas=500;    //cantidad de vacas que aparecen!
   numniveles=8;      //cantidad de niveles que aparecen!
   vidasr=5;         //cantidad de vidas que aparecen!
   tiempovaca=6;    //timpo entre vaca y vaca!   
   quantitat = 10; //quantitat de punts que augmenta el comptador amb cada polsacio
   numeroaleatorio= new int[numerovacas];
   tipoaleatorio= new int[numerovacas];
   vactual=0;  
   vaca = new Vaca[numerovacas]; //array de vacas
   lifes = new Vidas[vidasr];
  Indicador flechaa;
  int contador=0;
cosa.hacer();
 cronometre.reinicia(); 
 score.puntreinicia();
 vactual=0;  
}  
}
class Niveles{
  int xPos;
  int yPos;
  PImage img;
 
  
Niveles(){
  xPos = 650;
  yPos = 250;
  img = loadImage("niveles.png");
  

} 

Niveles(int x, int y){
  xPos = x+295;
  yPos = 30;
  img = loadImage("niveles.png");
  
}

void dibuixa(){
 image(img,xPos,yPos,55,45);
 fill(255,0,0);
 
 
 
}
}

class Operacion{
  int numero1;
  int numero2;
  int exponente1;
  int exponente2;
  int resultado1=1;
  int resultado2=1;
  int resultadofinal=1;
  
    Operacion(){
      numero1=(int)random(0,9);
      numero2=(int)random(0,9);
      exponente1=(int)random(0,3);
      exponente2=(int)random(0,3);  
      
   for(int i=0;i<exponente1;i++){
        if(numero1>0){     
         resultado1=resultado1*numero1;
        }else{
          resultado1=0;
        }
      }
      for(int i=0;i<exponente2;i++){
        if(numero2>0){     
         resultado2=resultado2*numero2;
        }else{
          resultado2=0;
        }
      }
     resultadofinal=resultado1+resultado2;
     
    }
    String operacion(){
     return numero1+"^"+exponente1+"+"+numero2+"^"+exponente2+"=¿ ?";
    }
    String numeroa(){
      return numero1;
    }
    String numerob(){
      return numero2;
    }
    String exponentea(){
      return exponente1;
    }
    String exponenteb(){
      return exponente2;
    }
    String resultado(){
      return resultadofinal;
    }
    
    
    void dibuja(){      
     
      fill(255);
       text(numero1+"^"+exponente1+"="+resultado1,100,100);
       text(numero2+"^"+exponente2+"="+resultado2,100,130);
    }
  
}
void pantalla1(){
  background(0,255,0);
  /*botons de la p1*/
  b1.dibuixaboto();
  b2.dibuixaboto();
  b3.dibuixaboto();
  b11.dibuixaboto();
  /*foto de la valla*/
  image(valla,130,150);
  /*bocata*/
  fill(255);
  ellipse(470,100,400,150);
  ellipse(250,120,20,20);
  ellipse(230,150,15,15);
  ellipse(210,180,10,10);
  fill(0,0,255);
  /*bocata que indica a l'usuari que escolleixi un idioma*/
  text("Escull el teu idioma!",370,140);
  text("Escoge tu idioma!",370,110);
  text("Choose your language!",370,80);

  /*animales que decoran la p1*/
  image(vaca1,70,450,200,150);
  image(vaca0,550,420,200,150);
  image(granger,120,230,170,250);
  /*imatges de les banderes d'idiomes*/
  image(catalan,545,305,20,20);
  image(castellano,545,355,20,20);
  image(ingles,545,405,20,20);
  /*nom del joc*/
  image(titulo,330,195);
  inputUsuari.vaciarinput();
    
}
/*PANTALLA INPUT NOM DE L'USUARI*/
void pantalla2(){
   b1 = new Boto(); //pantalla 1- pantalla 2 es el de ingles
  b2 = new Boto(450, height/2+50, color(#249627), 120, 30, 1, 2, "Castellà");
  b3 = new Boto(450, height/2, color(#249627), 120, 30, 1, 2, "Català");
  //aquest boto es perque vegis les pantalles només, en realitat no podras clicar seguent a la pantalla de joc i demés
  b4 = new Boto(1000/2, height/2+180, color(#249627), 100, 30, 2, 3, textos.textboton());
  b5 = new Boto(1000/2+250, height/2+200, color(#249627), 100, 30, 3, 4, textos.textboton());
  b6 = new Boto(5,5, color(#249627), 100, 30, 4, 5, textos.textboton());
  b7 = new Boto(1000/2+200, height/2+200, color(#249627), 100, 30, 5, 6, textos.textboton());
  b8 = new Boto(1000/2-120, height/2+220, color(#249627), 170, 30, 7, 1, "Inici, Inicio, Start");
  b9  = new Boto(370, 500, color(#249627), 50, 30, 6, 7, "No");
  b10 = new Boto(480, 500, color(#249627), 50, 30, 6, 4, textos.textno()); 
  b11 = new Boto(1000/2+220, height/2+200, color(#249627), 250, 30, 1, 7, "Crèdits, Creditos, Credits"); 
  background(0,255,0);
    fill(0);
    textSize(50);
    textos.introducenombre();
  inputUsuari.dibuixainput();
  if(!inputUsuari.nombreusuari().equals("")){
    b4.dibuixaboto();
  }
  image(vidactiva,100,200,200,200);
  image(granja,670,270,400,300);
  
}
/*PANTALLA DE HISTORIA*/
void pantalla3(){
  background(img3);
  fill(0);
  textos.introduccion();
  image(titulo,325,45);
  ////////////que comentarios tan molones dani xDJAJAJAJ mil barras//////////////////andreaaa aqui fatava el inputUsuari. el nombre de l clase
  b5.dibuixaboto();
  
}
/*PANTALLA DE JOC*/
  
void pantalla4(){
   
       if(reiniciado==false){
          cosa.reiniciacosa(); 
          reiniciado=true;
      }
   cosa.dibuja();
   
 juego.cue(0);   
    juego.play();
    juego.setLooping(repetir);
   
  
}
/*PANTALLA GAMEOVER*/
void pantalla5(){
  
 reiniciado=false;
  background(0,255,0);
  fill(255,0,0);
  textSize(80);
  text("GAME OVER",280,340);  
  image(titulo,280,100,500,100);
  image(granger,350,420);
  image(vaca0,30,320);
  image(vaca1,730,50);
  image(vaca2,730,320);
  image(vaca3,30,50);
  

  
  b7.dibuixaboto();
  gameover.cue(0);   
  gameover.play();
 
}
/*RANKING*/
void pantalla6(){
  
  ranc.dibuixaranc();
  
  b9.dibuixaboto();
  b10.dibuixaboto();
  
}
/*CREDITS*/
void pantalla7(){
  aplausos.cue(0);   
  aplausos.play(); 
  creditosos.drawcreditos();
  b8.dibuixaboto();
  
}
 class Ranking { 
  float xPos ;
  float yPos ;
int puntuscio = 100;
int [] Ranking = {0,0,0,0,0};
String nombree = "hola";
String[] nombres = {"---","---","---","---","---"};
Idiomas rankingtext = new Idiomas();
  Ranking(){
    
    xPos = 220;
    yPos = 100;
    
    
  }
  
  void dibuixaranc(){
    
    puntuscio = score.puntosfinal();
    nombree = inputUsuari.nombreusuari();
    int posicio =-1;
    int n0 =0;
    int n1 =0;
    int n2 =0;
    int n3 =0;  
    String nom0 = "---";
    String nom1 = "---";
    String nom2 = "---";
    String nom3 = "---";
    
    if(puntuscio >Ranking[0]){
        
        n0 = Ranking[0];
        n1 = Ranking[1];
        n2 = Ranking[2];
        n3 = Ranking[3];
        nom0 = nombres[0];
        nom1 = nombres[1];
        nom2 = nombres[2];
        nom3 = nombres[3];
        Ranking[1] = n0;
        Ranking[2] = n1;
        Ranking[3] = n2;
        Ranking[4] = n3;
        nombres[1] = nom0;
        nombres[2] = nom1;
        nombres[3] = nom2;
        nombres[4] = nom3;
        
        Ranking[0] = puntuscio;
        nombres[0] = nombree;
    } 
    if (puntuscio>Ranking[1] && puntuscio<Ranking[0]){
      
      n1 = Ranking[1];
      n2 = Ranking[2];
      n3 = Ranking[3];
      nom1 = nombres[1];
      nom2 = nombres[2];
      nom3 = nombres[3];
      Ranking[2] = n1;
      Ranking[3] = n2;
      Ranking[4] = n3;   
      nombres[2] = nom1;
      nombres[3] = nom2;
      nombres[4] = nom3;
      
      Ranking[1] = puntuscio;
      nombres[1] = nombree;
    }
    if(puntuscio>Ranking[2] && puntuscio<Ranking[1]){
      
      n2 = Ranking[2];
      n3 = Ranking[3];
      nom2 = nombres[2];
      nom3 = nombres[3];
      Ranking[3] = n2;
      Ranking[4] = n3;
      nombres[3] = nom2;
      nombres[4] = nom3;
      
      Ranking[2] = puntuscio;
      nombres[2] = nombree;
    }
    if(puntuscio>Ranking[3] && puntuscio<Ranking[2]){
      
      n3 = Ranking[3];
      nom3 = nombres[3];
      Ranking[4] = n3;
      nombres[4] = nom3;
        
      Ranking[3] = puntuscio;
      nombres[3] = nombree;
    }
    if(puntuscio>Ranking[4] && puntuscio<Ranking[3]){
    
    Ranking[4] = puntuscio;
    nombres[4] = nombree;
    
  }
  if(puntuscio<=0){
   
    
  }
 
  
    
     background(22,221,15);
     
     image(ranquing,0,0,width,height);
    fill(244,56,14);
    textAlign(CENTER);
    textSize(46);
    
    textSize(35);
    
    
    
    rankingtext.rankingg();
    
    
    text(nombres[0],340,yPos+180);  
    text("1",530,yPos+180);  
    text(Ranking[0],650,yPos+180);    
    
    text(nombres[1],340,yPos+220); 
    text("2",530,yPos+220);
    text(Ranking[1],650,yPos+220);

    text(nombres[2],340,yPos+260);
    text("3",530,yPos+260); 
    text(Ranking[2],650,yPos+260); 

    text(nombres[3],340,yPos+300);
    text("4",530,yPos+300);
    text(Ranking[3],650,yPos+300);
        
    text(nombres[4],340,yPos+340);
    text("5",530,yPos+340);
    text(Ranking[4],650,yPos+340);
    
    textAlign(LEFT);
    
  }
}
class Temps{
  int principi;
  
  Temps(){
    principi = millis();
  }
  int minuts(){
    return (int)((millis()-principi)/60000)%60;
  }
  int segons(){
    return (int)((millis()-principi)/1000)%60;
  }
  int tempstotal(){
    return (int)((millis()-principi)/1000);
  }
 
  void dibuixaCronometre(){
    fill(0);
    rect(913,5,62,53);
    fill(255,255,0);
    rect(918,10,52,43);
    fill(0);
    
    
    textSize(20);
   
    text(minuts()+":"+segons(), 930, 50);
    for(int i=0;i<niveles.length;i++){
      if(cronometre.tempstotal()>i*30){         
      niveles[i]= false;          
      }
    }
  }
  
  void reinicia(){
    principi = millis();
  }
}


