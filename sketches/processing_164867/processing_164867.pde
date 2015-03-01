
void setup() {
  background(255);
  size(710,710);
  noStroke();
  smooth();
  noLoop();
}

void draw(){
  for (int a =30; a<700;a+=50){
    for (int b=30;b<700; b+=50){
    flower(a,b);}
  }
}

void flower (int x, int y ){
  fill(#dd7ca3,100);
  ellipse(x,y-10,10,20);
  ellipse(x,y+10,10,20);
  ellipse(x-10,y,20,10);
  ellipse(x+10,y,20,10);
  fill(#90c293,150);
  ellipse(x,y,5,5);
}


