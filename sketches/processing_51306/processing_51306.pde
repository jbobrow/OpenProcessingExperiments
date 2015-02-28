
//checker board
void setup(){
 size(400, 400);
 smooth();
 strokeWeight(1);
 stroke(0);
 }

 void draw() {
  for(int y = 0; y <=400; y = y+50){
  for(int x = 0; x <=400; x = x+50) {
   
    //% stands for modulo, allows for odd numbers
   if((y+x)%20==0) {
     fill(56); }
    
    rect(x, y, 50, 50);
    fill(255);
  }
  }
 }

