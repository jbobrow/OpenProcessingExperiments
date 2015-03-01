
void setup(){
size(600,600);
colorMode(HSB);
strokeWeight(5);
}
void draw(){
for(int i=500;i>0;i=i-20){
  println(i);
  ellipse(i,150,i,i);
  ellipse(500-i,450,i,i);
  stroke((i/2)+(mouseX/3),255,255);
}
}
