
int[] coordenadasXinvasor={int(random(600)), int(random(600)),
int(random(600)), int(random(600)), int(random(600))};
int[] coordenadasYinvasor={0, 0, 0, 0, 0};
int diametroInvasor = 10;


void setup(){
 
 size(600, 600);
   
}

void draw(){
 background(0);
 arma();
 invasores();
}

void arma(){
 fill(0, 255, 0);
 stroke(color(0,255,0));
 triangle(mouseX-8, 580, mouseX, 565, mouseX+8, 580 ); 
}

void invasores(){
 stroke(255);
 fill(255);

  for(int i =0; i<5; i++){
   ellipse(coordenadasXinvasor[i], coordenadasYinvasor[i]++, diametroInvasor, diametroInvasor);
  } 
  
}

void mousePressed(){
 proyectil(mouseX); 
  
}

void proyectil(int disparoX){
 boolean acertar = false; 
  for(int i =0; i<5; i++){
   if((disparoX>=(coordenadasXinvasor[i]-diametroInvasor/2)) && (disparoX<=(coordenadasXinvasor[i]+diametroInvasor/2))){
    acertar = true;
    line(mouseX, 565, mouseX, coordenadasYinvasor[i]);
    ellipse(coordenadasXinvasor[i], coordenadasYinvasor[i], diametroInvasor+25, diametroInvasor+25);
    coordenadasXinvasor[i]=int(random(600));
    coordenadasYinvasor[i]=0;
   }
   
  }
  
  if(acertar==false){
    line(mouseX,565,mouseX,0);
   }
}
