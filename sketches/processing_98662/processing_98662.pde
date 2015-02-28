
//import ddf.minim.*;//variables per fer funcionar l'audio
//import ddf.minim.signals.*;
//import ddf.minim.analysis.*;
//import ddf.minim.effects.*;
//Minim minim;
//AudioPlayer daSound;


 
var audioElement1=document.createElement("audio"); 

int Nboles=10;
int r=100;
PImage foto;
float [] pX = new float [Nboles]; // fixem les variables arrays
float [] pY = new float [Nboles];
float [] vX = new float [Nboles];
float [] vY = new float [Nboles];

 
 
 
 
void setup(){
 
size(600,600);
background(#FCF569);
noCursor ();
imageMode (CENTER);
foto = loadImage ("risa.png");//CARREGUEM LA IMATGE
 
  
 
 
 
for (int i=0; i<Nboles;i++){ //marquem l'inici de les boles
pX[i]= int ( random( 100,500));
pY[i]= int ( random( 100,500));
vX[i]= random( 1,4 );
vY[i] =random ( 1,4);
}
}
 

 
 
void draw(){ //fem un bucle per dibuixar el fons
background(#273101);
for (int x=30; x<width; x+=width/2){
for (int y=30; y<height; y+=height/2){
fill(random(255),155,155); rect(x,y,width/2-60,height/2-60);
}
}
image(foto, mouseX, mouseY, 100,100);
 
for( int i=0; i<Nboles; i++) //fem un segon bucle perque es moguin totes les boles a la vegada i marquem posicions.
{
pX[i] += vX[i];
pY[i] += vY[i];
 
if (pX[i]<r/2 || pX[i] >width-r/2 ){ //limitem i fem canvi de velocitat
vX[i] = - vX[i];
}
 
 
if (pY[i]<r/2 || pY[i] >height-r/2 ){
vY[i] = - vY[i];
}
 
fill ( (255), (255), random(255)); //fem el color aleatori
ellipse(pX[i], pY[i], r, r); //posició elipse.
}
}
void mousePressed(){//moment "click"
   //minim = new Minim(this);//posem l'objecte de so
  //daSound = minim.loadFile("jaja.aiff");
    //daSound.cue(0);
    //daSound.play();
  audioElement1.setAttribute("src","risa.mp3");
  audioElement1.play();
      }  


