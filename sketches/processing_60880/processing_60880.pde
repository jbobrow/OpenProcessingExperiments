
void setup() {
  size(800, 800);
  background(25);
  smooth();
}



void draw() {
  int big = 80;  
  int anzahl =   width/big;

  float big2 = mouseX/12;
  float big3 = mouseX/7;
  
  for (int i = 0; i<=anzahl;i++) {
  for (int j = 0; j<=anzahl;j++) {
    
    fill(i*50,j*30,mouseY*0.7);
      strokeWeight(1);
      ellipse(big*i,big*j, big3 , big3 );
  }
  }

  println(big);
  println(anzahl);
}

 


