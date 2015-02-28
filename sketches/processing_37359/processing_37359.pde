
size (300, 300);
colorMode(RGB, 100);
background(3,6,10);


//blur
for (int y=10;y<300; y+=5){
  noStroke ();
  fill(10,30,20,5);
  ellipse (y ,50,y,100);
  fill(40,30,10,5);
  ellipse(y,150,y,100);
  fill(40,10,30,5);
  ellipse(y,250,y,100);

 }
 
 //lines
for (int x=40; x<200; x+=10) {
  strokeWeight (3);
  stroke(40,40,20);
  line(x, 100, x, 260);
  stroke(60,20,60);
  line (100,x,260,x);
}

 


