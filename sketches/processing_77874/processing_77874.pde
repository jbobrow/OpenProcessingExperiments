
int[] coordenadasXinvasor={int(random(600)),int(random(600)),int(random(600)),
int(random(600)),int(random(600))};
 
int[]coordenadasYinvasor= {0,0,0,0,0};
 
int diametroInvasor=10;
PFont miVariableTipo;
int score =0;
  PImage space;
 
 
void setup(){
  size(600,600);
  space=loadImage("space.jpg");

}
 
void draw(){
  background(0);
   image(space,0,0);

  arma();
  invasores();  //mouse pressed
  finJuego();
   textFont(createFont("SansSerif",15));
  text("puntos:" + score,500,80);
 
    
}
 
 
void arma(){
   fill(0,255,0);
  stroke(color(0,255,0));
  smooth();
  triangle(mouseX-8,580,mouseX+8,580,mouseX,565);
 
}
 
void invasores(){
  int diametroInvasor=10;
    fill(random(255),random(250),random(240),random(210));
  stroke(color(255,0,0));
   
for(int i=0; i<5; i++){
  ellipse(coordenadasXinvasor[i], coordenadasYinvasor[i]++,diametroInvasor,diametroInvasor);
   
}
 
}
//disparo (click mouse)
void mousePressed(){
  proyectil(mouseX);
 
}
 
void proyectil(int disparoX){
  boolean acertar = false;
  for( int i=0; i<5; i++){
    if((disparoX >= (coordenadasXinvasor[i]-diametroInvasor/2)) && (disparoX<= (coordenadasXinvasor[i]+diametroInvasor/2))){
      acertar=true;
      score=score+1;
 
        line(mouseX,565,mouseX,coordenadasYinvasor[i]);
        ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i],diametroInvasor + 25, diametroInvasor + 25);
        coordenadasXinvasor[i]=int(random(600));
        coordenadasYinvasor[i]=0;
    }
  }
   
if (acertar==false){
  line(mouseX,565,mouseX,0);
   
}
}
//final
void finJuego(){
  for(int i=0; i<5; i++){
    if (coordenadasYinvasor[i]==600){
      fill(color(255,0,0));
      text("game over!!",250,250);
      noLoop();
      fill(255);
       
   
    }
     
  }
  if(score==20){
  text("you win!!",250,250);
  noLoop();
   
}
}


