
size(500,500);
background(0,255,0);
fill(255,0,0);
translate(500/2, 500/2);
int x = 0;



//translate(width/2, height/2);

for(int i = 0; i < 12; ++i) {
  rotate(x);
  ellipse(0,0,30,100);
  rect(10,120,100,10);
  rotate(1);
  ellipse(10,10,10,10);
  triangle(10, 10, 15, 15, 20, 20);
  quad(100,100,150,150,200,200,250,250);
  x +=0.16;
}
