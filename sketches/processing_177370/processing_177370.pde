
void setup(){
  size(500,500);
  background(255);
}
void draw()
{
  for (int x=10; x< 490; x=x+10) {
    for (int i = 0 ; i < 500; i =i + 10) {
       line (x,i,x,x+i);
       line (i,x,x+i,x);
       fill (random(153));
       rect (x-5,i,x,x+i);
    }
     }
  }
