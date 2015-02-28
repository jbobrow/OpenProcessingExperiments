
//background setup
size(250, 250);
background(0);
smooth();

//tartan cross-stitching pattern
for(int l=0;l<=height;l+=5){
  stroke(51, 153, 102, 100);
  line(100, l-50, 225, l-11);
  line(150, l+65, 225, l+10);
  stroke(51, 153, 102, 70);
  line(75, l-60, 100, l-11);
  line(60, l+40, 100, l+10);
  stroke(51, 153, 102, 80);
  line(25, l, 50, l+10);
  stroke(51, 153, 102, 125);
  line(l, 167, l+10, 225);
  line(l-1, 75, l-11, 100);
  stroke(51, 153, 102, 140);
  line(l, 40, l+30, 100);
  line(l, 25, l+10, 50);
}
  

//circle dots pattern in middle of composition
for(int y=0; y<=height; y+=50){
for (int x=0; x<=width; x+=50){
  noStroke();
  fill(145, 189, 89);
  ellipse(x-1,y,10,10);
  fill(145, 189, 89);
  ellipse(x+1,y,10,10);
  fill(0);
  ellipse(x,y,10,10);
  fill(255);
  ellipse(x,y,2,2);
  //stroked cricle with no fill pattern
  noFill();
  stroke(145, 189, 89, 150);
  ellipse(x,y,100,100);
}
}





