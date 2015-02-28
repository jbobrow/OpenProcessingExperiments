
void setup(){
  size(400, 400);
  background(1);
}
 
float j;
float b = 1.200;
void draw() {
   for (int i = 0; i < 200; i = i+300) {
  background(0);
  b = (b + 100)%350;
  rect(j, j, b, b);
  fill(1000, 1000, 200);
}
}


 
                
        
