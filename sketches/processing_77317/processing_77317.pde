
//primera parte: construir el juego (preparativos)
    //fondo
    //arma
    //marcianos
    
//segunda parte: definir las acciones
    //marcianos bajan
    //arma sigue en X
    //arma dispara y reinicia marcianos
    //ganaste
   
   import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;

AudioInput in;

AudioPlayer miReproductor;
   
   int[]coordenadasXalien={int(random(600)),int(random(600)),int(random(600)),int(random(600)),int(random(600))};
   int[]coordenadasYalien={0,0,0,0,0};
    
    int sizealien=10;
  
  PImage space;
  PImage fire;
  PImage ship;
  PImage aliens;
  
  PFont loser;
    
void setup(){
size(600,620);

space=loadImage("SpaceBG.jpg");
fire=loadImage("SpaceFire.jpg");
ship=loadImage("ship.gif");
aliens=loadImage("alien.gif");

loser=loadFont("LadyStarlight-48.vlw");

  minim=new Minim(this);
  in=minim.getLineIn(Minim.MONO,512);
  
}

void draw(){
  background(0);
  
  //cambiar fondo por imagen
  image(space,0,0);
  
  arma();
  aliens();
 fin();


}


void arma(){

  fill(25,150,25);
  stroke(color(25,150,25));

   image(ship,mouseX,550);
}

void aliens(){

  for (int i=0; i<5;i++){
    fill(290,250,25);
    stroke(255);
    image(aliens,coordenadasXalien[i],coordenadasYalien[i]++);
  }
  
}

//pewpew

void mousePressed(){
  proyectil(mouseX+25);
  println("pew pew");
          miReproductor=minim.loadFile("Laser.mp3");
     miReproductor.play();
}

//proyectil

void proyectil(int disparoX){
  boolean acertar=false;
  for(int i=0; i<5;i++){
    if((disparoX>=(coordenadasXalien[i]-sizealien/2)) && (disparoX<=(coordenadasXalien[i]+sizealien/2))){
      acertar=true;
      line(mouseX+25,565,mouseX+25,coordenadasYalien[i]);
      ellipse(coordenadasXalien[i],coordenadasYalien[i],sizealien+50,sizealien+50);
      coordenadasXalien[i]=int(random(600));
      coordenadasYalien[i]=0;

    }
  }
  if(acertar==false){
    line(mouseX+25,565,mouseX+25,0);
  }
}


//final


void fin(){

  for(int i=0; i<5; i++){
    if(coordenadasYalien[i]==600){
      image(fire,0,0);
      fill(255);
      strokeWeight(4);
      stroke(290,250,25);
   textFont(loser,100);
text("PERDISTE",180,310);
    miReproductor=minim.loadFile("PacmanDie.mp3");
     miReproductor.play();
       noLoop(); 
  }

 }
}

//agregar si ganaste?

