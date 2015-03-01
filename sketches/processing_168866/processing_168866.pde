
float x = 10;
float y = 10;
float SPa =10;
float SPb =10;

void setup(){
  size(500,500);
  noCursor();
}

void draw (){
  stroke(0);
  fill(255);
  ellipse(x,y,50,50);
  x=x+SPa;
  y=y+SPb;
  
  if (x>width-20||x<10){
  SPa=SPa*-1;
  }
  
  if(y>height-22||y<10){
  SPb=SPb*-1;
  }
  
  if(mousePressed){
  stroke(255);
  fill(0);
  ellipse(x,y,60,60);
  x=x+SPa;
  y=y+SPb;

}}

