
int limite = 120;
int ancho = 240;
float step = 2.5;
 
void setup(){
  size(900,450);
   
  background(#12343C);
   
  noFill();
  smooth();
  strokeWeight(0.50);
  strokeCap(ROUND);
  stroke(#FFFFFF);
  noLoop();
}
 
void draw(){
  for(float i = 0; i < limite; i=i+step){
     
    float f1 = random(90);
    float f2 = random(360-f1);
     
    arc(width/2, height/2, ancho+i,ancho+i,   radians(-f1), radians(f2));
  }
}

                
                
