
class AA {
  float post3 =250;
  float post4 =150;
  float ang2= 0;
PImage b = loadImage("color.png");

  void muestraAA() {
    
    float pos3 = width/2 + (10 * sin(ang2));
    float pos4 = width/2 + (10 * cos(ang2));
image(b,130,70,pos3,pos4);
    ang2+= 0.1;
  }
}


