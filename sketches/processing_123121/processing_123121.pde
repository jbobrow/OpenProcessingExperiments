
PImage navi;
PImage nonavi;
PImage fondo;
int tama = 0;
Navi[] m = new Navi[30];
void setup(){
  size (640, 360);
  fondo =loadImage("fondo.jpg");
  nonavi =loadImage("nonavi.jpg");
  for (int i = 0; i < m.length;i++){
    navi =loadImage("navi.png");
    m[i] = new Navi(random(width-100), random(height-100));
  }
}
void draw(){
  image(fondo,0,0,640,360);
  for (int i = 0; i < m.length&& i < tama;i++){
    m[i].dibuixa();
    m[i].moure();
  if (i==m.length-1){
    image(nonavi,0,0);
  }
  }  
}
void mousePressed(){
  tama = tama + 1;
}
class Navi {
  float xPos;
  float yPos; 
  Navi(float x, float y){
    xPos = x;
    yPos = y;
  }
  void dibuixa(){
      image(navi,xPos,yPos,100,100);
  }
  void moure(){
    xPos = xPos +random(-5,5);
    yPos = yPos +random(-5,5);
    if (xPos <0) xPos = 0;
    if (yPos <0) yPos = 0;
    if (xPos >width-100) xPos = width-100;
    if (yPos >height-100) yPos = height-100;
     
  }
  
}


