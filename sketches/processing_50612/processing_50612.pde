

  
  int linea=0;
void setup (){
  size (500,500);
  noStroke();
  smooth();
}
void draw(){

  ellipse(random(499),random(499),30,30);
  linea=linea+1;
  fill (random(255),random(255),random(255));
  if(linea==500){
    linea=0;
    background(random(0,255),random(0,255),random(0,255));
  }
  
}
