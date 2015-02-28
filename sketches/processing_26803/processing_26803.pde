
class F1 {

  
  float pos1=250;
  float pos2=150;
  float ang=0;
  
  void muestraF1 () {
    
    float pos1=width/2 + (1 * sin(ang));
        float pos2=width/2 + (1 * cos(ang));
        noStroke (); 
        ellipse(pos1, pos2, 5, 56);
        ang+= 0.2;
  }
 
}




