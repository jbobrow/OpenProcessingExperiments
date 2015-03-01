
size (800,800);
background(0);


for(int x=0; x<800; x=x+20){
  smooth (10);
 fill(random(197),50);
  strokeWeight(3);
  stroke(random(197),random(150),25);
  for(int y=10; y<800; y=y+15){
    ellipse (x,y,30,20);
  rect (x,y,30,20);  
}
}
filter (BLUR, 3);
