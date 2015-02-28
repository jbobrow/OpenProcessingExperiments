
size(250,250);
background(#660033);
smooth();
 
int numCurve = 500;
int curveSpacing = 45;

 
for (int x=-20; x<numCurve; x=x+1) {
  noFill();
  stroke(#ffcc99,85);
  strokeWeight(1);
  bezier(0,x*curveSpacing,450,250,590,190,-0,x*curveSpacing);
  
    noFill();
  stroke(#ffcc99,55);
  strokeWeight(1);
  bezier(0,x*curveSpacing,350,150,490,90,-0,x*curveSpacing);
  
  
  //
  
  noFill();
  stroke(#ffffff,5);
  strokeWeight(100);
  bezier(0,x*curveSpacing,450,250,590,90,0,x*curveSpacing-10);
  
  noFill();
  stroke(#ffcc99,35);
  strokeWeight(100);
  bezier(0,x*curveSpacing,450,250,590,90,0,x*curveSpacing);
  
  noFill();
  stroke(#ffffff,15);
  strokeWeight(1);
  bezier(0,x*curveSpacing-100,150,800,190,200,250,x*curveSpacing-10);
 
  noFill();
  stroke(#66ccff,1);
  strokeWeight(200);
  bezier(0,x*curveSpacing,250,190,300,190,20,x*curveSpacing);
 
  noFill();
  stroke(#3e1795,1);
  strokeWeight(200);
  bezier(0,x*curveSpacing,250,190,300,190,20,x*curveSpacing);
  
  noFill();
  stroke(#f3e5ad,1);
  strokeWeight(200);
  bezier(0,x*curveSpacing,550,390,350,290,20,x*curveSpacing);
  
//
;
 
for (int v=1; v<numCurve; v=v+1) 
noFill();
  stroke(#ffffff,10);
  strokeWeight(1);
//
noFill();
  stroke(#cc0033,75);
  strokeWeight(100);
  bezier(0,x*curveSpacing,250,190,300,190,20,x*curveSpacing);
  //
     
}

 // 
 



