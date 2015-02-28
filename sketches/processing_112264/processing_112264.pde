
size (600, 400);
background(255, 217, 77);

for (int x=1; x<200; x=x+10){

 noFill();
ellipse (x+300, 200, 50, 50);  
  
fill(108, 180, 255);
triangle (400, 200, x+200, 200, 300, 50);


fill(0);
triangle (230, 200, 370, 200, 300, 100);


noFill();
ellipse (x+100, 200, 50, 50);

}












