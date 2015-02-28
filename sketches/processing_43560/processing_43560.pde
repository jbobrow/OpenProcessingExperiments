
int x=10;
int y= 10;
int val=10;
  
void setup(){
  size(500, 500);
  background(100, 40, 80);
  smooth();
}
  
void draw(){
   y= val;
  if(mousePressed){
    val= val+1;
    fill(x/10,x/20,x*50,x*3);
        ellipse(mouseX,mouseY, x,y);
  }else{
    val=1;
    
  }    
 }

                
                
