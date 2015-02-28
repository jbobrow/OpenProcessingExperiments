

background(0);
size(500, 500);
smooth(); 

int distance = 50;

for (int i = 1; i<=9; i++) {
  noStroke();

  for ( int j=1; j<=9; j++) {
fill(0,255,255,255-(j*25));
    ellipse(distance*i, distance*j, 5*i, 5*i);
  }
}



                
                
