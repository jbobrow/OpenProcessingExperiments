

  size(500,500);
background(0);

smooth();

float dis = 100;

  background(255);
  
for(float i=1; i<=1600; i=i+200){
  for(float j = 1; j<=400;  j=j+1.5){
    for(float k = 0; k<=2; k=k+1){
      pushMatrix();
  translate(-20-j*9, -22+j*12);
  stroke(255,0,0);
  strokeWeight(1+k);
 bezier (30+i,0,60+i,5, 80+i,5, 120+i,0);
 bezier (120+i,0,150+i,-5, 170+i,-5, 230+i,0);
 
  translate(-2-j*9, -7+j*12);
  stroke(0,0,255);
 bezier (30+i,0,60+i,5, 80+i,5, 120+i,0);
 bezier (120+i,0,150+i,-5, 170+i,-5, 230+i,0);
 
  translate(4-j*9, 5+j*12);
  stroke(20,200,50);
 bezier (30+i,0,60+i,5, 80+i,5, 120+i,0);
 bezier (120+i,0,150+i,-5, 170+i,-5, 230+i,0);
 
  translate(-5-j*9, 15+j*12);
  stroke(21,67,16);
 bezier (30+i,0,60+i,5, 80+i,5, 120+i,0);
 bezier (120+i,0,150+i,-5, 170+i,-5, 230+i,0);
 
popMatrix();
}}}
