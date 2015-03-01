
int counter;
 
void setup(){
  size(200,200);
  background(255);
  }
void draw()
{
  for (int e=20; e<width; e=e+20){
  for (int f=20; f<height; f=f+20){
    fill(random(155));
       rect(e,f,e,f);
}
}
}
 

