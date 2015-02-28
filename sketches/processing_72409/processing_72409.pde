
void setup(){
  size(600,600);
    background(180,234,255);

     
  
}
void draw(){
  

  
      
     
  smooth();
  noStroke();
 
 
 for(int m = 0; m<700; m=m+50){

fill(3,3,3);    
rect(m,0,3,600);
  
}
 
 
 
 
 for(int i = 0; i<700; i=i+50){
  for(int x = 0; x<700; x=x+50){

 

fill(0,2,5);
ellipse(i,x,30,30);
fill(3,3,3);
ellipse(i,x,25,25);
fill(3,97,255);
ellipse(i,x,20,20);
fill(255,255,255);
ellipse(i,x,10,10);
fill(255,255,255);
ellipse(i,x,5,5);
fill(255,255,255);
ellipse(i,x,2,2);
 }
 }
 

//


 for(int r= 0; r<700; r=r+100){
  for(int p = 0; p<700; p=p+200){

fill(3,3,3);
ellipse(r,p,90,90);
fill(255,255,255);
ellipse(r,p,80,80);
fill(3,97,255);
ellipse(r,p,70,70);
fill(255,255,255);
ellipse(r,p,60,60);
fill(3,3,3);
ellipse(r,p,50,50);
fill(255,255,255);
ellipse(r,p,40,40);
  }
 }
 

}
//





  





