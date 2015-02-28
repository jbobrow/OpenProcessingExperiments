
void setup(){
  background(255);
  size(450,450);
 
}
 
 
 
void draw(){

  int mx=450;
  int stp=5;
   
  
  
  for(int i=0; i <= mx; i = i+stp){
   stroke(0,153,0);
   strokeWeight(0.07);
  line (i,0, 0, mx-i);
  stroke(153,0,0);
  strokeWeight(0.07);
  line (0, i, mx-i, 0);
  }
}
