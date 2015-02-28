
int x=100;
int y= 100;
int val=0;
 
 
void setup(){
  size(400,400);
  background(160);
  smooth();
}
 
void draw(){
   x= val;
          
 
   
  if(mousePressed){
    val= val+3;
    fill(x/2,x/2,x*2,x*9);
      line(mouseX,mouseY, x*2, y*8);
        ellipse(mouseX,mouseY, x,y);
  }else{
    val=0;
   
  }
   
      
       
       
  
 }
 
             
