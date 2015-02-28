
int abstand = 35;
 
void setup(){
  smooth();
  size(600, 600);

  background(255);
  noStroke();
  fill(0,255/35);



   for(int x=0; x <= width; x = x+abstand){
    for (int y=0; y <= height; y = y+abstand){
      for(int i=0;i<=35;i++){
  ellipse (x, y, i, i); 
      }
    }
   }
 }
   


