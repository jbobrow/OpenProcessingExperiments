
import netscape.javascript.*; 
  
  int[] coordenadasXinvasor={int(random(1000)), int(random(1000)),
  int(random(1000)), int(random(1000)), int(random(1000))};
  int [] coordenadasYinvasor={0,0,0,0,0};
  int diametroInvasor=100;
  int count=0;
  int yopi=0;
  int tu=7;
  int battle=0;

void setup()
{
  size(1100,700);
}

void draw()
{
  PFont muahaha;
  muahaha=loadFont("AlmonteSnow-48.vlw");
  textFont(muahaha,150);
  background(100,200,100);
  arma();
  invasores();
  fill(200,200,20);
  text(yopi,800,150);
  dificultad();
  finJuego();
}

void arma()
{
  PImage foto;
  foto=loadImage("cosaq.png");
  image(foto,mouseX+14,580);
}

void invasores()
{
  stroke(0);
  fill(0);
  PImage foto2;
  foto2=loadImage("cosaa.png");
  for(int i=0; i<5; i++)
  image(foto2,coordenadasXinvasor[i], coordenadasYinvasor[i]++);
  
}

void mousePressed()
{
  proyectil(mouseX);
}

void proyectil(int disparoX)
{
  boolean acertar = false;
   PImage foto3;
  foto3=loadImage("cosaa2.png");
  for (int i=0; i<5; i++){
    if((disparoX>=(coordenadasXinvasor[i]-diametroInvasor/2)) &&
    (disparoX<=(coordenadasXinvasor[i]+diametroInvasor/2))){
      acertar = true;
      if(acertar==true){
      yopi+=100;
      battle+=1;

      stroke(255,0,0);
      strokeWeight(10);
      line(mouseX+25,590,mouseX+25,coordenadasYinvasor[i]);
      
      image(foto3,coordenadasXinvasor[i], coordenadasYinvasor[i]++);
  
  coordenadasXinvasor[i]=int(random(1000));
  coordenadasYinvasor[i]=0;

    }
}
    if(acertar==false){
      stroke(255,0,0);
      strokeWeight(10);
      line(mouseX+25,590,mouseX+25,0);
    }
      

}}

void finJuego(){
  for(int p=0; p<5; p++)
  {
    if(coordenadasYinvasor[p]==600){
      count+=1;}
      if(count==5){
     noLoop();
     PImage foto6;
     foto6=loadImage("kudosno.png");
     image(foto6,0,0);
     PFont level;
     level=loadFont("Fingerpop-48.vlw");
     textFont(level,30);
     text("Tu puntuación fue: "+yopi,200,650);     
    }
  
  }
  if(yopi>=35700){
    noLoop();
    PImage foto5;
     foto5=loadImage("kudos.png");
     image(foto5,0,0);
  }
}

void dificultad(){
    PImage foto2;
    foto2=loadImage("cosaa.png");
    PFont level;
  level=loadFont("Fingerpop-48.vlw");
  textFont(level,80);
  fill(255);
  if(yopi==500){
    text("Nivel 1",350,450);}
  if(yopi>=500){
    for(int ib=0; ib<5; ib++)
    image(foto2,coordenadasXinvasor[ib], coordenadasYinvasor[ib]+=tu); 
  }
  if(yopi==1200){
    text("Nivel 2",350,450);
  }
  if(yopi==1900){
    text("Nivel 3",350,450);
  }
  if(yopi==2600){
    text("Nivel 4",350,450);
  }
  if(yopi==3300){
    text("Nivel 5",350,450);
  }
  if(yopi>=3300){
    for(int ib=0; ib<5; ib++)
    image(foto2,coordenadasXinvasor[ib], coordenadasYinvasor[ib]+=tu);
  }
  if(yopi==4200){
    text("Nivel 6",350,450);
  }
  if(yopi==5100){
    text("Nivel 7",350,450);
  }
  if(yopi==6000){
    text("Nivel 8",350,450);
  }
  if(yopi==6900){
    text("Nivel 9",350,450);
  }
  if(yopi==8700){
    text("Nivel 10",350,450);}
  if(yopi>=8700){
    for(int ib=0; ib<5; ib++)
    image(foto2,coordenadasXinvasor[ib], coordenadasYinvasor[ib]+=tu);
  }
  if(yopi==10500){
    text("Nivel 11",350,450);
  }
  if(yopi==12300){
    text("Nivel 12",350,450);
  }
  if(yopi==14100){
    text("Nivel 13",350,450);
  }
  if(yopi==15900){
    text("Nivel 14",350,450);
  }
  if(yopi==17700){
    text("Nivel 15",350,450);}
  if(yopi>=17700){
    for(int ib=0; ib<5; ib++)
    image(foto2,coordenadasXinvasor[ib], coordenadasYinvasor[ib]+=tu);
  }
  if(yopi==21300){
    text("Nivel 16",350,450);
  }
  if(yopi==24900){
    text("Nivel 17",350,450);
  }
  if(yopi==28500){
    text("Nivel 18",350,450);
  }
  if(yopi==32100){
    text("Nivel 19",350,450);
  }
  if(yopi==35700){
    text("Nivel 20",350,450);
  }
}

