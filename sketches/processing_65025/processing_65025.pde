
float r;
float theta=360*50;
int multi = 1;

void setup() {
  size(1200, 720);
  strokeWeight(1.2);
  smooth();
  background(0);
  frameRate(120);
}


void draw() {

  for (int i =0; i< 100; i++) {
    theta=theta+ multi*0.09;
    
      //limites para a espiral parar de ser desenhada 
      if (theta < 0 || theta >360*50) {
        multi = multi * -1; //alternando entre inteiro positivo e negativo: +1 -1
        break;
      }
    
    r = 360-theta/50;

    float x =width/2 +r*cos(radians(theta)); //width/2 para posicionar no meio da tela | radians para converter pi em radianos
    float y = height/2+r*sin(radians(theta));


    if (multi > 0) {
      stroke(0,0,0);
      strokeWeight(2);
    }
    if (multi < 0) {
      stroke(255, 255, 255);
      strokeWeight(1.2);
    }
    
    
    point (x, y);    
  }
} 



