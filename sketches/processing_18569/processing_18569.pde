
float y = 2.0;
float x= 0.0;

void setup() {
  size(250, 250);
  background(#580571);
  fill(#FCF505);
  noStroke();
}
void draw(){
  frameRate(10);
  rect(x ,y, 5, 5); 
  y += 10; 
  x += 10;
  if (y > 350) {
    y= -50.0;
  }
  rect(5, 5, x, x);


}

