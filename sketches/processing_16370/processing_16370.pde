
int x=20;
int direccion= 1;
int y=4;
PImage foto;
void setup (){
  strokeWeight(5);
  size(800,800);
  rectMode(CENTER);
  
 
  foto = loadImage("IMGP3358.JPG");
}
void draw(){
  background(900 );
stroke(167,8,9,89);
  triangle(pmouseX, pmouseY,90,90,12,90);
  image(foto,y,direccion,mouseY,x);
  x= x+direccion;
  y= y+direccion;
if(x>700){
  if(x<=700||x>=20||y<=700||y>=20){
  direccion=direccion*-1;}
  

}
}

