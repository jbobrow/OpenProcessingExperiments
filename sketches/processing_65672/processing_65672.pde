
void setup (){ 
size (800,800);

background(0);
// background (196,240,5);
  for(int a=0; a<width; a+=20) {
    noStroke();
    //fill(196,240,5,80);
    fill(243,252,0,80);
   ellipse(400,400,a+1,a+1);
   
   
}

  noStroke();
for(int i=10; i<800; i+=15) {
  fill (50);
  rect(0,i,800,10);
  rect (i,0,10,800);
  
 
  
  }  

}
