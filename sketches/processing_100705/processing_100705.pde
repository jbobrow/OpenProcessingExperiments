
int angulo;
float x,px,py,h, amplitude, frequencia;

void setup(){
  size (500,500);
  background(0);
  smooth();
  stroke(255,50);
  angulo=0;
  x=0;
  h=250;
  px=0;
  py=250;
  amplitude=50;
  frequencia=10;
}

void draw(){
  //  background(0);
  //  fill(0,8);
  //  rect(0,0,width,height);
  
  for (int i=0;i<width;i++){
    frequencia = map(mouseX,0,width,0,45);
    amplitude = map(mouseY,0,height,0,50);
  
  /*
  if (px>width){
    px=0;
    h=random(height);
    x=0;
    py=250;
  }
  */
  
  angulo+=frequencia;
  
  float y = mouseY + (cos(radians(angulo))*amplitude);
  
  stroke(random(225),random(225),random(225),20);
  strokeWeight(1);
  line(px,py,x,y);
  px=x;
  py=y;
  x=i; 
 } 
}
