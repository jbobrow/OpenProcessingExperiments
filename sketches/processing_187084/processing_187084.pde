
void setup(){
  size(1000,1000);
  background(0);
}
  
void draw (){
   
  for(int x = 1; x < width; x += 5){
    for(int y = 0; y <height; y += 5){
       noStroke(); 
       fill(5*x,3*y,1*x);
        ellipse(10*x,10*y,30,30);
    }
   
  }
 
}



