
//EF4
//Laura Gafuri
size (200,200);
background (255);
for (int i=50; i<180; i=i+20)
{
  noStroke();
  fill (i*i/120,100,250); 
  ellipse(i, 60, 50, 50);
}
for (int j=-90; j<100; j=j+8){
  noStroke();
  fill (143,7,242);
  ellipse (j+100,(j*j/140)+110,5,5);
}
