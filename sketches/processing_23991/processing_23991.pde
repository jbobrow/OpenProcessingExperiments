
float colonnes = 10;
float rangees = 8;

void setup(){
  size(400,400);
  smooth();
  noStroke();
}

void draw(){
  background(255);
  
  float largeurColonne = width/colonnes;
  float hateurRangee = height/rangees;
  
  fill(0);
  for(int i=0 ; i < colonnes ; i++){  
    for(int j=0 ; j < rangees ; j++){  
      float x = i*largeurColonne;
      float y = j*hateurRangee;
      rect( x+1 , y+1 , largeurColonne-2 , hateurRangee-2 );
    }
  }
}

