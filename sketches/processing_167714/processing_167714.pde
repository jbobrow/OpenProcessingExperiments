
//create gradient ex 8-12
/*
for (int x=0; x<100; x++) {
float n = norm(x,0.0,100.0);
float val = n*255.0;
stroke(val);
line(x,0,x,50);
float valSquare = pow(n,4)*255.0;
stroke(valSquare);
line(x,50,x,100);
}
*/

/*
size (500,500);
noFill();
smooth();
  background (219, 200, 7);



{
for (int x=0; x<width; x+=8) {
  float n = norm(x,0.0,250.0);
  float y= pow(n,8);
  ellipse(x,y,120,120);
}
}
*/
size (400,400);

for (int x=5; x <400; x+=5) { 
 float n = norm(x,0.0,250.0);
for (float y= pow(n,8); y <400; y +=10){
  float g = y++;
  fill (200,g=g-1,19);
  noStroke ();
ellipse (x,y,20,y++);
}
}


