
size (52,300);
fill (30,18,18);
rect (0,0,400,400);

int x=17;
int y=10;
int z=50;
boolean a=true;


strokeWeight (2);
stroke (200,80,80);
fill (250,250,250,50);


if (y<z) {
  strokeWeight (3);
}
else {
  noFill();
}

stroke (120,110,200);
line (0,100,70,100);
line (0,150,70,150);
line (0,200,70,200);
line (0,250,70,250);
stroke (200,80,80);
if (a==false) {
for (int i=10; i <=50; i+=10) {
    line (i,150,150,i);
}
}
else {
  for (int i=10; i <=50; i+=5) {
    line (2*i,10*i,50,22);
}
}
stroke (120,110,200);
if (x>z ){
  rect (10,x,z,50);
}
else {
  ellipse (10,x,z,100);
}


