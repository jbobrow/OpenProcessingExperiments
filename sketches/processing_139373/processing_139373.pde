
/* @pjs preload="terra_laberint.png,personatje_monjo1.png,salamandra.png,xavi.png,
victor.png,david.png,catalana.png,espanola.png,inglesa.png,play.png,cast.png,tornar.png,
gaudi.png,pantalla_inicialpixel2sagrada.png,heroi.png,bush.png,tree.png,pantalla_inicialpixel2sagrada.png,
Personatge_arcx4.png,FletxaX4.png,personatje_monjo6.png,diana_contornx4.png,trencadis.png,guerrers..png,heroi.png,
clauarc2.png,numero_0.png,numero_1.png,numero_2.png,numero_3.png,numero_4.png,numero_5.png,numero_6.png,numero_7.png,numero_8.png,numero_9.png"; 
 */
 
 
 /*SONGS
  Snap 1.wav : http://www.freesound.org/people/CMDA/sounds/162821/
  applause 1993.mp3: http://www.freesound.org/people/milton./sounds/77103/ 
  jumping: https://www.freesound.org/people/fins/sounds/172205/
  concrete_step_4.wav:http://www.freesound.org/people/movingplaid/sounds/76190/
  bleeeh.wav:http://www.freesound.org/people/scuzzpuck/sounds/40838/
  Jaaaaa Hurraaaaa: http://www.freesound.org/people/Davidox/sounds/169993/
  blablablabla - David Belenguer, Victor Tey, Xavier Garcia
  */

Maxim maxim;
AudioPlayer player;
AudioPlayer clap;
AudioPlayer espasa;
AudioPlayer jump;
AudioPlayer dragon;
AudioPlayer step;
AudioPlayer yeah;
AudioPlayer hurrah;
AudioPlayer blabla;

PImage bandera1, heroipant6, guerrers,bandera2, bandera3, play, cast, back, fons,heroi,gaudi,bush,tree,xavi,victor,david, 
dianaJoc1,fonsJoc1,heroiJoc1,trencadis,personatgeArc,dibuixFletxa,fonsJoc2,salamandra,drac,making1,making2,making3,making4,
making5,making6,making7,making8,making9,making10,fonsmenu,arc, jaula, primarykey,salamandradreta,sagrafa,cloud1,cloud2,cloud3,sun,personatgefinal,hemfetunjoc;







Personatge_Laberint hero;
PFont font;
Nube nuvol1;
Nube nuvol2;
Nube nuvol3;
PImage personatgeadal, personatgeabaix, personatgedreta, personatgeesquerra, fonsjocfinal,guerrerJoc3;
int yPospantalla=-650;
PersonatgeJoc3 a;
int direccio = 0;
int controlanimacio =19;
int animacio =0;
int controlanimacio2 = 1;

Punt mosca;
float ymosca;
float transpa = 255;

String numero;
String numeroUsuari="a";
String numeroauxiliar="a";
BotoResposta []resposta= new BotoResposta [10];
float [] numPos = {30,70,110,150,190,230,270,310,350,390};


PImage[][] personatge = new PImage [4][3];
float[] limitsYplata = {554,366,254,130,465,372,125,1000};
float[] limitsEscala = {204,366,470,366,322,490,1000}; 
float[][] limitsXplata = {{0,801},{178,640},{314,518},{310,516},{299,506},{299,506},{137,666}};
int nivellactual = 0;
EquacioJoc3 problemaJoc3;
GuerrerJoc3 [] guerrer =new GuerrerJoc3 [6];
GuerrerJoc3 guerrer2;
boolean problemaEscala;
boolean  puja= false;
String numero;
boolean segonaPantalla;

boolean colisiona = false;
float recompte = 0;
PImage[][] personatge = new PImage [4][2];
int direccio = 0;
int auxpos;
int controlanimacio =0;
int animacio =0;

Drac komodo;
Equacio_2 problemaJoc2;
Resultats[] resul= new Resultats [3];
boolean Te_como=false;


BotoResposta []resposta= new BotoResposta [10];
PImage[] numeros = new PImage[10];
Diana[] objetivo = new Diana[5];
float[] posDiana = {150,300,450,600,750};
float[][] posResultatsJoc2= {{410,170},
                             {330,250},
                             {480,250}};
int pantallaJoc2=1;
boolean Guanya = false;
float pos;
Fletxa ataca;
int auxcontador;
int carcaj = 1;
boolean disparo = false;
boolean contacte = false;
Puntuacio score;
Equacio problema;
int punts = 0;
int pantallajoc1 = 1;
int controlso;
Boto catalana;
Boto espanola;
Boto inglesa;
Boto creditos;
Boto inicio;
Boto tornar1; Boto tornar2; 
//b4; b5; b6;
int pantalla =1;
boolean pasa = true;
int idiomaa =0;
float ypos=630;
float ySpeed = 1;
int xPosguerrers = 650;
int xPosheroipant6 =180;
int auxResultat = 0;
boolean muero = false;
boolean saltob =false;
boolean segrest = false;
boolean blabla=false;
boolean llave = false;
boolean gabia = true;
boolean guanya2 = false;
boolean baixaEscala =false;
boolean menyspunts = false;
boolean sodrac = false;
boolean sostep = false;

int pasjoc = 0;
String [][] frases = {{"Crèdits","Juga","Xavier Garcia Fernandez\nCap de projecte\nProgramador","Victor Tey Bosch\nCap de disseny\nProgramador","David Belenguer Ruiz\nCap de programació\nProgramador","Benvingut, el meu nom\nés Antoni Gaudí.\nEstas preparat per la\ncompetició de tir amb arc?","Has estat acusat per utilitzar un arc trucat, serás arrestat i et condemnem al laberint encantat de\nzohan on está el malèfic Drac del parc Güell.\nPer sortir del laberint has de resoldre les equacions de primer grau, pero no triguis gaire en\nresoldre  el problema! sino serás devorat!"},
                      {"Créditos","Empezar","Xavier Garcia Fernandez\nJefe de proyecto\nProgramador","Victor Tey Bosch\nJefe de diseño\nProgramador","David Belenguer Ruiz\nJefe de programación\nProgramador","Bienvenido, mi nombre\nes Antoni Gaudí.\nEstas preparado para la\ncompetición de tiro con arco?","Has sido acusado por utilizar un arco trucado, serás arrestado y te condenamos al laberinto\nencantado de zohan donde descansa el Dragon del Parc Güell. \n Para salir del laberinto has de resolver las equaciones de primer grado, pero no tardes, \n sinó serás devorado."},
                      {"Credits","Play","Xavier Garcia Fernandez\nProject manager\nDeveloper","Victor Tey Bosch\nDesing manager\nDeveloper","David Belenguer Ruiz\nDevelopment manager\nDeveloper","Welcome, my name is\nAntoni Gaudí.\nAre you ready for the\narchery competition?","You've been accused for using a loaded bow, you'll be arrested and condemned to the\nenchanted labyrinth of zohan where the Parc Güell dragon rest. \nTo get out you have to sove the equations, but don't take too much time or you will be eat up." }};
boolean click = false;
void setup(){
  size(800,600);
  mosca = new Punt(100);
  maxim = new Maxim(this);
  player = maxim.loadFile("flecha.mp3");
  clap=maxim.loadFile("clap.mp3");
  espasa=maxim.loadFile("espasa.mp3");
  jump=maxim.loadFile("jump.mp3");
  dragon=maxim.loadFile("dragon.mp3");
  step=maxim.loadFile("step.mp3");
  yeah=maxim.loadFile("yeah.mp3");
  hurrah=maxim.loadFile("hurra.mp3");
  blabla=maxim.loadFile("blablablabla.mp3");
 
  for(int i = 0 ; i<personatge.length;i++){
    for(int j = 0 ; j<personatge[i].length;j++){
      personatge[i][j] = loadImage ("personatge_monjo"+i+"a"+j+".png");
    }
  }
  fonsJoc2=loadImage ("terra_laberint.png");
  hemfetunjoc=loadImage("_MG_3904.jpg");
  heroi=loadImage("personatje_monjo1.png");
  drac=loadImage("salamandra.png");
  salamandradreta=loadImage("salamandradreta.png");
  for(int i=0;i<numeros.length;i++){
   numeros[i]=loadImage("numero_"+i+".png");
  } 
  
  problemaJoc2=new Equacio_2 (40,460);
  font = loadFont("SFArcheryBlack-48.vlw");
  textFont(font);
  personatgefinal=loadImage("personatje_monjofinal.png");
  arc=loadImage("arc.png");
  primarykey=loadImage("clauarc2.png");
  jaula=loadImage("jaulaarco.png");
  fonsmenu=loadImage("fonsmenu.png");
  xavi=loadImage("xavi.png");
  victor=loadImage("victor.png");
  david=loadImage("david.png");
  bandera1 = loadImage("catalana.png");
  bandera2 = loadImage("espanola.png");
  bandera3 = loadImage("inglesa.png");
  play = loadImage("play.png");
  cast = loadImage("cast.png");
  back = loadImage("tornar.png");
  gaudi=loadImage("gaudi.png");
  fons=loadImage("pantalla_inicialpixel2sagrada.png");
  heroi=loadImage("heroi.png");
 // heroix2=loadImage("heroix2.png");
  cloud1=loadImage("cloud0.png");
  cloud2=loadImage("cloud1.png");
  cloud3=loadImage("cloud2.png");
  bush=loadImage("bush.png");
  tree=loadImage("tree.png");
  sun=loadImage("sun.png");
  sagrafa= loadImage("sagrafa.png");
  fonsJoc1=loadImage("pantalla_inicialpixel2sagrada.png");
  personatgeArc=loadImage("Personatge_arcx4.png");
  dibuixFletxa=loadImage("FletxaX4.png");
  heroiJoc1=loadImage("personatje_monjo6.png");
  dianaJoc1 = loadImage("diana_contornx4.png");
  trencadis = loadImage("trencadis.png");
  guerrers=loadImage("guerrers..png");
  heroipant6=loadImage("heroi.png");
  making1=loadImage("IMG_20140226_112054.jpg");making2=loadImage("IMG_20140226_112128.jpg");making3=loadImage("IMG_20140302_124241.jpg");making4=loadImage("IMG_20140302_183425.jpg");making5=loadImage("IMG_20140303_110246.jpg");
  making6=loadImage("IMG_20140303_131716.jpg");making7=loadImage("IMG_20140307_131657.jpg");making8=loadImage("IMG-20140309-WA0005.jpg");making9=loadImage("_MG_3230.jpg");making10=loadImage("_MG_3229.jpg");
 /* for(int i = 0 ; i<numeros.length;i++){
    numeros[i] = loadImage("numero_"+i+".png");
  }
  */

  objetivo[0] = new Diana(width/4*3,posDiana[0], 5, 2);
  objetivo[1] = new Diana(width/4*3,posDiana[1], 1, 2);
  objetivo[2] = new Diana(width/4*3,posDiana[2], 5, 2);
  objetivo[3] = new Diana(width/4*3,posDiana[3], 1, 2);
  objetivo[4] = new Diana(width/4*3,posDiana[4], 1, 2);
  problema = new Equacio(43,468);  
  score = new Puntuacio(100,50,100);
  ataca = new Fletxa();
  hero=new Personatge_Laberint(width/2+10,550,2,2); 
  komodo=new Drac (630,0.7);
  catalana = new Boto(180, "Català",0,1,2);
  espanola = new Boto(300, "Castellano",1,1,2);
  inglesa = new Boto(420, "English",2,1,2); 
  tornar1 = new Boto(25,530,70,50,"",3,1); tornar2 = new Boto(25,530,70,50,"",4,3);
  nuvol1= new Nube (700,150,0.5);
  nuvol2=new Nube (900,70,1);
  nuvol3=new Nube(900,100,0.7);

    for(int i = 0 ; i<personatge.length;i++){
    for(int j = 0 ; j<personatge[i].length;j++){
      personatge[i][j] = loadImage ("personatge_monjo"+i+"a"+j+".png");
    }
  }
  
  fonsjocfinal=loadImage("fonsjocfinal.png");
  guerrerJoc3=loadImage("guerrer_joc3_2.png");
  a=new PersonatgeJoc3 (30,554,2,2);
   problemaJoc3 = new EquacioJoc3 (56,height/2-25); 
  problemaJoc3.calcula();
  for (int i =0; i<guerrer.length; i++){
   guerrer[i]=new GuerrerJoc3(limitsXplata[i+1][0]+(random(50,200)),limitsYplata[i+1],1.5,i+1);
  }
  guerrer2= new GuerrerJoc3 (limitsXplata[6][0],limitsYplata[6],1.5,6);
  
  for (int i=0;i<numPos.length;i++){
      resposta[i]= new BotoResposta(750,numPos[i],i+"");
  
  }
  
}
  
  void draw(){ 
    background(0); 
    switch(pantalla){
      case 1: 
               imageMode(CORNER);
              idioma();
              break;
      case 2:  imageMode(CORNER);
               creditos= new Boto(180, frases[idiomaa][0],idiomaa,3,4);//hay que poner estos dos botones en el draw para que se cambie [idioma] y funcione
               inicio = new Boto(300, frases[idiomaa][1],idiomaa,3,5);//hay que poner bien la pagina cuando haya pagina de inicio del juego, seria por ejemplo 2,4
               pantalla = 3;
               click = true;
                break;
      case 3: imageMode(CORNER);inici();break;
      case 4: imageMode(CORNER);credits();break;
      case 5: introduccio();break;
      case 6: joc1();break;
      case 7: pantalla6();break;
      case 8: pantalla7();break;  
      case 9: joc3();break;    
      case 10: pfinal();break;   
    }
  }
  void mousePressed(){
    catalana.apreta();
    espanola.apreta();
    inglesa.apreta();
    tornar1.apreta();
    tornar2.apreta();
    if(pasa){
      creditos.apreta();
      inicio.apreta();
    }
    if(pantalla == 5 && pasa){
      pantalla = 6;
      pasa = false;
    } 
  }
  
  void mouseReleased(){
    pasa = true;
  }

class PersonatgeJoc3{

float xpos;
float ypos;
float xSpeed;
float ySpeed;
int nivell;
float aux;
boolean salt;
int comptasalt;
int comptagravetat;
boolean gravetat;
float aux2;
PersonatgeJoc3(){
  
 xpos=0;
 ypos=0;
 xSpeed=0;
 ySpeed=0;
 salt= false;
 gravetat = false;
 nivell = 0;
 }
 
PersonatgeJoc3(float x, float y, float velx, float vely){
  
 xpos=x;
 ypos=y;
 xSpeed=velx;
 ySpeed=vely;
 nivell = 0;
 salt= false;
 gravetat = false;
 }

void dibuixa(){
  imageMode(CENTER);
  if(controlanimacio==-1){
    animacio = 2;
  }else if(controlanimacio%20 < 10){
    animacio = 0;
  }else{
    animacio = 1;
  }
  image(personatge[direccio][animacio],xpos,ypos);
 }
 
void moure(){
   
  //Escales baixar
  
  if(limitsEscala[nivell-1]-8 < xpos && limitsEscala[nivell-1]+8 > xpos && !puja && !problemaEscala){
        if(keyPressed){
          if (keyCode == DOWN){
            ypos=(ypos+ySpeed)%800;
            direccio = 3;  controlanimacio +=1;
          }    
        }
        if(ypos > limitsYplata[nivell-1]-2 && ypos < limitsYplata[nivell-1]+2){
          nivell -=1;
          baixaEscala = true;
          numeroUsuari="a";
          numeroauxiliar="a";
          ypos = limitsYplata[nivell];
          problemaEscala = false;
        }
      }
  
  
  //Escales pujar
    
      if(limitsEscala[nivell]-8 < xpos && limitsEscala[nivell]+8 > xpos && !puja && !problemaEscala && !baixaEscala){
        numeroUsuari="a";
        problemaEscala = true;
      }
     if(limitsEscala[nivell]-8 > xpos || limitsEscala[nivell]+8 < xpos && !puja){
        problemaEscala = false;
        numeroUsuari="a";
        baixaEscala = false;
      }
    
    
    if(puja){
      if(keyPressed){
          if (keyCode == UP){
            ypos=(ypos-ySpeed)%800;
            direccio = 0;  controlanimacio +=1;
          }    
        }
    }
    
      
      if(keyPressed || a.salt){
      //Plataformes
        if(ypos == limitsYplata[nivell] && !puja || a.salt){         
         if(xpos >= limitsXplata[nivell][0]){
           if (keyCode == LEFT){
             xpos=(xpos-xSpeed)%800;
             direccio = 1;  controlanimacio +=1;
            }
         }
          if(xpos <= limitsXplata[nivell][1]){ 
             if (keyCode == RIGHT){
               xpos=(xpos+xSpeed)%800;
               direccio = 2;  controlanimacio +=1;
             } 
          }
        }
    
    
    //Si arribes a la seguent plataforma canvia el nivell
    if(ypos > limitsYplata[nivell+1]-2 && ypos < limitsYplata[nivell+1]+2){
      nivell +=1;
      numeroUsuari="a";
      puja =false;
      ypos = limitsYplata[nivell];
      problemaEscala = false;
    }
  }
  if(ypos!=limitsYplata[nivell]){
    problemaEscala = false;
  }
}
void gravity(){
   if(ypos <limitsYplata[nivell] && gravetat){
     ypos +=3;
     if (direccio==2 && xpos<((limitsXplata[nivell][1])-5)){
       xpos+=1;
     }else if (direccio==1 && xpos>((limitsXplata[nivell][0])+5)){
       xpos-=1;
     }
     gravetat = false;
   }
 }
 
 void salto(){
   if(ypos-aux2==0.0){
     salt = false; 
     if(saltob){
       jump.stop();
       saltob = false;
     }
       comptasalt = 0;     
   }
   
   if(!gravetat){
     aux2= ypos;
     
   }
  
   if(keyPressed){
     if(key == 'a' && !salt){
       salt = true;
       jump.cue(0);
       jump.play();
       saltob = true;
     }
   }
   if(comptasalt <15 && salt){
     if (direccio==2 && xpos<((limitsXplata[nivell][1])-5)){
       xpos+=2;
     }else if (direccio==1 && xpos>((limitsXplata[nivell][0])+5)){
       xpos-=2;
     }
     ypos -=6;
     comptasalt += 1;
   }else{
     gravetat = true;
   }
}
}


class EquacioJoc3{
  int xPos;
  int yPos;
  float ra1;
  float ra2;
  float x;
  
  EquacioJoc3(int x, int y){
    xPos = x;
    yPos = y;
  }

  void calcula(){
    ra1 = random(1,50);
    ra2 = random(1,50);
    
   x= (int)ra1/((int)ra2);
   while(((int)ra1%(int)ra2)!=0 || x>=10 || ((int)x)==1){
    ra1 = random(1,50);
    ra2 = random(1,50);
    x= (int)ra1/((int)ra2);

   } 
   numero = (int)x + "";
  }
  
  void reiniciEquacio(){
    ra1 = random(1,20);
    ra2 = random(1,20);
    
     x= (int)ra2/((int)ra1);
  }
  void dibuixa(){
    noStroke();
    fill(10);
    rect(xPos+50,yPos-50,150,77);
    strokeWeight(2.5);
    stroke(255);
    line(xPos+50,yPos-50,xPos+50,yPos-50+77);
    line(xPos+50,yPos-50,xPos+50+150,yPos-50);
    stroke(150);
    line(xPos+50,yPos-50+77,xPos+50+150,yPos-50+77);
    line(xPos+50+150,yPos-50,xPos+50+150,yPos-50+77);
    fill(255);
    textSize(20);
    text((int)ra2+"x"+"-"+(int)ra1+"="+"0",xPos+160,yPos-5);
    
    //text(x,xPos+50,yPos-50);
    
    image(gaudi,xPos,yPos,gaudi.width/2,gaudi.height/2);
  }
  
  void encerta(){
    
    if(numeroauxiliar != numeroUsuari){
      if(numero.equals(numeroUsuari)){
        punts+=100;
        problemaEscala = false;
        puja=true;
        numeroUsuari="a";
        problemaJoc3.calcula();
      }else if(menyspunts){
        menyspunts = false;
        punts -= 50;
        numeroauxiliar = numeroUsuari;
      }
    }
    
  }
  
}

class GuerrerJoc3{
  
  float xPos;
  float yPos;
  float xSpeed;
  int nivel;
  
GuerrerJoc3(){
  
 xPos=0;
 yPos=0;
 xSpeed=0;
 nivel=0;
 }

GuerrerJoc3(float x, float y, float velx, int level){
 
 xPos=x;
 yPos=y;
 xSpeed=velx; 
 nivel=level;
  
}

void dibuixa(){
  imageMode(CENTER);
  image (guerrerJoc3, xPos, yPos);
}

void moure(){
  xPos=(xPos+xSpeed);
  if(xPos > limitsXplata[nivel][1]-1 && xPos < limitsXplata[nivel][1]+1){
      xSpeed=-xSpeed;         
     }
  if (xPos > limitsXplata[nivel][0]-1 && xPos < limitsXplata[nivel][0]+1){
     xSpeed=-xSpeed; 
  }
  
}
void colisio(){
 if (a.xpos>xPos-3 && a.xpos<xPos+3 && a.ypos==yPos &&!segonaPantalla){
   if(muero){
        espasa.stop();
      }
    espasa.cue(0);
    espasa.play(); 
    muero = true;
    a.nivell=0;
    a.ypos=limitsYplata[0];
    a.xpos=30;
    puja=false;
    punts-=50;
    problemaJoc3.calcula();
 }else if (a.xpos>xPos-3 && a.xpos<xPos+3 && a.ypos==yPos){
    if(muero){
        espasa.stop();
    }
    espasa.cue(0);
    espasa.play();
    muero = true;
    a.nivell=3;
    a.ypos= 575;
    a.xpos=365;
    puja=true;
    direccio=0;
    punts-=50;
    problemaJoc3.calcula();
 }
}
}

class BotoResposta{
 float xPos;
 float yPos;
 String numeroBoto;
 BotoResposta(){
  
 xPos=0;
 yPos=0;
 numeroBoto="0";
 }
 BotoResposta(float x, float y, String num){
  
 xPos=x;
 yPos=y; 
 numeroBoto=num;
 }
 
 void dibuixa(){
   fill(255);
 rect (xPos,yPos, 25,25);
 fill(0);
 textSize(20);
 text(numeroBoto,xPos+18,yPos+20);
 }
 
 void pulsa(){
  if(mousePressed && mouseX>xPos&&mouseX<xPos+25 && mouseY>yPos && mouseY< yPos+25 ){
   numeroUsuari=numeroBoto;
   if(numeroauxiliar==numeroUsuari){
     menyspunts = false;
   }else if(numeroauxiliar!=numeroUsuari){
     menyspunts = true;
   }
  } 
 }
 
}

class Diana {
  
  float xpos;
  float ypos;
  float resultat;
  float yspeed;
  boolean contact;
  
  Diana(){
    
    xpos = 0;
    ypos = 0;
    resultat = 0;
    yspeed = 1;
    contact = false;
  }
  
  Diana(float x, float y, float res, float vel){
    xpos = x;
    ypos = y;
    resultat = res;
    yspeed = vel;
    contact = false;
  }
  
  void dibuixa(){
    imageMode(CENTER);
    
    if(contact){
      image(trencadis, xpos,ypos-50,dianaJoc1.width/4*3,dianaJoc1.height/4*3);
    } else{
      image(dianaJoc1,xpos,ypos-50,dianaJoc1.width/4*3,dianaJoc1.height/4*3);
      image(numeros[(int)resultat],xpos,ypos-50);
    }
  }
  
void moure(){
    ypos = (ypos + yspeed)%(height+150);
    
  }
  
  void colisio(){
    if((dist(ataca.x,ataca.y,xpos,ypos-50))<dianaJoc1.width/2){
         if (resultat==problema.x&& !contacte){  
          contacte=true;
          contact = true;
          score.puntua();
          colisiona = true;
          transpa = 255;
          ymosca = ypos+random(-25,25); 
        }
        
      }
      if(colisiona){
        
        recompte += 1;
         clap.cue(0);
         clap.play();
        if(recompte==110){
          if(punts >= 1000 || pasjoc == 10 && punts >=500){
            pantalla = 7;
            blabla.cue(0);
            blabla.play();
          }
          clap.stop();
          ReiniciJocFletxes();
        }
      }
  }
}
   
   
   
   class Nube{
  float xpos;
  float ypos;
  float xSpeed;


Nube(float x,float y, float velx){
 xpos=x;
 ypos=y;
 xSpeed=velx; 
}

void dibuixa1(){
imageMode(CENTER);
image(cloud1,xpos,ypos);
 
}
void dibuixa2(){
imageMode(CENTER);
image(cloud2,xpos,ypos);
 
}
void dibuixa3(){
imageMode(CENTER);
image(cloud3,xpos,ypos);
 
}


void moure(){
 xpos=(xpos-xSpeed); 
if (xpos<-100){
 xpos=900;
} 
}
}
   class Equacio{
  int xPos;
  int yPos;
  float ra1;
  float ra2;
  float x;
  
  Equacio(int x, int y){
    xPos = x;
    yPos = y;
    ra1 = random(0,9);
    ra2 = random(0,9);
    x = (int)ra1-(int)ra2; 
  }
//43,468
  void calcula(){
    ra1 = random(0,9);
    ra2 = random(0,9);
    x = (int)ra1+(int)ra2;
   while(ra1+ra2>10 || (int)ra1==(int)x || (int)ra2==(int)x || (int)x==auxResultat){
   ra1 = random(0,9);
    ra2 = random(0,9);
    x = (int)ra1+(int)ra2;
   } 
   auxResultat = x;
  }
  
  void reiniciEquacio(){
    ra1 = random(0,9);
    ra2 = random(0,9);
    x = (int)ra1+(int)ra2; 
  }
  void dibuixa(){
    noStroke();
    fill(10);
    rect(xPos,yPos,267,77);
    strokeWeight(2.5);
    stroke(255);
    line(xPos+1,yPos+1,xPos-1,yPos+544-468);
    line(xPos+1,yPos-1,xPos+309-43,yPos-1);
    stroke(150);
    line(xPos+310-43,yPos-1,xPos+310-43,yPos+544-468);
    line(xPos+1,yPos+545-468,xPos+308-43,yPos+545-468);
    fill(255);
    textSize(60);
    text("x"+"-"+(int)ra1+"="+(int)ra2,xPos+215,yPos+55);
  }
  
}

class Fletxa{
  
  float x, y, vx;
  
  Fletxa(){
    x = 221;
    y = height/2+76;
    vx = 15;
  }
  
  Fletxa(float xpos, float ypos, float xSpeed){
    
   x = xpos;
   y = ypos;
   vx = xSpeed;   
  }
  
 
  
  void moure(){
    
   x=(x+vx);
   
  }
   void dibuixa(){
     image(dibuixFletxa,x,y);
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
    fill(40);
    rect(xPos-56,yPos-16,58,19);
    fill(255);
    textAlign(RIGHT);
    textSize(20);
    strokeWeight(2.5);
    text(punts, xPos, yPos);
    strokeCap(SQUARE);
    stroke(255);
    line(xPos-57,yPos-18,xPos+1,yPos-18); //primera horitzontal
    line(xPos-58,yPos-17,xPos-58,yPos); //primera vertical
    stroke(150);
    line(xPos-57,yPos+2,xPos+1,yPos+2); //segona horitzontal
    line(xPos+2,yPos-17,xPos+2,yPos+1); //segona vertical
  }
  
  void puntua(){
    if(punts<=99999){
      punts += augment;
    }else{
      punts = 99999;
    }
  }
}
class Equacio_2{
  int xPos;
  int yPos;
  float ra1;
  float ra2;
  
  float x;
  
  Equacio_2(int x, int y){
    xPos = x;
    yPos = y;
  }

  void calcula(){
    ra1 = random(1,50);
    ra2 = random(1,50);
    
   x= (int)ra1/((int)ra2);
   while(((int)ra1 % (int)ra2)!=0 || x>=10 || ((int)x)==1){
    ra1 = random(1,50);
    ra2 = random(1,50);
    x= (int)ra1/((int)ra2);

   } 
  }
  
  void reiniciEquacio(){
    ra1 = random(1,20);
    ra2 = random(1,20);
    
     x= (int)ra2/((int)ra1);
  }
  void dibuixa(){
    noStroke();
    fill(10);
    rect(xPos,yPos,267,77);
    strokeWeight(2.5);
    stroke(255);
    line(xPos+1,yPos+1,xPos-1,yPos+544-468);
    line(xPos+1,yPos-1,xPos+309-43,yPos-1);
    stroke(150);
    line(xPos+310-43,yPos-1,xPos+310-43,yPos+544-468);
    line(xPos+1,yPos+545-468,xPos+308-43,yPos+545-468);
    fill(255);
    textSize(60);
    text((int)ra2+"x"+"="+(int)ra1,xPos+215,yPos+55);
    
    //text(x,xPos+250,yPos+150);
  }
  
}
class Drac{
  float ypos;
  float ySpeed;


Drac(float y, float vely){
 ypos=y;
 ySpeed=vely; 
}

void dibuixa(){
 imageMode(CENTER);
 controlanimacio2+=1;
 if(controlanimacio2 % 35 > 17){
  image(drac,400,ypos); 
 }else{
  image(salamandradreta,400,ypos); 
 }
 
 if(controlso % 151 == 0 && !sodrac){
   dragon.cue(0);
   dragon.play();
   sodrac = true;
 }else if(controlso%151==150 && sodrac){
   dragon.stop(); 
   sodrac = false;
 }
 controlso+=1;
}

void moure(){
 ypos=(ypos-ySpeed);  
}
}

class Personatge_Laberint{

float xpos;
float ypos;
float xSpeed;
float ySpeed;
boolean click;
int auxY;
boolean booleanimacio;
Personatge_Laberint(){
  booleanimacio = true;
 xpos=0;
 auxY = 0;
 ypos=0;
 xSpeed=0;
 ySpeed=0;
 click=false;
 }
 
Personatge_Laberint(float x, float y, float velx, float vely){
  booleanimacio = true;
  auxY = 0;
 xpos=x;
 ypos=y;
 xSpeed=velx;
 ySpeed=vely;
 click=false;
 }

void dibuixa(){
  imageMode(CENTER);
  if(controlanimacio%20 < 10){
    animacio = 0;
  }else{
    animacio = 1;
  }
  if(controlanimacio%20==0 && !sostep){
   step.cue(0);
   step.play();
   sostep  = true;
  }else if(controlanimacio%20==19 && sostep){
   step.stop(); 
   sostep = false;
  }
  image(personatge[direccio][animacio],xpos,ypos);
 }
void moure(){
  
  click = true;
 
 if(booleanimacio){
   controlanimacio +=1;
 }

 if(click&&ypos>255){
  ypos=(ypos-ySpeed);
 }
 if (Te_como){
   ypos=(ypos-ySpeed);
   booleanimacio = true;
 }
 if (Guanya){
   if (auxpos==0){
     ypos=(ypos-ySpeed);
     booleanimacio = true;
   }
   if(auxpos==1){
     xpos=(xpos-xSpeed);
     booleanimacio = true;
   }
   if(auxpos==2){
     xpos=(xpos+xSpeed);
     booleanimacio = true;
   }
 }
 auxY = (int)ypos;
}
}

class Resultats{
float xpos;
float ypos; 

int pa1;

 Resultats (int resul_ta2,float chop, float chopy){
  pa1 = resul_ta2;
  xpos=chop;
  ypos=chopy;
 }
 
 
 void dibuixa(){
   image(numeros[pa1],xpos,ypos); 
 }
 
 void seleccio(){
  if (mousePressed && mouseX>xpos-15 && mouseX<xpos+15 && mouseY>ypos-35 && mouseY<ypos+35){
    if(pa1==problemaJoc2.x){
      direccio=auxpos;
      colisiona = true;
      Guanya = true;
      score.puntua();
    }else if(pa1!=problemaJoc2.x && (controlanimacio2-auxcontador)>50 /*&& !menyspunts*/){
      punts -=50;
      //menyspunts = true;
      auxcontador = controlanimacio2;
    }
  }
 }
}
class Punt{
  int valor;
  
  Punt(int p){
    valor = p;
  }
  
  void dibuixa(float xMosca, float yMosca ){
    fill(255,transpa);
    text("+"+valor,xMosca,yMosca);
    //velocitat a la que puja la mosca
    ymosca -= 1.5;
    //velocitat a la que desapareix la mosca
    transpa -= 4;  
  }
  
}
class Boto {
  float xPos;
  float yPos;
  float largoB;
  float anchoB;
  int pantallaActual;
  int pantallaDesti;
  String texte;
  int language;
  
  Boto(){
    xPos = 250;
    yPos = 180;
    largoB = 300;
    anchoB = 50;
    pantallaActual = 1;
    pantallaDesti = 2;
    texte = "Català";
    
    
  }  
  
  
  Boto(float y, String t, int inicio, int fi){
    xPos = 250;
    yPos = y;
    largoB = 300;
    anchoB = 50;
    pantallaActual = inicio;
    pantallaDesti = fi;
    texte = t;
  }
  
  Boto(float y, String t,int lang, int inicio, int fi){
    xPos = 250;
    yPos = y;
    largoB = 300;
    anchoB = 50;
    pantallaActual = inicio;
    pantallaDesti = fi;
    texte = t;
    language = lang;
  }
  
    Boto(float x, float y,  float w, float h, String t, int inicio, int fi){
    
    xPos = x;
    yPos = y;
    largoB = w;
    anchoB = h;
    pantallaActual = inicio;
    pantallaDesti = fi;
    texte = t;
   
  }
   
  
   void dibuixa(){
    fill(255);
    rect(xPos, yPos, largoB, anchoB,20);
    fill(0);
    textSize(36);
    textAlign(CENTER);
    text(texte,width/2+20, yPos+40);
    
   
  }
  
  void apreta(){
    if ((xPos <= mouseX && mouseX <= xPos + largoB) && (yPos <= mouseY && mouseY <= yPos + anchoB) && pantalla == pantallaActual && pasa == true){
      idiomaa = language;
      pasa = false;
      pantalla = pantallaDesti;
    }
  }

}
void idioma(){
    image(fonsmenu,0,0);
    catalana.dibuixa();
    espanola.dibuixa();
    inglesa.dibuixa();
    image(bandera1,250,catalana.yPos-5, 60,60);
    image(bandera2,250,espanola.yPos-5,60,60);
    image(bandera3,250,inglesa.yPos-5,60,60);
    fill(0);
    text("Selecciona idioma  Select lenguage", 400,100);
}
void pfinal(){
  background(55);
  imageMode(CENTER);
  image(personatgefinal,width/2,height/2);
  fill(255);
  textSize(60);
  text(punts,455,100);
}
void inici(){
  image(fonsmenu,0,0);
  ypos=630;
  creditos.dibuixa();
  image(cast,265,creditos.yPos+5,40,40);
  
  inicio.dibuixa();
  image(play,255,inicio.yPos, 50,50);
  
  tornar1.dibuixa();
  image(back,35, tornar1.yPos,50,50);
  
}

void credits(){
  background(0);
  ypos=(ypos-ySpeed);
  fill (255);
  if (ypos>-5000){
  stroke(255);
  textSize(50);
  textAlign (CENTER);
  text(frases[idiomaa][0],width/2,ypos);
  image (xavi,width/5,ypos+50);
  textSize (30);
  textAlign (LEFT);
  text (frases[idiomaa][2],width/2,ypos+100);
  image (victor,width/5,ypos+250);
  text (frases[idiomaa][3],width/2,ypos+300);
  image (david,width/5,ypos+450);
  text (frases[idiomaa][4],width/2,ypos+500);
  image (making1,200,ypos+700);
  image (making2,200,ypos+1100);
  image (making3,200,ypos+1500);
  image (making4,200,ypos+1900);
  image (making5,200,ypos+2300);
  image (making6,200,ypos+2900);
  image (making7,200,ypos+3300);
  image (making8,200,ypos+3700);
  image (making9,200,ypos+4300);
  image (making10,200,ypos+4700);
  image (hemfetunjoc,200,ypos+5100);
  
  }

  tornar2.dibuixa();
  image(back,35, tornar2.yPos,50,50);
  
}
void introduccio(){
  
   imageMode(CORNER);
  image(fons,0,0);
  imageMode(CENTER);

 
  fill(0);
  image(gaudi,width/4*3,height/4*3);
  image(heroi,width/4+20,height/3*2-20);
  
  image(cloud1,500,115);
  image(cloud2,325,70);
  image(cloud3,120,110);
  arbustos();
  
  fill(255);
  stroke(0);
  strokeWeight(2);
  rect(500,170,295,140,20);
  fill(0);
  textSize (25);
  textAlign(LEFT);
  text (frases[idiomaa][5],510,200);
  
  
}

void arbustos(){
  image(bush,100,400,bush.width/2,bush.height/2);
  image(bush,125,425,bush.width/2,bush.height/2);
  image(bush,100,450,bush.width/2,bush.height/2);
  image(bush,125,450,bush.width/2,bush.height/2);
  image(bush,150,475,bush.width/2,bush.height/2);
  
  image(bush,100,425,bush.width/2,bush.height/2);
  image(bush,125,450,bush.width/2,bush.height/2);
  image(bush,100,475,bush.width/2,bush.height/2);
  image(bush,125,475,bush.width/2,bush.height/2);
  image(bush,150,500,bush.width/2,bush.height/2);
  
  image(bush,200,425,bush.width/2,bush.height/2);
  image(bush,225,450,bush.width/2,bush.height/2);
  image(bush,200,475,bush.width/2,bush.height/2);
  image(bush,225,475,bush.width/2,bush.height/2);
  image(bush,250,500,bush.width/2,bush.height/2);
  
  image(bush,300,425,bush.width/2,bush.height/2);
  image(bush,325,450,bush.width/2,bush.height/2);
  image(bush,300,475,bush.width/2,bush.height/2);
  image(bush,325,475,bush.width/2,bush.height/2);
  image(bush,350,500,bush.width/2,bush.height/2);
  
  image(tree,400,300);
  image(tree,200,275);
  image(tree,125,295);
  image(tree,75,225);
  image(sagrafa,224,143);
  image(sun,750,110);
  
}
void joc1(){
 switch(pantallajoc1){
  
    case 1:
      ReiniciJocFletxes();
    break;
    case 2:
      PantallaJocFletxes();
    break;
    
 } 
}
void PantallaJocFletxes(){
  if(mousePressed && pasa){
    disparo = true;
    player.cue(0);
    player.play();
    
  }
  
  
  imageMode(CORNER);
  image(fonsJoc1,0,0);
  imageMode(CENTER);
  image(personatgeArc,width/4,height/2+67);
  arbustos();
   imageMode(CORNER);
  nuvol1.dibuixa1();
  nuvol1.moure();
  nuvol2.dibuixa2();
  nuvol2.moure();
  nuvol3.dibuixa3();
  nuvol3.moure();
  
  imageMode(CENTER);
  image(sagrafa,224,143);
  //image(personatgeArc,width/4,height/2+67);
  score.dibuixa();
  imageMode(CENTER);
  stroke(10);
  line(width/4*3-4,0,width/4*3-4,height);
  line(width/4*3+4,0,width/4*3+4,height);

  for(int i = 0;i<objetivo.length;i++){
    objetivo[i].dibuixa();
    objetivo[i].moure();
  }
  objetivo[2].colisio();
  
  if(colisiona){
    mosca.dibuixa(width/4*3, ymosca);
  }
  

  if(ataca.x>width+700){
    pasjoc +=1;
    if(!contacte){
     punts -=50;  
    }
    player.stop();
    ataca = new Fletxa();
    disparo = false;
    contacte = false;
    for(int i = 0 ; i<objetivo.length;i++){
      objetivo[i].contact = false;
      
    }
  }
  ataca.dibuixa();

  if(disparo){
    ataca.moure();
  }
  problema.dibuixa();
  strokeWeight(1);
  
}    

void ReiniciJocFletxes(){
   
   clap.play();
   clap.stop();
   colisiona = false;
   recompte = 0;
   float distancia = random(-50,-1000);
   float[] aleatori = new float[4];
   problema.calcula();
   objetivo[2] = new Diana(width/4*3,posDiana[2]-distancia, problema.x, 2);
   for(int i = 0 ; i<aleatori.length; i++){
     aleatori[i] = random(0,9);
     while((int)aleatori[i]==(int)problema.x){
       aleatori[i] = random(0,9);
     }
   }
   objetivo[0] = new Diana(width/4*3,posDiana[0]-distancia, (int)aleatori[0], 2);
   objetivo[1] = new Diana(width/4*3,posDiana[1]-distancia, (int)aleatori[1], 2);
   objetivo[3] = new Diana(width/4*3,posDiana[3]-distancia, (int)aleatori[2], 2);
   objetivo[4] = new Diana(width/4*3,posDiana[4]-distancia, (int)aleatori[3], 2);
   pantallajoc1 = 2;
}
void pantalla6(){
 imageMode(CORNER);
  image(fons,0,0);
  imageMode(CENTER);
  image(cloud1,500,115);
  image(cloud2,325,70);
  image(cloud3,120,110);
  arbustos();
  fill(0);
  image(guerrers,xPosguerrers,350,guerrers.width*2,guerrers.height*2);
 
  
  image(heroipant6,xPosheroipant6,height/2+97,heroipant6.width*1.5,heroipant6.height*1.5);
  
  textSize(18);
  
  fill(255);
  strokeWeight(10);
  rect(5,445,width-10,140,20);
  fill(0);
  textAlign(LEFT);
  text(frases[idiomaa][6],20,480);
  moure();
  
  
}
void moure(){
  if(mousePressed){
    segrest =true;
    
  }
  if(segrest){
    xPosguerrers -=5;
    if(xPosguerrers == xPosheroipant6){
      xPosheroipant6 -=5;
    }
    if(xPosheroipant6<-400){
      pantalla = 8;
    }
   }
}

void pantalla7(){
  switch (pantallaJoc2){
  case 1:
   ReiniciLaberint();
  break;
  case 2:
   Joc2();
  break; 
 }
}
void ReiniciLaberint(){
  menyspunts = false;
  Guanya=false;
  float pos=random(1,4);
  direccio = 0;
  recompte = 0;
  colisiona = false;
  Te_como = false;
  float[] aleatoriJoc2 = new float[2];
  float[] aleatoriSelector = {random(0,2),random(0,2),random(0,2)}; 
  problemaJoc2.calcula();
  for (int i=0;i<3;i++){
   aleatoriSelector[((int)pos)%3]=i;
   pos+=1.0; 
  }

  
   resul[(int)aleatoriSelector[0]] = new Resultats((int)problemaJoc2.x,posResultatsJoc2[(int)aleatoriSelector[0]][0],posResultatsJoc2[(int)aleatoriSelector[0]][1]);
   
   
   for(int i = 0 ; i<aleatoriJoc2.length; i++){
     aleatoriJoc2[i] = random(1,9);
     while((int)aleatoriJoc2[i]==(int)problemaJoc2.x){
       aleatoriJoc2[i] = random(1,9);
     }
   }
   auxpos =(int)aleatoriSelector[0]; 
   
   resul[(int)aleatoriSelector[1]] = new Resultats((int)aleatoriJoc2[0],posResultatsJoc2[(int)aleatoriSelector[1]][0],posResultatsJoc2[(int)aleatoriSelector[1]][1]);
  
   resul[(int)aleatoriSelector[2]] = new Resultats((int)aleatoriJoc2[1],posResultatsJoc2[(int)aleatoriSelector[2]][0],posResultatsJoc2[(int)aleatoriSelector[2]][1]);
   pantallaJoc2 = 2;

}
void Joc2(){
 imageMode(CORNER);
 image(fonsJoc2,0,0); 
 hero.dibuixa();
 hero.moure();
 if (hero.ypos==254 && hero.xpos==width/2+10){
   if(hero.booleanimacio) {
     hero.booleanimacio =false;
   }
   komodo.dibuixa();
   komodo.moure();
   problemaJoc2.dibuixa();
   for (int i=0;i<resul.length;i++){
     resul[i].dibuixa(); 
     resul[i].seleccio();
   }
 }else if(Te_como || Guanya){
   komodo.dibuixa();
   komodo.moure();
   if(colisiona || hero.xpos==width/2+10){

    recompte +=1;
    
    if(recompte == 200){
      if(punts>=2000 || pasjoc == 20 && punts>=1000){
       pantalla=9; 
      }else{
      pantallaJoc2 = 1;
      hero=new Personatge_Laberint(width/2+10,550,2,2); 
      komodo=new Drac (630,0.7);
      }
    }
    
   }
   
 }
 
 if (hero.xpos==width/2+10 && komodo.ypos<=360 && !Te_como && !Guanya){
  punts-=50;
  Te_como=true;
 }
score.dibuixa(); 
}
void joc3(){  
  
 imageMode(CORNER);
  image(fonsjocfinal,0,yPospantalla);
  a.dibuixa();
  if(!guanya2){
    a.moure();
  }
  if(!puja){
    a.gravity();
    a.salto();
  }
  if(!segonaPantalla){
    for(int  i = 0; i<3;i++){
      guerrer[i].dibuixa();
      
      if(!problemaEscala && !guanya2){
        guerrer[i].moure();
        guerrer[i].colisio();
      }
    }
  }else{
    if(!llave){
      if(a.xpos > 220-primarykey.width/2 && a.xpos < 220 + primarykey.width/2 && a.ypos == 125){
        llave = true;
        yeah.cue(0);
        yeah.play();
      }
      image(primarykey,220,125);
    }
    if(llave){
      gabia =  false;
    }
    
    if(400-8 < a.xpos && 400+8 > a.xpos && a.ypos == 372){
      
      if(llave){
        
        puja= true;
      }
        //numeroUsuari="a";
        //problemaEscala = true;
      }
      
     if(a.xpos >400-8 && a.xpos <400+8 && a.ypos<283+2 && a.ypos >283-3){
       guanya2 = true;
       a.xpos = 400;
       a.ypos = 283;
       direccio = 3;
       animacio = 2;
       hurrah.cue(0);
       hurrah.play();
       pantalla=10;
     }
    if(gabia){
      image(jaula,400,280);
    }
    image(arc,400,285);
    for(int  i = 3; i<guerrer.length;i++){
        guerrer[i].dibuixa();
        if(!problemaEscala){
          guerrer[i].moure();
          guerrer[i].colisio();
        }
     }
  }
    fill(255);
  stroke(255);
  
  
  if(problemaEscala && !baixaEscala){
     problemaJoc3.dibuixa();
     problemaJoc3.encerta();
  }
 if (a.ypos<0){
   yPospantalla=-150;
   a.ypos = 600;
   segonaPantalla = true;
 }
 for (int i=1; i<resposta.length; i++){
    resposta[i].dibuixa();
    resposta[i].pulsa();
  }
  score.dibuixa();
  
}



