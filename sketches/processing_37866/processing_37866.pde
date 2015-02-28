
size(300,300);
background(0);
rectMode(CENTER);

translate(width/2,height/2);  //origin in center of drawing
  
for(int x = 0; x < 360; x+=5) {  //counts variable in multiples of 5
  pushMatrix();
  rotate(radians(x));  //draws rectangle every 5 degrees of 1 revolution
  translate(100,10);  //10 pixels from center
  fill(0, x, 100);
  rect(0,0,x,5);  //variable sets height of rectangle to grow as it rotates
  popMatrix();
}

for(int x = 0; x < 360; x+=10) {  //counts variable in multiples of 10
  pushMatrix();
  rotate(radians(x));  //draws rectangle every 10 degrees of 1 revolution
  translate(100,50);  //50 pixels from center
  fill(0,x,100); 
  rect(0,0,x,10);  //variable sets height of rectangle to grow as it rotates  
  popMatrix();
}

for(int x = 0; x < 360; x+=15) {  //counts variable in multiples of 15
  pushMatrix();
  rotate(radians(x));  //draws rectangle every 15 degrees of 1 revolution
  translate(100,100);  //100 pixels from center
  fill(0,x,100); 
  rect(0,0,x,15);  //variable sets height of rectangle to grow as it rotates
  popMatrix(); 
}


