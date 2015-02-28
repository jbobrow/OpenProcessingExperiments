
class Circulo {
  
  float pos1=600;
  float pos2=400;
  float pos3=300;
  float ang=200;
  
  void muestraCirculo () {
    float pos1= width/2 + (150 * sin(ang));
    float pos2= width/2 + (150 * cos(ang));
    noStroke();
    fill(255,0,6);
    ellipse(pos1,pos2,70,70);
    fill(240,10,100);
    ellipse(pos2,pos1,50,50);
    fill(150,0,50);
    ellipse (pos3, pos2, 20, 20);
    ang+= 0.5;
  }  
}



