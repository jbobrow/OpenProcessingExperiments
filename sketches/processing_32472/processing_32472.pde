
int x = 20;
int y = 0;
int ding = 0;
 
void setup(){
 
  size(500,1000);
  //beginRecord(PDF,"wow3.pdf");
  smooth();
  noFill();
  background (0);
   
   
}
 
 
 
void draw (){
 while (x<1000){
  fill(255,0,0,10);
  strokeWeight(52);
   stroke (255,255,255,14);
    ellipse ( y, ding ,x,x);
  x=x+ 150;
 }
  if (x > 500){
  y=0;
  ding = ding +100;
 }
  
 y=y+100;
 x=0;
      
 
}
 
//void mouseClicked(){
 //endRecord();
//}

                
                
