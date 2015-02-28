


size(300, 300);
background(65, 201, 20);




for (int x=15; x<=270; x+=50) {
  strokeWeight(5); 
  line(x, 15, x, 270);
}//verticalblack lines left justified.  (15,15,15,270) (65,15,65,270)..


for (int x=40; x<=250; x+=25) {
  strokeWeight(1);
  stroke(255);
  line (x, 50, x, 300);
}//white lines on the grid of purple circles


for (int x=15; x<=150; x+=25) {
  
  stroke(0);
  strokeWeight(2);
  fill(144, 78, 173);
  ellipseMode(CENTER);
  ellipse(x, 60, 20, 20);
} //this command moves the purple circles across until it gets 
//to 150.

for (int y=100; y<=250; y+=10) {
  strokeWeight(1);
  stroke(255);
  line (15, y, 300, y);
}//commands white lines- placed before circles to render them behind.(layers)



for (int y=100; y<=260; y+=25) {
  strokeWeight(2);
  stroke(0);
  fill(132, 176, 222);
  ellipseMode(CENTER);
  ellipse(15, y, 20, 20);
}//blue circles going down



