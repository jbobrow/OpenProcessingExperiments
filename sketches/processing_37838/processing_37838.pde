
size (400, 400);
ellipseMode(CENTER);
rectMode(CENTER);
colorMode(RGB,width);

noFill();
pushMatrix(); //sets up new origin
int x=20;
background(x,width,width);

translate(width/2,height/2); //sets origin to the middle of the composition

for (int circSize = 400;circSize >= 100; circSize-=10) { //creates the descending ellipse
  ellipse(0, 0, circSize, circSize);
}


for (int rectSize = 200; rectSize >=5; rectSize-=5) { //crestes the centered descending rectangle
  rect(0, 0, rectSize, rectSize);
}
for(int rectSize=200; rectSize>=5; rectSize-=5){ //rotates rectangle down by 45 degrees
  for(int i=0; i<45; i+=rectSize){
    rotate(radians(i));
    rect(0,0,rectSize,rectSize);
  }
}
popMatrix(); //sets the origin back to the top left corner of the composition


