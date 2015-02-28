

int[] coordenadasXinvasor= {int (random(600)), int (random(600)), int (random(600)), int (random(600)), int (random(600)), int (random(600))};

int[] coordenadasYinvasor= {0,0,0,0,0};

int diametroInvasor=10;


void setup(){
size (600,600);

}

void draw(){
PImage b = loadImage("lores.jpg");
image(b,0,0);
arma();
invasores();
finJuego();
}


//el arma
void arma(){
PImage c = loadImage("nave.png");

image(c,mouseX-49,530,100,100);
} 

//invasores
void invasores(){
  stroke (255);
  fill(0,255,0);
  
  
for (int i=0; i<5; i++){
  ellipse (coordenadasXinvasor[i], coordenadasYinvasor[i]++, diametroInvasor, diametroInvasor);
  
}

}

//el disparo (click mouse)

void mousePressed(){
proyectil (mouseX);
}
//El proyectil
void proyectil (int disparoX){
 boolean acertar = false;
for (int i=0; i<5; i++){
if((disparoX>=(coordenadasXinvasor[i]-diametroInvasor/2)) &&
(disparoX<=(coordenadasXinvasor[i]+diametroInvasor/2))){
   acertar = true;
   stroke(255,0,0);
   line(mouseX, 565, mouseX, coordenadasYinvasor[i]);
   fill(255,0,0);
   stroke(255,0,0);
   ellipse(coordenadasXinvasor[i], coordenadasYinvasor [i], diametroInvasor+65, diametroInvasor+65);
   coordenadasXinvasor[i] = int(random(600));
   coordenadasYinvasor[i]=0;
   }
}

  if(acertar== false){
  line(mouseX, 565, mouseX,0);
  }
}
 //El final
 void finJuego(){
     for (int i=0; i<5; i++){
       if (coordenadasYinvasor[i]==600){
         fill(color(255,0,0));
         noLoop();
       }
     }
 }
 

  

