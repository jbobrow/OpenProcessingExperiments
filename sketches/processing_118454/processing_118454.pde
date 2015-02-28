

size(510, 510);
background(0);
stroke(0);





for(int x = 0; x <=height; x ++){
  stroke(0, x, 100, 127);
  line(255, 80, x, height);
}

for(int x = 0; x <=50; x ++){
  stroke(100+x,100+x,0,200);
  noFill();
  ellipse(255,80,x,x);
}
  


for(int x =0; x<=80; x ++) {
fill(255, 255, 255);
noStroke();
ellipse(50, 400, 18, 18);
noStroke();
ellipse(100, 100, 18, 18);
noStroke();
ellipse(70, 340, 18, 18);
noStroke();
ellipse(40, 30, 18, 18);
noStroke();
ellipse(450, 70, 18, 18);
noStroke();
ellipse(450, 300, 18, 18);
noStroke();
ellipse(70, 200, 18, 18);
noStroke();
ellipse(490, 450, 18, 18);
noStroke();
ellipse(400, 200, 18, 18);
noStroke();
ellipse(480, 370, 18, 18);
noStroke();
ellipse(150, 150, 18, 18);
noStroke();
ellipse(400, 120, 18, 18);
}

for(int x = 0; x<=1000; x++){
  stroke(200, 0, 0, 10);
  noFill();
 ellipse(260, 80+x, x, x);
}



