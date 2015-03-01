
/*
Martin Schneider martinsc
Copyright Martin Schneider
*/
int winSize=400;
int center=200;
int targetWidth=200;
int triangleSize=50;
int rectSize=50;

size(400,400);

fill(255,0,0);
ellipse(center,center,targetWidth,targetWidth);

for(float i=0;i<2*PI;i+=.01){
  fill(255,(int)(abs((float)(PI-i))*100),0);
   arc(center,center,targetWidth,targetWidth,i,i+PI/8); 
}

fill(0,0,255,80);

triangle(center,center-triangleSize,
         center+triangleSize*sin(PI/3),center+triangleSize*sin(PI/3),
         center-triangleSize*sin(PI/3),center+triangleSize*sin(PI/3));

fill(0,255,0,80);

rect(center-rectSize/2,center-rectSize/2,rectSize,rectSize);

fill(0,0,0);

line(center-rectSize,center,center+rectSize,center);






