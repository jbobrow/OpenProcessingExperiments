
int[] coordenadasXinvasor= {int(random(600)), int(random(600)), 
                            int(random(600)), int(random(600)), int(random(600))};

int[] coordenadasYinvasor= {0,0,0,0,0};
int diametroInvasor=10;
PFont tipo;

void setup (){
  size (600,600);
  tipo=createFont("BlairMdITCTT-Medium-48.vlw",2);
  textFont(tipo,36);
}

void draw (){
  background (0);
  arma();
  invasores();
  finJuego();
  //proyectil(mouseX);
}

void arma (){
  fill (200,255,0);
  stroke(color(0,255,0));
  triangle (mouseX-18,580,mouseX+18,580,mouseX,565);
}

void invasores (){
  noStroke();
  fill(255);
  
  for (int i=0; i<5; i++){
    fill(random(255),random(100),0);
    ellipse (coordenadasXinvasor[i], coordenadasYinvasor[i]++, diametroInvasor, diametroInvasor);
  }
}

void mousePressed(){
proyectil(mouseX);
println("disparo");
}

  void proyectil (int disparoX){
    boolean acertar = false;
    for (int i=0; i<5; i++){
    if((disparoX>(coordenadasXinvasor[i]-diametroInvasor/2)) && 
    (disparoX <=(coordenadasXinvasor[i]+diametroInvasor/2))) {
      acertar=true;
      line(mouseX,565,mouseX,coordenadasYinvasor[i]);
      //text("boom", random(width),random(height));
      ellipse(coordenadasXinvasor[i], coordenadasYinvasor[i], diametroInvasor+1500,diametroInvasor+1500);
      coordenadasXinvasor[i]=int(random(600));
      coordenadasYinvasor[i]=0;
    }
  }
  
  if (acertar==false){
    line(mouseX,565, mouseX,0);
  }
  }
  
  void finJuego(){
   
  for( int i=0; i<5; i++){
    if( coordenadasYinvasor[i] ==590){
      fill(255,0,0);
      noLoop();
      //rect(0,0,600,0,600,600,0,600);
      //fill(255);
      text("EARTH WAS DESTROYED",90,height/2);
       
    }
  }
}  



