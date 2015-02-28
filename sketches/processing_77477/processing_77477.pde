
int[] coordenadasxinvasor={int(random(600)),int(random(600)),int(random(600)),int(random(600)),int(random(600))};
int[] coordenadasyinvasor={0,0,0,0,0};
int diametroinvasor=20;
int contador=0;
int velocidad=5;

PFont letra;
PImage cementerio;
PImage nave;
PImage momia;


void setup(){
  size(600,500);
  smooth();
  letra=loadFont("AgencyFB-Reg-48.vlw");
  cementerio=loadImage("cementerio.jpg");
  nave=loadImage("santo.gif");
  momia=loadImage("momia2.gif");
}
void draw(){
  image(cementerio,0,0);
  arma();
  invasores();
  finjuego();
}

void arma(){
  fill(0,255,0);
  stroke(color(0,255,0));
  //triangle(mouseX-8,485,mouseX,465,mouseX+8,485);
  image(nave,mouseX-26,435,60,60);
}

void invasores(){
  fill(255);
  stroke(255);
  for(int i=0;i<5;i++){
    image(momia,coordenadasxinvasor[i]-5,coordenadasyinvasor[i]++,
            35,35);
  }
}
  
void mousePressed(){
  proyectil(mouseX);//tomamos la posición x del disparo 
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
        textFont(letra,84);
        background(0);
        fill(255);
        text("Has matado",140,100);
        fill(255);
        text(contador,270,200);
        text("momias",210,300);
        
        if(contador<=30){
          textFont(letra,84);
          fill(255,0,0);
          text("Puntuación Baja",110,400);
        }
        else if((contador>30) && (contador<=60)){
          textFont(letra,84);
          fill(255,255,0);
          text("Puntuación Media",105,400);}
          
          else{
          textFont(letra,84);
          fill(0,255,0);
          text("Puntuación Alta",110,400);
          }
          
      }
    }
  }

      
     

