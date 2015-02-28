
int negros = 4;

void setup() {
  size(400, 500);
  background(255);
  frameRate(6);
}

void draw() {

  int contador = 0;

  for (int j=0; j<50; j++) {
    for (int i=0; i<50; i++) {

      float iM= map(i, 0, 49, 0, 255);
      float jM= map(j, 0, 49, 0, 255);

      if(contador == negros){
      fill(0);
    }else{
      fill(iM,jM,jM);
    }
      rect(8*i, 10*j, 6, 4);

      contador++; //mismo que contador=contador+1
      contador = contador % (negros+1);
      

    }
  }
        negros++;
      negros = negros % 20;
}



