
float size = 10;
float speed = 0.1;
int numCir = 60;
 
 
void setup(){
  size(400, 400);
  smooth();
}
 
 
void draw(){   
  
  background(0,10);
  size = size + speed;
   
  if(size > 16.0 || size < 10) speed = -1. * speed;
     
  for(int i = 50; i < numCir; i++){
         fill(150,10); 
         ellipse(0, 0, i * size, i * size);
         ellipse(0, 400, i * size, i * size);
         ellipse(400, 0, i * size, i * size);
         ellipse(400, 400, i * size, i * size);
   }
 
}


