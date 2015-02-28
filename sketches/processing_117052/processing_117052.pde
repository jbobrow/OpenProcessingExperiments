

int eSize = 3;

size(510, 510);
background(5);
stroke(0);
//fill(0);

for(int x=0; x<=510; x++) {

  stroke(255, x, 0, 127);
   line(255, x, 0, 255);
   
   stroke(255, x, x, 127);
   line(x, 255, 255, 510);
   
   
   stroke(255, x, x, 127);
   line(x, 255, 255, 510);
   
   
   stroke(225, 255, x, 127);
   line(255, x, 510, 255);
   
}
for(int x=0; x<=510; x++) {
   

   line(255, 0, 0, 255);
   

   line(0, 255, 255, 510);
   
   

   line(0, 255, 255, 510);
   
   

   line(255, 0, 510, 255);
   
   
   
   //line(255, 0, 0, 255);
   //line(600, 0, x, 600);
   //line(255, 0, 0, 255);
   //line(600, 0, x, 600);
  
 
  
  //stroke(255, x, 0, 127);
  //line(600, 0, x, 600);
  
  //stroke(205, x, 0, 127);
  //line(600, 0, x, 600);
 
}

noFill();
for(int i = 100; i >= 0; i --){
  stroke(0, i*2.55, 100, 100);
  ellipse(width/2, height/2, i+400, i+400);
}
  
  noFill();
for(int i = 100; i >= 0; i --){
  stroke(0, i*2.55, 100, 100);
  ellipse(width/2, height/2, i+200, i+200);
}
  
  noFill();
for(int i = 100; i >= 0; i --){
  stroke(0, i*2.55, 100, 100);
  ellipse(width/2, height/2, i+550, i+550);
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  







