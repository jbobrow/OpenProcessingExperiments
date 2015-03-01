
int eSize=10;

size(400,400);
colorMode(RGB,255);
background(126,250,156);

 for(int x= 0; x <=400; x+=25){
  stroke(61,510-x,29,250);
  strokeWeight(5);
  noFill();
  rectMode(CENTER);
  rect(0,0,x,x);
  
  stroke(61,510-x,29,250);
  strokeWeight(5);
  noFill();
  rectMode(CENTER);
  rect(0,400,x,x);
  
  stroke(61,510-x,29,250);
  strokeWeight(5);
  noFill();
  rectMode(CENTER);
  rect(400,0,x,x);
  
  stroke(61,510-x,29,250);
  strokeWeight(5);
  noFill();
  rectMode(CENTER);
  rect(400,400,x,x);
}

for(int x= 0; x <=300; x+=25){
  stroke(21,390-x,71,250);
  strokeWeight(13);
  noFill();
  ellipse(-10,0,x,x);
  
  stroke(21,390-x,71,250);
  strokeWeight(13);
  noFill();
  ellipse(410,410,x,x);
}



 for(int x= 0; x <=300; x+=25){
  stroke(255,330-x,41,255);
  strokeWeight(25);
  noFill();
  rectMode(CENTER);
  rect(200,200,x,x);
}

for(int x= 0; x <=300; x+=25){
  stroke(21,390-x,71,255);
  strokeWeight(13);
  noFill();
  ellipse(410,0,x,x);
  
   stroke(21,390-x,71,255);
  strokeWeight(13);
  noFill();
  ellipse(0,410,x,x);
}


