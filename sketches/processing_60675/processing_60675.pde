
void setup (){
  size (450, 450);
  background(0);



  stroke(255);
  fill(255,50);
  smooth();
 
   for(int i = 0; i < 250; i = i+5){
    for(int j = 0; j < 250; j = j+10){
       rotate(30);
    ellipse (i, j, i/10, j/10);
     
    }}

  
  stroke(255);
  fill(255,50);
  smooth();
 
   for(int k =250; k < 450; k = k+10){
    for(int l = 0; l <450; l = l+10){
       rotate(30);
     rect (k, l, k/10, l/10);
       
    }}
}
