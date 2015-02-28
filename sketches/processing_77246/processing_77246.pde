

 int[] coordenadasXinvasor={int(random(600)),int(random(600)),int(random(600)),int(random(600)),
  int(random(600)),int(random(600))};
  
  int[] coordenadasYinvasor={0,0,0,0,0,0};
  
  int diametroInvasor=20;

PFont letra;

void setup(){
  
  size(620,600);
  
  letra=createFont("28DaysLater-48.vlw",2);
  textFont(letra,48);
}

void draw (){
 
  background(0);
  invasores();
  arma();
   juegofin();
}
//arma

void arma(){
  
  fill(255,0,0);
  stroke(color(255,0,0));

  triangle(mouseX-8,580,mouseX+8,580,mouseX,565);
    fill(0,0,200);

  rect(mouseX-30,580,62,100);
  
}

//invasores
void invasores(){
  
 stroke(255);
 fill(0,255,0);
  
  for(int i=0; i<6; i ++){
    ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i]++,
    diametroInvasor,diametroInvasor);
  }
    
  }

void mousePressed(){
  proyectil(mouseX);
 //println("disparo");   
    
}
  
  // proyectil

void proyectil(int disparoX){

boolean acertar = false;
for (int i=0; i<5; i++){
  if((disparoX>=(coordenadasXinvasor[i]-diametroInvasor/2))&&
  (disparoX<=(coordenadasXinvasor[i]+diametroInvasor/2))){
    acertar=true;
    line(mouseX,565,mouseX,coordenadasYinvasor[i]);
    ellipse(coordenadasXinvasor[i], coordenadasYinvasor[i],diametroInvasor+80,diametroInvasor+25);
    coordenadasXinvasor[i]=int(random(699));
    coordenadasYinvasor[i]=0;
}
}


if(acertar== false){
  line(mouseX,565,mouseX,0);
}
}
  
  void juegofin(){
  
  for( int i=0; i<6; i++){
    if( coordenadasYinvasor[i] ==600){
      fill(color(255,0,0));
      noLoop();
      fill(255);
      text("INVADERS WIN",170,300);
      
    }
  }
}


