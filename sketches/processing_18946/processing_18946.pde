
size (297,294);
 
for (float x=10.5; x<width;x+=34.5){
  
  if(x%3==0) {
    fill(0,255,0);
    ellipse (x,141,25,25);
  }
  
  else {
    rectMode(CENTER);
    fill (255,0,0);
    rect(x,141,25,25);
  }
}
 

