
/*
Jeff Guo  IxD Term 3 
Interactive Prototyping 3
Sep-26-2013
jeff880412@gmail.com
*/


int i ;
void setup(){
  size(500,500);
  smooth();
  noStroke();
}

void draw() {
  background(204);
  for (int i= 0 ; i < 500; i = i+11) {
  if (i % 2 == 0 ){ 

    fill(255);
   
   }else{
   
   fill(0);
   }
   pushMatrix();
   
   translate(250,250);
   rotate(PI/4);
   rect(i, i, 500-i,500-i);
   rotate(PI/2);
   rect(i, i, 500-i,500-i);
   rotate(PI);
   rect(i, i, 500-i,500-i);
   rotate(3*PI/2);
   rect(i, i, 500-i,500-i);
   
   
   
   popMatrix();
   
   
   
}
}



