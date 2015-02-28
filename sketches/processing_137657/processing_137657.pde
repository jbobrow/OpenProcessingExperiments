
float x, y;
float dim = 80.0;

void setup(){
  size(700,400);
  background(240,180,120);
  stroke(32,20,80);
  fill(200,220,220);
  strokeWeight(2);
  smooth();
}

void draw(){
  for(int j=0; j<5; j++){
    pushMatrix(); //koordinatensystem sichern
    for(int i=0; i<5; i++){
      figure();
      x = x + 0.8;
  
//  if (x > width + dim) {
//    x = -dim;
//  }
  translate(x, height/2-dim/2);
  //fill(255);
  //rect(-dim/2, -dim/2, dim, dim);
  triangle(10, 10, 50, 65, 30, 10);
  
  // Transforms accumulate. Notice how this rect moves 
  // twice as fast as the other, but it has the same 
  // parameter for the x-axis value
//  translate(x, dim);
//  fill(0);
//  rect(-dim/2, -dim/2, dim, dim);
      //translate(80,0);
      translate(70, 0);
      scale(-1,1);
    }
    popMatrix(); //gesicherten koordinatensystem laden
    translate(0,80);
    translate(-30, 60);
}
}

//void vertSpiegel(int y){
//  translate(0, 2*y); //Achse verschieben
//  scale(1,-1); //verticak spiegeln
//}

void figure() {
  triangle(10, 10, 50, 65, 30, 10);
}
