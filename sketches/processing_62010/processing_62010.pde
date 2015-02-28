
size(400,500);
smooth();
 
translate(mouseX, mouseY);
for(int x=3; x<=300; x+=20) {
  rotate(degrees(x+9));
  stroke(random(255),random(255),random(255));
  strokeWeight(15);
  rect(x+10,x,mouseX,13);
  rect(x+7,x,12,mouseY);
  stroke(3);
  strokeWeight(4);
  noFill();
  line(x,3,x,width);
  line(0,x-7,height,x-3);
}

