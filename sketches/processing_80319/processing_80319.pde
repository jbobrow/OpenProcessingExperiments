
void setup(){
  size(400,200);
 noStroke();
}
void draw(){
  background(#02AFAB); 
  int i = 20;
  while (i < 290){
    fill(i); 
    ellipse (i,150,150,height);
    rect(i, 0, 10, height);
    i = i + 10;
  }
}


