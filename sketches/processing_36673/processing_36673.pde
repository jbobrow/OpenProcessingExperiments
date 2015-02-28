
int ang;
boolean cuadrado;
void setup(){
size(800,800,P3D);
colorMode(HSB);
ang=0;

}
void draw(){
  background(0);
  noFill();

  if(ang>=255){
  ang=0;
}

  stroke(ang,255,255);
ang++;
translate(width/2,height/2);
cuadrados(50,6,60,0);

cuadrados(100,18,30,0);
cuadrados(150,26,15,0);

}
void mousePressed(){
cuadrado=!cuadrado;


}


