
int count = 0;
void setup(){
  size(1000,600);
  textSize(155);
  textAlign(CENTER);
  fill(255);
}

void draw(){
  background(int(map(count,0,2147483647,0,255)));
  text(""+(count),width/2, height/2);
  if(count == 2147483647){
    count = 0;
  }
  count ++;
}
