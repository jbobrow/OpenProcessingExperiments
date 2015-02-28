
void setup(){
size(200,200);
background(255,255,255);
}
void draw(){
  stroke(0,0,0,0.5);
  strokeWeight(2.5);
 for( int a=2; a<200; a=a+5) {
   line(100-a/2,a,100+a/2,a);
 }
}


                
                
