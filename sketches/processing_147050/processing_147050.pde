
void setup(){
 size(400,400);
 //background(40,220,150);
 noStroke();
 noLoop();
}

void draw(){
 for(int i = 0; i < width ; i = i + 40){
   for(int j = 0 ; j < height ; j = j + 40){
     fill(i/4+j/4);
     rect(i+10,j+10,20,20);
   }
 }
 
  
}
