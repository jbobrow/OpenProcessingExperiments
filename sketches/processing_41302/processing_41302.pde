
int x=0;
int y=0;
int val=0;


void setup(){
  size(400,400);
  background(180,180,160);
  smooth();
}

void draw(){
   x= val;
         

  
  if(mousePressed){
    val= val+1;
    fill(x,x/2,x*2,x/5);
      ellipse(mouseX,mouseY, x,x);
  }else{
    val=0;
  
  }
  
     
      
      
 
 }

                
                
