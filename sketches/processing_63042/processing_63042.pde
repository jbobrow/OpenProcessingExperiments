
size(500, 500);
smooth();
 
background(#FFFFFF);

noStroke();
for(int y = 0; y <500; y +=50) {
  for(int x= 0; x < 500; x +=50) {
    fill((x+y)*0.1);
    rect(x,y,50,50);
  }
}


noFill();
stroke(#FFFFFF,20);
for(float y = 0; y <500; y +=100) {
  for(float x= 0; x < 500; x +=100) {

    rect(x,y,50,50);
  }
}

