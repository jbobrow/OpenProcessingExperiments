
float x,y;
float angulo;
float tono;
int sentido;

void setup(){
  size (1500,700);
  colorMode (HSB,300);
  background (0);
  smooth();
  stroke(tono,50,50,10);
  x=width/2;
  y=0;
  angulo=0;
  tono=255;
  frameRate(80);
}

void draw(){
  translate (x,y);
  rotate(angulo);
  fill(tono,300,300,20);
  ellipse(0,0,250,20);
  y=y+2;
  angulo=angulo+.1;
  tono=tono-.8;
  
  if (sentido==1){
fill(tono,300,300,20);
ellipse(0,0,250,20);
  y=y+2;
  angulo=angulo+.1;
  tono=tono-.8;
  } 
  
 if ((x==width/2)&&(y+20==800)){
   y=0;
  background(0);
  tono=255;
}

}



