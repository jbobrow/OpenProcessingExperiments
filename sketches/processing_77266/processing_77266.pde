
int[] coordenasXinvasor={int(random(600)),int(random(600)),int(random(600)),
int(random(600)),int(random(600))};

int[]coordenasYinvasor={0,0,0,0,0};

int diametroInvasor=20;


void setup(){       
  size(600,620);
}

void draw(){
  background(150);

arma();
invasores();

finJuego();

}


void arma(){
  fill(0,random (255),0);
  stroke(color(random(255),random(255),random (255)));
  triangle(mouseX-8,600,mouseX+8,600,mouseX,500);
}

void invasores(){
  stroke(random(255),random(255),random (255));
  fill(random(255),random(255),random(255));
  
  for (int i=0; i<5; i++){
    rect(coordenasXinvasor[i],coordenasYinvasor[i]++,diametroInvasor,
    diametroInvasor);
    
  }
}


void mousePressed(){
  proyectil (mouseX) ;
}
  
  void proyectil(int disparoX){
    boolean acertar = false;
    for (int i=0; i<5; i++){
      if(( disparoX>=(coordenasXinvasor[i] -diametroInvasor/2)) && 
      (disparoX<=(coordenasXinvasor[i]+diametroInvasor/2))){
        acertar=true;
        line(mouseX,565,mouseX,coordenasYinvasor[i]);
        ellipse(coordenasXinvasor[i], coordenasYinvasor[i],
        diametroInvasor+25, diametroInvasor+25);
        coordenasXinvasor[i]=int(random(600));
        coordenasYinvasor[i]=0;
      }
    }
    if (acertar==false){
      line (mouseX,550,mouseX,0);
      
    }
  }
 
  void finJuego(){
    for (int i=0; i<5; i++){
      if (coordenasYinvasor[i] ==600){
        fill(color(255,0,0));
        noLoop ();
      }
    }
  }

