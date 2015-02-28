
size(500,300);
background(0);
smooth();
noFill();
//
stroke(20,243,253);
strokeWeight(2);
int siz = 0;
while( siz<300)
{
  ellipse(siz,150,siz,siz);
  ellipse(500-siz,150,siz,siz);
  ellipse(250,150,siz,siz);
  siz = siz+8;
}
