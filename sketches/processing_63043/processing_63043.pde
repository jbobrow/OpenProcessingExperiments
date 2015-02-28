
size(500, 500);
smooth();
 
background(#FFFFFF);

noStroke();

for(float y = 0; y <500; y +=20) {
  for(float x= 0; x < 500; x +=20) {
  fill(0,0,0,50);  
 quad(x, y, x, y+10, x+20, y+10, x+20, y+20);

 fill(#00d3b8);
 
 
  rect(x+5,y+5,5,10);
 
  }
}


