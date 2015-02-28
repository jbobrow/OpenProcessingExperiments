
size(1000,500);
background( #210220);
translate(width/2, height/2);
for ( int j=0; j<100; j=j+1) {
  pushMatrix();
  
for ( int i=0; i<100; i=i+1) {
  float myAngle = random(-10,-5);
  rotate( radians(myAngle));
float ellipseSize = map(i, 0, 100, 5, 30);
stroke(#0F0F0F,100);
fill(#FFFFFF,25);
rect( 0, 0, ellipseSize, ellipseSize);
translate(0,50);
}

popMatrix();
}

translate(400, 0);
for ( int j=0; j<100; j=j+1) {
  pushMatrix();
  
for ( int a=0; a<100; a=a+1) {
  float mySPA = random(-10,0);
  rotate( radians(mySPA));
float Size = map(a, 0, 100, 10, 80);
stroke(#FAC105,100);
noFill();
curve(0, 0, Size, Size, Size+15, Size+15, Size+25, Size+25);
translate(0,-10);
}

for ( int a=0; a<100; a=a+1) {
  float mySPA = random(-10,-5);
  rotate( radians(mySPA));
float Size = map(a, 0, 100, 10, 50);
stroke(#E9AFFF,100);
noFill();
curve(0, 0, Size, Size, Size+15, Size+15, Size+25, Size+25);
translate(0,-5);
}

popMatrix();
}


