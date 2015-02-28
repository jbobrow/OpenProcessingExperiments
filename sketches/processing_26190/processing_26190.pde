
float angle= 0.0;
float speed= 0.5;
float radA =100.0;
float radB =350.0;


void setup(){
  smooth();
  size(800,800);
  frameRate(260);
   background(0);
    
}
  void draw(){
  
  angle += speed;
  float sinval = sin(angle);
  float cosval = cos(angle);
  float x = 400+(cosval*radB);
  float y = 400+(sinval*radB);
  line(x,y,400,400);
  radB=(radB-2);
  
  
  if(radB<100){
  radA=(radA+2);
  stroke(0,255,0);
  angle += speed;
  float sinval = sin(angle);
  float cosval = cos(angle);
  float x = 400+(cosval*radA);
  float y = 400+(sinval*radA);
  line(x,y,400,400);
  }
  
 
   
  for(int j=0; j<650; j+=10){
   noFill();
   stroke(0,0,255);
   strokeWeight(1);
   ellipse(400,400,j+2,j+2);
   stroke(255,0,0);
       
  }
  
}

