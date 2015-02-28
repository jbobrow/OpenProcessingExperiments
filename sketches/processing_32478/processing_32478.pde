



int x = 20;
float y = 0;
float ding = 0;

void setup(){

  size(500,1000);
 // beginRecord(PDF, "6.pdf");
  noFill();
  background (0);
  
  
}



void draw (){
 while (x<1000){
  fill(255,0,0,40);
  strokeWeight(2);
   stroke (255,200,200,70);
    ellipse ( y, ding ,x,x);
  x=x+ 800;
 }
  if (x > 500){
  y=0;
  ding = ding +100;
 }
 
 y=y+ 200
   ;
 x=0;
     

}

//void mouseClicked(){
// endRecord(); 
//}

