
int a=20;
int direccion= 1;
PImage foto;
void setup (){
  strokeWeight(5);
  size(800,800);
  rectMode(CENTER);
  background(0 );
 
  foto = loadImage("IMGP3785.JPG");
}
void draw(){
stroke(167,8,9,89);
  line(pmouseX, pmouseY,890,12);
  image(foto,a,a,a,a);
  a=a+direccion;
if(a>700){
  if(a<=700||a>=20){
    }
  direccion=direccion*-2;

}
}

