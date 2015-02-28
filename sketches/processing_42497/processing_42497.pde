
int x=0;
int y=0;
int var=0;
 
 
void setup(){
  size(600,600);
  background(0);
  smooth();
}
 
void draw(){
   x= var;
          
 
   
  if(mousePressed){
    var= var+1;
    fill(x+20,x/2,x/2,10);
      ellipse(mouseX,mouseY, x,x);
  }else{
    var=0;
   
  }
   
      
       
       
  
 }

