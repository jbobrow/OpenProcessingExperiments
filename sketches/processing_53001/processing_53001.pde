
float tamano = 0.0;
float angulo = 0.0;
int avanza = 0;
 int mano = 0;
void setup(){
 size(900,450);
 smooth();
 background(0);
  
}
 
void draw(){
 // background(0);
  fill (random(100,255),random(100),random(100),random(35,40));
 
  translate(250,avanza);
  rotate(angulo);
  
  
  //rect(-20,10,30,30);
  ellipse(-30,-30,60,60);
   
   PFont f = loadFont("Bodoni.vlw");

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
}



