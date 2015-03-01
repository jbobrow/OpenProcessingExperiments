
float x = 8;
float y = 2;
float SPa =5;
float SPb =10;
 
void setup(){
  size(500,500);

}
 
void draw (){
  stroke(8);
  fill(80);
  ellipse(x,y,200,200);
  x=x+SPa;
  y=y+SPb;
   
  if (x>width-122||x<1){
  SPa=SPa*-1;
  }
   
  if(y>height-40||y<10){
  SPb=SPb*-1;
  }
   
   stroke(0);
  fill(255);
  ellipse(x,y,45,45);
 
}
