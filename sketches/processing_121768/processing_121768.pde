
//David Escudero
//1 ASIX

void setup(){
  size(400,400);
  //Controlador de velocitat de les imatges
  frameRate(1);
}

void draw(){
  //Color per al fons
  background(25,25,112);
  int j=0;
  while(j<200){
    int bombolla=color(100,149,237);
    //Variable per l'anchura de les bombolles
    float posX = random(width);
    //Variable per la amplitud de les bombolles
    float posY = random(height);
    float mida = random (60);
    ellipse(posX,posY,mida,mida);
    //Color per les bombolles
    fill(bombolla);
    stroke(255,255,255);
    j=j+5;
  }
}


