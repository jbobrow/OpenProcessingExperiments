
void setup () {
  size(500, 500);
  background(255);
}

void draw () {

noFill();
stroke(0);
for(int i = 50; i<=width; i=i+8)
{
  ellipse(80,  90, i*1.3, i );
  ellipse(i,  0, i*3, 500 );
  ellipse(500,  0, i*3, i );
   ellipse(i, 0, i*2, i*3);
   ellipse(350,  50, i*3, 500 );
    ellipse(25,  500, i*3, i );
    rotate(PI/3.0);
}
}


