
int contador=-200;
float angulo, cambioAngulo,cambioRadio,radio;
int posX =0;
int posY =0;
boolean direccion=true;
PImage boo ;

void setup(){

  size(500,500); 
  frameRate(100);
  smooth();
  boo = loadImage("jovenes-estrellas.jpg");
  //background(0);
  angulo =0.05f;
  cambioAngulo=0.05f;
  cambioRadio=1;
  radio=100;
  smooth();
  
}

void draw(){
background(0);
image(boo,0,0,width,height);
fill(255);

translate(width/2,height/2);
fill(#0EA3EA);
ellipse(contador,posY,80,80);
float posX=2*(radio*cos(angulo));
float posY=1.3*(radio*sin(angulo));

ellipseMode(CENTER);
noStroke();




fill(255);
ellipse(contador+posX+(100-radio)/2,posY+(100-radio)/2,30,30);
angulo+=cambioAngulo;


if(direccion==true){
           contador++;
       if(contador >200){
       direccion=false;
       }
       }
       if(direccion==false){
      contador--;
      if(contador==-200){
      direccion=true;  
        
     }
     }


}
  

