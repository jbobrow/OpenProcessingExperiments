
void setup (){
  print(50);
  size(600,400);
}


void draw() {
  background(255); 
 for(int x = 0; x<600; x=x+10){
  for(int y=0; y<400; y=y+10){
 fill(x/2,y/2,255);
      ellipse(x,y,10,10);
   }
  }
 }
