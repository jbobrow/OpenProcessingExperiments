
void setup(){
  background(160,153,153);
  size(1000,1000);

}

void draw(){
  France(100,100,color(random(255),random(255),random(255)));

} 
  void France (int x, int y,color c){
  stroke(c);
  fill(6,1,147);
  rect(100+x,100+y,90,200);
  fill(255,255,255);
  rect(190+x,100+y,90,200);
  fill(222,0,19);
  rect(280+x,100+y,90,200);
}
color pick(){
  return color(random(255),random(255),random(255));
  

}

