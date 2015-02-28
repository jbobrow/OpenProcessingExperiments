
void setup() {
  size(300,300);
}

void draw() {
  background(255);
  for(int y=0; y<=300; y=y+30){
    for(int x =0; x<=300; x=x+30){
  mydraw(x,y);
    }
}
}

void mydraw(int x, int y) {  
  
  float r = atan2(mouseY-y,mouseX-x);
  pushMatrix();
 // println(r);
  translate(x,y);
  rotate(r);
  rect(-10,-5,20,10);
  popMatrix();
}

