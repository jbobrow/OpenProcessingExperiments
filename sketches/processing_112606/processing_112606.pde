
int value=#D62D1A;
void setup(){
  size(200, 200);
}
void draw(){
  background(51);
  stroke(225,0,0);
  line(0,100, 200,100);
  fill(value);
  rect(mouseX-15, mouseY-25, 30,50);
  
  if(mouseY<100) {
          value = #6EDB16;
        } else {
value = #D62D1A; }
  }


