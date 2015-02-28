
PImage lisa,flor1,flor2,flor4,corazon;
float angulo=0,valor=0;

void setup(){
  size(412,232);
  lisa=loadImage("LisaSimpson.jpeg");
  flor1=loadImage("Flor 1.png");
  flor2=loadImage("Flor 2.png");
  flor4=loadImage("Flor 4.png");
  corazon=loadImage("corazon.png");
  
  background(lisa);
  smooth();
}
void draw(){
 background(lisa); 
 image(flor1,300+20*cos(angulo),100+20*sin(angulo),50,50);
 image(flor2,350+30*cos(-angulo),150+30*sin(-angulo),50,50); 
 image(flor2,250+10*cos(angulo),50+10*sin(angulo),50,50);
 image(flor4,200+40*cos(-angulo),50+40*sin(-angulo),50,50);
 angulo=angulo+0.1;
 scale(1.1);
 image(corazon,150,90,70+valor,50+valor);
 valor=valor+1;
 if(valor==200){
   valor=0;
 }
}

