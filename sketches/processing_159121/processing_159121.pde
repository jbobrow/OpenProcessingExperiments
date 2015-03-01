
void setup (){
  print(50);
  size(600,400);
}


void draw() {
  background(255); 
 for(int x = 0; x<600; x=x+10){
  for(int y=0; y<400; y=y+10){
    float distancia = dist(mouseX,mouseY,x,y);
        if(distancia>100){
      ellipse(x,y,distancia*0.5, distancia*0.5);
   }
  }
 }
}
