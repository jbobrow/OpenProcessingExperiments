


var audioElement = document.createElement("audio"); //per al javascript
var audioElement1 = document.createElement("audio"); //per al javascript
var audioElement2 = document.createElement("audio"); //per al javascript

/*definim les variables*/
int posX,posY; /*ho poso tot en funcio de posX i posY per a tenir més fàcil programar les velocitats*/
int velX,velY;

PImage laFoto; //Definim variables
 
float midaMaxima=70; /*per que vagi canviant el tamany de la bola gran*/
float midaBola=30;
float velBola=0.25;
 
int midaSol=50; /*mida inicial del Sol*/
 
int sz = 15; //Definim el radi dels meteorits
int numBoles =10; //Definim quants meteorits hi haurà a la pantalla

 
//creem una matriu de posicionsX con "numBoles" elements:
float[] posicionsX = new float[numBoles]; //array de reals per a posicioX. el nº d'elements ve donat per numBoles
//el mateix per posicionsY:
float[] posicionsY = new float[numBoles];
//i per velocitatsX:
float[] velocitatsX = new float[numBoles];
//i velocitatsY:
float[] velocitatsY = new float[numBoles];
 
void setup(){
  size(800,700); //Mida de la pantalla
  background(15,20,26); //Fons de la pantalla
  velX=int(random(1,8));
  velY=2;
  audioElement1.setAttribute("src", "nau1.mp3");
    audioElement1.play();
  
  laFoto = loadImage("astro.jpg");
  
  /*minim = new Minim(this);//instanciem l'objecte de so
  daSound = minim.loadFile("boing.mp3");//carreguem l'mp3
  daBackgroundSound = minim.loadFile("nau1.mp3");//carreguem l'mp3
  daBackgroundSound.play();//el reproduim*/
   
  frameRate(30); //cada segon quantes vegades es fara draw
  //inicialitzem posicions i velocitats:
  for(int i = 0; i<numBoles; i++){ //la i evoluciona des de i fins a numBoles, i augmenta de 1 en 1
    posicionsX[i] = int(random(width)); //aleatori de 0 fins a l'amplada de la pantalla
    posicionsY[i] = int(random(height)); //aleatori de 0 fins a la llargada de la pantalla
    velocitatsX[i] = random(2,10); //aleatori dentre 2 i 10
    velocitatsY[i] = random(2,10); //aleatori dentre 2 i 10
   
}
}
 
void draw(){
  
  background(0);
  
/* Definim com volem que sigui el nostre fons. Seran tot estrelles*/
fill(255); //Color interior de les estrelles
stroke(255,255,0);
strokeWeight(1.5);
for(int x=0; x<=width; x+=28){ //Fem que les estrelles començin a 0, fins a l'ample de la pantalla, i la separació entre els seus centres sigui 28.
  {for(int i=0;i<=height; i+=28){ //Definim el mateix per a l'alçada de la pantalla
  ellipse(x,i,5,5);} //Dibuixem les estrelles
}
}
   
/*les dues posicions estan en funcio de la velocitat, per tant es moura en ambdues posicions*/ 
posX=posX+velX;
posY=posY+velY;
 
/*dibuixo el Sol*/
fill(255,201,3);
stroke(255,28,3);
strokeWeight(4);
ellipse(600,200,midaSol,midaSol);
 
/*Dibuixem la nau*/
fill(161,165,167);
noStroke();
strokeWeight(2);
triangle(posX-100,posY+75,posX,posY,posX+100,posY+75);/*triangle*/
 
fill(88,97,103);
stroke(88,97,103);
strokeWeight(2);
line(posX,posY-50,posX,posY);/*line*/
 
fill(24,103,180);
stroke(17,60,103);
strokeWeight(2);
ellipse(posX,posY,5,5);/*cercle petit (c)*/
 
fill(42,255,28);
stroke(255,255,255);
strokeWeight(4);
ellipse(posX,posY-50,midaBola,midaBola);/*cercle gran (C)*/
 
 
/*defineixo la velocitat que tindra el cercle gran al fer-se gran i petit, i el limit de la seva mida*/
midaBola=midaBola+velBola;
if (midaBola>=midaMaxima){
      midaBola=10;}
 
/*definim les velocitats respecte la posició*/
if((posX<=0)||(posX>=width-100)){
    velX = -velX;
  }
if((posY<=0)||(posY>=height-75)){
    velY = -velY;
}
 
/* Començem a dibuixar els meteorits */
 
for(int i = 0; i<numBoles; i++){ //definim que el numero de boles augmenti de un en un, i té com a limit numBoles
    posicionsX[i] += velocitatsX[i]; //posX = posX + velX
    posicionsY[i] += velocitatsY[i]; //posY = posY + velY
 
//comprovem els limits, tant per X com per Y
    if((posicionsX[i]<0)||(posicionsX[i]>width)){ //quan la posició sigui més petita que 0 o més gran que l'amplada, la velocitat és negativa (retrocedeix)
      velocitatsX[i] = -velocitatsX[i]; }
    if((posicionsY[i]<0)||(posicionsY[i]>height)){ //quan la posició sigui més petita que 0 o més gran que la llargada, la velocitat és negativa (retrocedeix)
      velocitatsY[i] = -velocitatsY[i]; }
      
//Dibuixem els meteorits     
    fill(188,121,87);
    stroke (116,18,18);
    strokeWeight(3);
    ellipse(posicionsX[i],posicionsY[i],sz,sz);

  //comprovem la posicio X
  if ((posicionsX[i]<0)||(posicionsX[i]>width)) {
    velocitatsX[i]= -velocitatsX[i];
    
    audioElement2.setAttribute("src", "boing.mp3");
    audioElement2.play();
   /* //posem el so de rebot a zero...
    daSound.cue(0);
    //i disparem el so de rebot
    daSound.play();*/
  
  //comprovem la posicio Y
  if ((posicionsY[i]<0)||(posicionsY[i]>height)) {
   velocitatsY[i] = -velocitatsY[i];
    /*//posem el so de rebot a zero...
    daSound.cue(0);
    //i disparem el so de rebot
    daSound.play();*/
    
     audioElement2.setAttribute("src", "boing.mp3");
    audioElement2.play();
  }
}

}
 
image(laFoto,mouseX,mouseY); //mostrem la imatge del cursor


}

void mousePressed(){
  //reinicialitzem les velocitats:
  for(int i=0; i<numBoles; i++){
    velocitatsX[i] = random(2,10);
    velocitatsY[i] = random(2,10);
  }
/*Estableixo que la mida del Sol sigui una variable, que li vagi sumant 10 unitats a cada click, fins que arribi a 250, que llavors tornara a la mida original, 50*/
if (midaSol==midaSol) {midaSol=midaSol+10;}
if (midaSol>=150) {midaSol=50;}
 
}




