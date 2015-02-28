
PFont letra;

int[] coordenadasXinvasor={int(random(600)),int(random(600)),int(random(600)), int(random(600)), int(random(600))};

int[] coordenadasYinvasor={0,0,0,0,0};

int diametroInvasor=20;

void setup(){
  size(600,600);
  letra= createFont("CenturyGothic-Bold-48.vlw",1);
  textFont(letra,48);
}
void draw(){
  background(0);
  arma();
  invasores();
  finJuego();
}

void arma(){
  fill(random(250),0,random(100));
  noStroke();
triangle(mouseX-15,580,mouseX+15,580,mouseX,555);
}

void invasores(){
  noStroke();
  fill(0,random(100),random(250));
  for(int i=0; i<5; i++){
    ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i]++,diametroInvasor,diametroInvasor);
  }
}

void mousePressed(){
  proyectil(mouseX);
}

void proyectil(int disparoX){
  strokeWeight(5);
  stroke(0,250,0);
  fill(0,250,0);
  boolean acelerar = false;
  for (int i=0; i<5; i++){
    if((disparoX>=(coordenadasXinvasor[i]-diametroInvasor/2)) &&
    (disparoX<=(coordenadasXinvasor[i]+diametroInvasor/2))){
      acelerar=true;
      line(mouseX,565,mouseX,coordenadasYinvasor[i]);
      ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i],diametroInvasor+25,diametroInvasor+25);
      coordenadasXinvasor[i]=int(random(600));
      coordenadasYinvasor[i]=0;
    }
  }
  if(acelerar==false){
    line(mouseX,525,mouseX,0);
  }
}

void finJuego(){
  for(int i=0; i<5; i++){
    if(coordenadasYinvasor[i]==600){
      fill(color(255,0,0));
      noLoop();
      text("GAME OVER",170,300);
    }
  }
}
