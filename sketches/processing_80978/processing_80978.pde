
int[] coordenadasxinvasor={int(random(700)),int(random(700)),int(random(700)),int(random(700)),int(random(700))};
int[] coordenadasyinvasor={0,0,0,0,0};
int diametroinvasor=20;
int contador=0;
int velocidad=5;
 
PFont letra;
PImage fondo;
PImage popeye;
PImage espinaca;
 
 
void setup(){
  size(800,500);
  smooth();
  letra=loadFont("Tahoma-Bold-48.vlw");
  fondo=loadImage("fondo1.jpg");
  popeye=loadImage("popeye.png");
  espinaca=loadImage("espinaca.png");
}
void draw(){
  image(fondo,0,0);
  arma();
  invasores();
  finjuego();
}
 
void arma(){
  fill(0,255,0);
  stroke(color(0,255,0));
  image(popeye,mouseX-26,435,60,60);
}
 
void invasores(){
  fill(255);
  stroke(255);
  for(int i=0;i<5;i++){
    image(espinaca,coordenadasxinvasor[i]-5,coordenadasyinvasor[i]++,
            35,35);
  }
}
   
void mousePressed(){
  proyectil(mouseX);
}
 
void proyectil(int disparox){
  boolean acertar=false;
  for( int i=0;i<5;i++){
    if((disparox>=(coordenadasxinvasor[i])) &&
      (disparox<=(coordenadasxinvasor[i]+40/2)))
    {
      acertar=true;
      line(mouseX,435,mouseX,coordenadasyinvasor[i]);
      ellipse(coordenadasxinvasor[i]+10,coordenadasyinvasor[i],
      diametroinvasor+15,diametroinvasor+15);
      coordenadasxinvasor[i]=int(random(580));
      coordenadasyinvasor[i]=0;
      contador++;
    }
  }
  if(acertar==false){
    line(mouseX,435,mouseX,0);
  }
}
   
  void finjuego(){
    for(int i=0;i<5;i++){
      if(coordenadasyinvasor[i]==500){
        background(255);
        fill(color(0));
        noLoop();
        textFont(letra,48);
        background(#E3F2E7);
        fill(0);
        text("Has  comido",255,150);
        fill(#088123);
        text(contador,380,250);
        text("Espinacas",280,350);
      }
   }
}


 


