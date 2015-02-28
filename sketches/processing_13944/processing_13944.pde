
void setup(){
  size(300,600);
  background(255);
  smooth();
  
}


void draw(){
 background(57,153,227,50);
 int s = second();
 fill(204, 102, 0);
 for(int i = s; i>0; i --){
   rect(-100, 600-10*i, 500, 10);
 }
 pushMatrix();
  translate(0, 200);
  rotate(PI/7);
  int m = minute(); 
   fill(255, 204, 0);
   for(int j = m; j>0; j --){
   rect(-50, 360-12*j, 500, 12);
   }
   pushMatrix();
      translate(0, 200);
      rotate(-PI/6);
      int h = hour();
       fill(244, 228, 169);
       for(int k = h; k>0; k --){
       rect(-100, 247-15*k, 600, 15);
   }
 popMatrix();  
 popMatrix();  
}

