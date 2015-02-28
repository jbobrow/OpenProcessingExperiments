
float longitud;

void setup(){
  size(400,400);
  background(0);
  smooth();
 
}

void draw(){
   for (int i = 0; i <height; i= i+20){
   stroke(random(200,255), random(100,200),random (25,100));
   beginShape(POINTS);
  vertex(random(0,400),random(0,400));
  endShape();
  }
}
  

