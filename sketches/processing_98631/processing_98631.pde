
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;*/

PImage mico;
int boles=15;
//matrius de posicions i velocitats
float[] posX=new float [boles];
float[] posY=new float [boles];
float[] velX=new float [boles];
float[] velY=new float [boles];

var audioElement = document.createElement("audio");

//Minim minim;
//AudioPlayer so;
//AudioOutput out;

void setup(){
  size(500,400); //definim el tamany
  background(0); //escollim color de fons
  //posem les posicions i velocitats inicials
  for(int i=0;i<boles;i++){
    posX[i]=25;
    posY[i]=25;
    velX[i]=random(20);
    velY[i]=random(20);
    mico=loadImage("mico.jpg");
    
  }
  
  //creem el fons amb bucles
  for(int y=0;y<height;y+=height/8){
  for(int x=0;x<width;x+=width/5){
    fill(0,0,255);
    ellipse(x+50,y+25,25,50);
    fill(255,0,0);
    ellipse(x+50,y+25,50,25);
    fill(255,255,0);
    rect(x+35,y+10,30,30);
  }
  
}
noCursor();
// minim = new Minim(this);//instanciem l'objecte de so
 // so = minim.loadFile("so.mp3");//carreguem l'mp3
 //   out = minim.getLineOut(Minim.STEREO, 2048);//instanciem l'out      
}

void draw(){
  background(0); //posem el mateix color i fons per a què no se'ns vegin tots els dibuixos quan es desplacen
  for(int y=0;y<height;y+=height/8){
  for(int x=0;x<width;x+=width/5){
    fill(0,0,255);
    ellipse(x+50,y+25,25,50);
    fill(255,0,0);
    ellipse(x+50,y+25,50,25);
    fill(255,255,0);
    rect(x+35,y+10,30,30);
  }
   }
  for(int i=0;i<boles;i++){
    //actualitzem posicions
    posX[i]=posX[i]+velX[i];
    posY[i]=posY[i]+velY[i];
    if((posX[i]<25)||(posX[i]>width-25)){
      velX[i]=-velX[i];
    }
    if((posY[i]<25)||(posY[i]>height-25)){
      velY[i]=-velY[i];
    }
  //dibuixos
  fill(0,255,0);
  ellipse(posX[i],posY[i],50,50);
  }
  image(mico,mouseX,mouseY,160,120);
}

void mousePressed() {

    audioElement.setAttribute("src","so.mp3");
    audioElement.play();

}


