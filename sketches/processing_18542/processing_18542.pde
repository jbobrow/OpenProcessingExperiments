
void	
  setup(){	
   	
  size(200,200);	
  	
   }	
   void	
  draw(){	
  	
  background(0,0,mouseY);	
   	
  fill(200);	
   	
  ellipse(100,mouseY,50,50);	
  
  fill(255,201,3);
  
  ellipse(100,mouseY-170,50,50);
   	
  fill(255,255,255);	
   	
  rect(0,100,200,200);
  
  if (mouseY>180){
    fill(10,200,10);
    rect(0,100,200,200);
  }
  
  	
  
}	

