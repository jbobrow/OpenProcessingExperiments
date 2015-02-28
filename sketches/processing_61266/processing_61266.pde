
void setup(){
size(400,400);
background(255,255,255);

}

void draw(){
  background(255,255,200);

  for(int i=0;i<=mouseX;i=i+20){
    line(0,i,i,400);
    line(400,i,i,0);
    line(0,i,i,400);
    line(i,0,0,i);
    line(i,400,400,i);
      
    
    
   
   
    ellipse(mouseX,mouseY,mouseX,mouseX);
    fill(255,255,0);
    
    
   
   
      

    
  }
  }


