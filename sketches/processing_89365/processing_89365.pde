
float largeur, colonnes;

void setup(){
  size(400,400);
  smooth();
  frameRate(30);
  
  colonnes = 10;
  largeur = width/colonnes;
}

void draw(){
  background(127);
  
  noStroke();
  
  for(int j = 0; j<colonnes; j++){
    for(int i = 0; i<colonnes; i++){
      fill(20*i, 20*j, 20*PI);
      stroke(20*i);
      rect(i*largeur,j*largeur,largeur,largeur);
    }
  }
}
