
int[] coordenadasXinvasor={int(random(426)), int(random(426)),
                           int(random(426)),int(random(426)),
                           int(random(426))};
int[] coordenadasYinvasor={0,0,0,0,0};
int diametroInvasor=10;
PImage fondo;
PImage over;
PImage nave;
PImage invasor;
void setup(){
  fondo=loadImage("space.jpg");
  over=loadImage("over.png");
  nave=loadImage("nave.png");
  invasor=loadImage("invasor.jpg");
  size(640,426);
  frameRate(35);

}

void draw(){
  background(fondo);  
  arma();
  invasores();
  finjuego();


}
void arma(){
  
  image(nave,mouseX-32,400,60,60);
}
void invasores(){
  
  for(int i=0; i<5;i++){
  image(invasor,coordenadasXinvasor[i],coordenadasYinvasor[i]+=2,30,30);
          
  }
}
void mousePressed(){
  proyectil(mouseX);
}

void proyectil(int disparoX){
  boolean acertar=false;
  for(int i=0;i<5;i++){
    if((disparoX>=(coordenadasXinvasor[i]-diametroInvasor+20)) &&
      (disparoX<=(coordenadasXinvasor[i]+diametroInvasor+20)))
      {
        acertar=true;
        stroke(0,255,9);        
        line(mouseX,565,mouseX,coordenadasYinvasor[i]);
        ellipse(coordenadasXinvasor[i],coordenadasYinvasor[i],
        diametroInvasor+25,diametroInvasor+25);
        coordenadasXinvasor[i]=int(random(426));
        coordenadasYinvasor[i]=0;  
      }
  }
  if(acertar==false){
        line(mouseX,565,mouseX,0);
}
}

void finjuego(){
  for(int i=0;i<5;i++){
    if(coordenadasYinvasor[i]==426){
    image(over,0,0,640,426);
      noLoop();
    }
  }
}
  
  
  




