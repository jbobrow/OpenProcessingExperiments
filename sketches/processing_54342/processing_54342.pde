
size(800,500);
smooth();
background(0);
float verticalx=0;
translate(250,250);
noStroke();
 
for (float i=0; i<500;i=i+1) {
// background(0);
 
  fill(random(255),random(255),random(255),random(50));
  rotate(0.1);
  rect(i,0, verticalx, verticalx);
  rect(i,0, 100,60);
  
  if (verticalx==verticalx) { //esfera se va a la derecha
    verticalx=verticalx+.1;
    
  
  }
  // ellipse (i,1, 100,60);
   
  //triangle(i+80,100,600,i,i,300);
  //rect(i,100,200,200);
 
  
}
            
                
                
