
size(250,250);
background(#f88e78);
smooth ();
 

for (int a=10; a<500; a++){
  //
  
  int numCurve = 510;
int curveSpacing = 2;
  
   noFill();
  stroke(#e5ccad,60);
  strokeWeight(1);
  bezier(0,a*curveSpacing,50,250,30,80,250,a*curveSpacing);
  //
  
float w = random(1);
stroke(#30415f, 140);
strokeWeight(w);
noFill();
ellipse(-0,50+a+w,360,310);}
 //
 
 // horray!! 

