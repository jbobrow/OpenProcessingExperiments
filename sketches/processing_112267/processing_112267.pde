
/*
Jeff Guo  IjD Term 3 
Interactive Prototiping 3
Sep-26-2013
jeff880412@gmail.com
*/

size(500, 500);
background(255,255,255);
smooth();
pushMatrix();
translate(250,250);
for (int i = 0; i <= height; i += 50) {
  for (int j = 0; j <= width; j += 30) {
    fill(255*sin(i),255*cos(j),255*cos(i));
    triangle(0,0, i,j , j,i);
  }
}
rotate(PI/2);
for (int i = 0; i <= height; i += 50) {
  for (int j = 0; j <= width; j += 30) {
    fill(255*cos(i),255*cos(j),255*cos(i));
    triangle(0,0, i,j , j,i);
  }
}




rotate(PI);
for (int i = 0; i <= height; i += 50) {
  for (int j = 0; j <= width; j += 30) {
    fill(255*sin(i),255*cos(j),255*cos(i));
    triangle(0,0, i,j , j,i);
  }
}

rotate(3*PI/2);
for (int i = 0; i <= height; i += 50) {
  for (int j = 0; j <= width; j += 30) {
    fill(255*sin(i),255*cos(j),255*cos(i));
    triangle(0,0, i,j , j,i);
  }
}
fill(0);
ellipse(0,0,170,170);

popMatrix();


