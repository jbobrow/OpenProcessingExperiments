
size(250,250);
smooth();
background(#9a5452);


//

float x=0,y=0,x1=0,y1=0;
for(int a=0; a<5000; a++)
  stroke(120,40);
  x=random(0,250);
  y=random(0,250);
  point(x,y);
//
 for(int a=1; a<100; a++)
fill(#825049,60);
  ellipse(3,3,3,3);

//
for(int t=0; t<=height; t+=60){
for (int r=0; r<=width; r+=30){
noStroke();
ellipse(r,t,60,60);}}
 

 
for(int h=0; h<280; h+=50)
for(int k=0; k<280; k+=50)
{noStroke();
fill(255,5);
ellipse(k,h,95,1325);
stroke(#F04983,70);
ellipse(k+5,h+5,95,95);


stroke(#643034,95);
ellipse(k+7,h+7,75,75);}






