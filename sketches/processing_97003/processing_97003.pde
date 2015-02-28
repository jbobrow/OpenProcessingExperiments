
size(200,200); 


background(0,255,0); 


 int x=90; 


 int y=10; 


  stroke(255,0,0); 


  strokeWeight(3); 


 for(; x<200;x+=10){ 


   line(x,y,170,20); 


   line(10,20,-x+180,y); 


   y+=15; 


 }
