
void setup(){
  size(400,400);
  background(255);
}
void draw() 
{
  for (int e=5; e< 405; e=e+5) {
    for (int i = 0 ; i < 400; i =i + 5) {
       line (e,i,e,e+i);
       line (i,e,e+i,e);
       fill (random(153));
       rect (e-5,i,e,e+i);
    }
     }
  }
