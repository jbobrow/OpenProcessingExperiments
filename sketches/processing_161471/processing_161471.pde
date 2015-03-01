
//by Emilie Roquet

//carrés de 2x2 pixels
float l,h=2;

void setup(){
  size(400,400);
  background(255);
  smooth();
}

void draw(){
  stroke(255,154,63);
//répétition de contours de carrés
//20 = écartement entre les carrés
  for (int i=20; i<width; i+=20){
    for (int j=20; j<height; j+=20){
//variation au hasard des carrés sur le quadrillage entre -4 et 4
      rect(i+random(-4,4), j+random(-4,4), l, h);
      
    }
  }
}



