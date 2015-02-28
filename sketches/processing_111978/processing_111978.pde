
size(400,400);
background(255);
 

for (int i = 0; i < 1500; i = i+20) {
  stroke(255,200,0);
  strokeWeight(.5);
  noFill();
  ellipse(width/4,height/2, i, i-200);
  ellipse(width/2,height/4, i, i-200);
  ellipse(width/4*3,height/2, i, i-200);
  ellipse(width/2,height/4*3, i, i-200);
   
}
