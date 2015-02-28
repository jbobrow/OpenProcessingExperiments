

int x = 20;
float y = 0;
float ding = 0;

void setup(){

  size(500,1000);

  noFill();
  background (0);
  
  
}



void draw (){
 while (x<1000){
  fill(255,0,0,50);
  strokeWeight(300);
   stroke (255,200,200,20);
    ellipse ( y, ding ,x,x);
  x=x+ 800;
 }
  if (x > 500){
  y=0;
  ding = ding +100;
 }
 
 y=y+random(200);
   ;
 x=0;
     

} 
