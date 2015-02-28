
int linea=0;
void setup (){
  size (500,500);
  stroke(3);
}
void draw(){

  line(random(499),random(499),random(499),random(499));
  linea=linea+1;
  stroke(random(255));
  
  if(linea==300){
    linea=0;
    background(random(0,255));
  }
  
}  
