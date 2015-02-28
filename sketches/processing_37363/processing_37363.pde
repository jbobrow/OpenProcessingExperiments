
size(300,300);
smooth();
for(int x=0; x<=300; x+=20) {
  stroke(random(255),random(255),random(255));
  strokeWeight(10);
  rect(x+5,x,width,10);
  rect(x+5,x,10,height);
  stroke(0);
  strokeWeight(2);
  noFill();
  line(x,0,x,width);
  line(0,x-5,height,x-5);
}



