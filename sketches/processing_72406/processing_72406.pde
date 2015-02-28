
void setup(){
  size(600,600);
    background(16,198,225);

     
  
}
void draw(){
  
  
  
 
  
  for (int j = 0;j<60;j=j+5){
    for(int i =0;i<14; i=i+1){
  
      
     
  smooth();
  noStroke();
 
 
 
 
fill(0,14,255);
ellipse(j+15,i*75,60,60);
fill(255,255,255);
ellipse(j+15,i*75,40,40);
fill(3,3,3);
ellipse(j+15,i*75,30,30);

fill(255,255,255);
ellipse(j+15,i*75,20,20);
fill(3,97,255);
ellipse(j+15,i*75,10,10);
fill(255,255,255);
ellipse(j+15,i*75,5,5);

    }
  }
}





