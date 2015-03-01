
/* @pjs crisp=true; 
preload="artur1.jpg,artur2.jpg,artur3.jpg"; 
 */

Forn temps;
PImage foto1,foto2,foto3;
void setup(){
  size(700, 600);
  temps= new Forn();
  foto1 = loadImage("artur1.jpg");
  foto2 = loadImage("artur2.jpg");
  foto3 = loadImage("artur3.jpg");
}
void draw(){
  
  temps.construccioForn();
  temps.botons();
  temps.funcionalitatTemps();
  
}

class Forn{
  boolean cert = true;
  String texta = "PREPARAT PER FER SERVIR";
  float x = 161;
  float y = 162;
  int enrera;
  int a =140;
  int b= 140;
  int c = 140;
  String text2a = hour() <= 9 ? "0"+str(hour()) : str(hour());
  String text2b = minute() <= 9 ? "0"+str(minute()) : str(minute());
  String text2= text2a+":"+text2b;
  int x2= 390;
  int y2 = 155;
  int contador = 0;
 
  
  void construccioForn(){
  //IMATGE DE FONS 
  image(foto3,0,0);
  
  //FORN
  
  fill(94,94,94);
  rect(100,111,500,300,15);
  fill(a,b,c);
  rect(140,227,440,155);
  line(180,260,535,260);
  line(180,300,535,300);
  line(180,340,535,340);
  fill(140,140,140);
  beginShape () ;
  vertex(212,192);
  vertex(500,192);
  vertex(505,200);
  vertex(500,208);
  vertex(212,208);
  vertex(207,200);
  vertex(212,192);
  endShape();
  rect(160,138,170,40);
  rect(375,138,60,40);
  fill(173,255,47);
  text(texta,x,y);
  text(text2,x2,y2);
  text(day()+"/0"+month()+"/"+year()%100,383,170);
  image(foto1,463,143);
  image(foto2,513,143);
  fill(0);
  line(99,184,600,184);
  text("BOSCH",527,134);
  }
  
  void funcionalitatTemps(){
  //IF COMENÇAMENT DEL TEMPS
  if(cert == false){

  int minutsEnrere =floor((enrera - millis())/60000);
  int segonsEnrere = floor(((enrera - millis())/1000)%60);
  contador = segonsEnrere;
  
  if (segonsEnrere >= 0){
  text2= minutsEnrere + ":" +segonsEnrere;
  x2 = 390;
  y2 = 155;
  // IF FINAL + HORA
  }else if ( segonsEnrere <0 &&minutsEnrere < 1){
    text2 = text2a+":"+text2b;
    x2 = 390;
    y2 = 155;
  } 
  // IF PER MOSTRAR TEXT QUAN ACABA EL TEMPS
  if(segonsEnrere>1){
   texta = "CALENTANT";
   x = 205;
   y= 162;
   a = 255;
   b= 165;
   c = 0;
  
  }else if(segonsEnrere < 1 && minutsEnrere == 0){
   texta = "PREPARAT PER FER SERVIR";
   x = 161;
   y= 162;
   a = 140;
   b= 140;
   c = 140;
 }
  
 }
  
}
  // IF PER LES FUNCIONALITATS DELS BOTONS + I -
  void botons(){
    if (mousePressed && mouseX>463 && mouseX < 485 && mouseY > 143 && mouseY < 164){
    enrera = enrera +1400;
    cert = false;
}
  if (mousePressed && mouseX>513 && mouseX < 536 && mouseY>143 &&mouseY < 164 & contador > 0 ){
    enrera = enrera -1400;
}
  
  }
}
  



