
void setup(){
  size(400,400);
  background(255);
   rect();
    random();
}
 void random(){
  for (int x = 0; x<300; x=x+15){
    for (int y = 0; y<300; y=y+15){
     rect (random(20,380),random(20,380),2,2);
    }
  }  
 }
 void rect(){
   rect (20,20,360,360);
 }
