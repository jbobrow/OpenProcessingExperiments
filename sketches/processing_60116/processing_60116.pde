
float tamano = 0.0;
float angulo = 0.0;
int avanza = 0;
 int mano = 0;
void setup(){
 size(900,450);
 smooth();
 background(0);
   PFont f = loadFont("Bodoni.vlw");
  
}
 
void draw(){
  
  
 // background(0);
  
  PFont f = loadFont("Bodoni.vlw");
  
   textFont(f, 20);
text("Left Click to Reset", 720,430);

fill (random(100),random(100,256),random(100,256),random(35,40));
 
  translate(250,avanza);
  rotate(angulo);
  
  
  //rect(-20,10,30,30);
  //ellipse(avanza+40,avanza-30,60,60);
   
 

textFont(f, avanza-50);
text("Mario", random(avanza),random(avanza));




 
 // ellipse(0,0,60,30);
  //ellipse(-20,50,avanza,avanza);
  //ellipse(-20,50,avanza,avanza);

  
   scale(tamano);
ellipse(10,10,50,50);
tamano=tamano+.01;
  
  
  scale(random(1,2));
  
  fill(255,255,255,100);
  noStroke();
  angulo=angulo+0.1;
  avanza=avanza+1;
  
  if(avanza>=445) { //cuando Mario llega abajo
    mano=1;
  }
  if (mano==1) {  //Mario para, comandos para dejar de crecer y acelerar
    avanza=avanza-1;
    angulo=angulo-.1;
    tamano=tamano-.01;
    fill(230);

  }
 
  if (mousePressed){
 avanza=0;
 angulo=0;
 tamano=0;
 background(0);
} 
}



