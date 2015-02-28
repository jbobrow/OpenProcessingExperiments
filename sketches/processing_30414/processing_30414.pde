
//flickering

float color_cuadro;

void setup() {
  size(500,500); 
  frameRate(30);
}

void draw() {
  if(color_cuadro>=255){
  color_cuadro=0;
  }else{
  color_cuadro=frameCount+255;
  }
  background(255);
  noStroke();
  fill(color_cuadro);
  rectMode(CENTER);
  rect(width/2,height/2,mouseX+10,mouseY+10);
}                                           
