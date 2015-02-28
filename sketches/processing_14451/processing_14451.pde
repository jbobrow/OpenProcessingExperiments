
float[] valores = {25.0, 45.0, 5.0, 15.0, 10.0};
float sumval = 0;

void setup(){
  size(200, 200);
  noStroke();  
  dibujartarta(200,100,100);
}
void dibujartarta(int radio, int centrox, int centroy){
  background(0);

  
  for(int i = 0; i < valores.length; i++){
    fill(random(50,255), random(50,255), random(50,255));    
    arc(centrox, centroy, radio, radio, TWO_PI / 100 * sumval, TWO_PI / 100 *(sumval+valores[i]));
    sumval = sumval+valores[i];
  }
}

