
int counter;
 
void setup(){
  size(500,500);
  background(255);
  }
void draw()
{
  for (int e=50; e<width; e=e+50){
  for (int f=50; f<height; f=f+50){
    fill(random(200));
       rect(e,f,e,f);
}
}
}

