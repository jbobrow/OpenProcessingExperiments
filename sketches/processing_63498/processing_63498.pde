
int s;
int m;
int h;

PImage bk; // classe para definir nome da imagem no processing

float rads = 4; // angulo de oscilação
float rayon = 300; //tamanho da oscilação
float rotation = PI/18;
float rotspeed = PI/50;
  
float volume; // variável do volume
import ddf.minim.*; // biblioteca minim
Minim minim;
 
 // definição para o som
AudioSample player_1;
AudioSample player_2;
AudioSample player_3;
AudioInput in;
int hours;
int minuts;
int seconds; 
int lastSecond; 
int secondsBeat; 
int lastHour;
int lastMinut;


void setup() {
  size(500,500);
  smooth();
  frameRate(83);
  rectMode(CENTER);
  //background(bk);

  minim = new Minim(this); 
  in = minim.getLineIn(Minim.MONO, 10);// microfone
  
  // carregar arquivos de som
  player_1 = minim.loadSample("click.mp3");// 
  player_2 = minim.loadSample("28113__herbertboland__kukuklok-1-slag.wav");
  player_3= minim.loadSample("hora.wav");


bk = loadImage("fundo.jpg"); // carregar imagem num ficheiro externo
}  
  
void draw() {
 noStroke();
 background(bk);
 fill(250,30);
 rect(width/2,height/2,500,500);
 
 volume = in.left.get(0)*600;
 
 hours = hour();
 minuts=minute();
 seconds = second();
 
  s = second(); 
  m = minute();
  h = hour(); 
    
  rads += 0.075; 
    
  float oscillation = cos(rads) * (PI/4) + (PI/2); // calcular a oscilação
   
   //propriedades de texto horas, minutos e segundos.
   fill(255);
  textAlign(CENTER);
  textSize(50);  
  text(s , height/2+70, width/2-150); 
 
  textAlign(CENTER);
  textSize(35);  
  text(":" , height/2+35, width/2-150); 
  
 
  textAlign(CENTER);
  textSize(50);  
  text(h , height/2-70, width/2-150); 
  
  
  textAlign(CENTER);
  textSize(35);  
  text(":" , height/2-35, width/2-150); 
 
   textAlign(CENTER);
  textSize(50);  
  text(m , height/2, width/2-150); 
  
  float y = sin(oscillation) * rayon+170;
  float x = cos(oscillation) * rayon + width/2 ;
  
 
    
  fill(100,100,100-volume);
  stroke(100+volume);
  strokeWeight(10);
  line(width/2,200,x,y);
  noStroke();
  pushMatrix();
  translate(x,y);
  rotate(rotation);
  translate(-x,-y);
  ellipse(x,y,50+volume,50+volume);
  popMatrix();
  rotation+=rotspeed;
  
  fill(255);
  ellipse(width/2,200,5,5);
  
  
  if(lastSecond+1 == seconds){
player_1.trigger();
}

lastSecond = seconds;
  
volume = in.left.get(0)*600;



 if(lastMinut+1 == minuts){
player_2.trigger();
}
lastMinut = minuts;




 if(lastHour+1 == hours){
player_3.trigger();
}
lastHour = hours;
  
  
  
  
  
}

