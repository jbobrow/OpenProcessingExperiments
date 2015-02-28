
void setup(){
  size(1000,800);
  frameRate(25);
  noStroke();
  background(0);
 
}
void draw(){
 
  for(int i = 5; i < width ; i=i+10){
    for(int j = 5; j < height ; j=j+10){
      
     
      if (mousePressed != true) {
       
       
        fill(i/2,j/2,i/4,5);
    rect(i+mouseX,j+mouseY,10,10); 
    rect(mouseX-i,mouseY-j,10,10);
    rect(i+mouseX,mouseY-j,10,10); 
    rect(mouseX-i,mouseY+j,10,10);
      }
else {
     
      fill(i*2,j*2,i*4,5);
    rect(i+mouseX,j+mouseY,10,10); 
    rect(mouseX-i,mouseY-j,10,10);
    rect(i+mouseX,mouseY-j,10,10); 
    rect(mouseX-i,mouseY+j,10,10);
  
}
}
}
}



