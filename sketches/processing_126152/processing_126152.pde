
Engranajes clock;

void setup(){
 size(500,500);
 smooth();
 for(int i = 0; i < 1000; i++){
 clock = new Engranajes();}
 background(255);
}

void draw(){

clock.limpiar();
clock.hands();
clock.circulos();

}



  class Engranajes{
  void limpiar(){
      if(second() == 0){
        noStroke();
        fill(255);
        ellipse(width/2, height/2,width/2 + 100, height/2 + 100);}
      }

  void hands(){
    float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
    float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
    float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;
      //SEGUNDOS
      strokeWeight(5);
      stroke(#FFB41F);
      line(250, 250, cos(s) * 168 + 250, sin(s) * 168 + 250);
      strokeWeight(8);
      stroke(255);
      line(250, 250, cos(s) * 145 + 250, sin(s) * 145 + 250);
      //MINUTOS
      strokeWeight(9);
      stroke(#AE06FF);
      line(250, 250, cos(m) * 108 + 250, sin(m) * 108 + 250);
      strokeWeight(18);
      stroke(255);
      line(250, 250, cos(m) * 80 + 250, sin(m) * 80 + 250);
      //HORAS
      strokeWeight(12);
      stroke(#19CC75);
      line(250, 250, cos(h) * 68 + 250, sin(h) * 68 + 250);
      strokeWeight(25);
      stroke(255);
      line(250, 250, cos(h) * 40 + 250, sin(h) * 40 + 250);
  }
  
  void circulos(){
      noFill();
      strokeWeight(5);
      stroke(#FFB41F,10);
      ellipse(250,250,340,340);
      strokeWeight(9);
      stroke(#AE06FF);
      ellipse(250,250,220,220);
      strokeWeight(12);
      stroke(#19CC75);
      ellipse(250,250,150,150);
  }
  
 }
  


