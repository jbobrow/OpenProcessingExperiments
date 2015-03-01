
import ddf.minim.*;

PImage  bola, bonusitem, estrella, ganaste, inicio, lava, manita, reintentar; 
PFont fuente;
float x=width/2,y=height/2;// bola
float disx, disy; //bola anim
float posx, posy; //bola loc
int start=1,play,dead,clear,item;
int score=0,bonus=0,r=30,a=3;
int i; 
boolean salir =false;
boolean instrucciones =false;
int itemX[] = new int [10];  
int itemY[] = new int [10];
Minim minim;
AudioPlayer sonido1;
AudioPlayer sonido2;
AudioPlayer sonido3;
AudioPlayer cinicio;

void setup()
{
  size(600,600);
  smooth();
   noCursor();
  noStroke();
reset();

//images
  bola = loadImage("bola.png");
  bonusitem = loadImage("bonus.png"); 
  estrella = loadImage("estrella.png"); 
  ganaste = loadImage("ganaste.jpg");
  inicio = loadImage("inicio.png"); 
  lava = loadImage("lava.jpg"); 
  manita = loadImage("manita.png"); 
  reintentar = loadImage("reintentar.png"); 
 //fuente
 fuente = loadFont("PressStartK-12.vlw");
  //audio
  minim = new Minim(this);
  
  cinicio = minim.loadFile("inicio.mp3");
  sonido1 = minim.loadFile("song.mp3");
  sonido2 = minim.loadFile("song2.mp3");
  sonido3 = minim.loadFile("ganar.wav");
  
}
 
void draw(){
  if(start==1){
      cinicio.play();
    image(inicio,0,0); 
    image(manita, mouseX-40,mouseY-10);
    textFont(fuente,12); 
    text("presiona cualquier tecla ",20,550);
   text("para ver las instrucciones",20,580);

    if (keyPressed){
       fill(0,0,0,180);
      rect(0,200,width,200);
      fill(255);
    textFont(fuente,30);
    text("MUEVE EL CURSOR",20,240);
    text("PARA REBOTAR",20,280);
    text("A KIRBY",20,320);
    }
    if(mousePressed){
      if(dist (mouseX,mouseY,width/2,height/2-10)<75){
      sonido1.play();
      cinicio.pause();
        play=1;
        start=0;
        reset();
      }
    }
  }
  if(play==1){
    image(lava,0,0); 
    for(i=0; i<itemX.length; i++){

//scores//
      if(score==(i+1)*100 || score ==(i+1)*100+1){
        item+=i;
        if(item>=0){
          image(bonusitem,itemX[i]-25,itemY[i]-25);
          item=+i;
        }
        if(dist(mouseX,mouseY,itemX[i],itemY[i])<125){ 
          item=-(i+i);
          bonus+=30; 
          score+=1; 
        }
      }
    }
    fill(0);
    textFont(fuente, 20);
    text (score,width-160,height-75);
    text(bonus,width-55,height-55);
    
    
    //bola //
    bouncyball(); 
    if(r==30){ //score
      score+=10;
    }
    if(score>=300){ //ganar//
      play=0;
      clear=1;
    }
  }
  if(dead==1){ //te moriste
    sonido1.pause();
     sonido2.play();
     sonido3.pause();
     cinicio.pause();
    image(reintentar,0,0);  
    text(score,width/2,height/2+48);
    text(bonus,width/2,height/2+68);// 
    image(manita,mouseX-40,mouseY-10); 
    if(mousePressed==true){
      if(mouseX>100 && mouseX<450 && mouseY>250 && mouseY<300){//butón moriste//
     sonido1.rewind();
     sonido1.play();
     sonido2.rewind(); 
     sonido2.pause();
     sonido3.pause();
     cinicio.pause();
        dead=0;
        play=1;
        reset();
      }
    if (salir==true){
    exit();
    }
  }

}
  if(clear==1) { 
     sonido3.play();
     sonido2.pause();
     sonido1.pause();
     cinicio.pause();
    image(ganaste,0,0); 
    text(score,width-172,height-95); 
    text(bonus,width-55,height-50); 
    image(manita,mouseX-40,mouseY-10); 
    if(mousePressed==true){ 
    if(dist (mouseX,mouseY,width/2,height/2)<75){ //botón reintentar//
     sonido1.rewind();
     sonido1.play();
     sonido3.pause();
        clear=0;
        play=1;
        reset();
      }
     sonido3.rewind();
    }
  }
  }



void bouncyball() { 
  disx=x-mouseX;
  disy=y-mouseY;
  image(estrella,mouseX-115,mouseY-100); 
  if(r>95 || r<30){ 
    a*=-1; 
    r+=a; 
  }
  r+=a; 
  
  
  //bal anim
  if(r==30){
    x+=disx*0.177;
    y+=disy*0.177;
    posx=disx; 
    posy=disy;
     if(dist(x,y,mouseX,mouseY)>120){
score-=10;      
play=0;
      dead=1;
    }
  }
  else {
    x+=posx*0.06; 
    y+=posy*0.06;
    }
    //fill(255);

    //fill(0);
    imageMode(CENTER);
    image(bola, x,y,r,r);
    imageMode(CORNER);
    
  }
void reset(){
  x=width/2;
  y=height/2;
  score=0;
  posx=0;
  posy=0;
  item=0;
  bonus=0;
        for (i=0 ; i < itemX.length ; i++) {
    itemX[i]=(int)random(25,width-25); 
    itemY[i]=(int)random(25,height-25);
  }
}


void mousePressed()
{
  
  if(mouseX>width/4*3 && mouseX<width-20 && mouseY>350 && mouseY<550)
  {
    salir = !salir;
  }

}


