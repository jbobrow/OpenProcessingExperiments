
void setup () {
  size (300,300);
frameRate(5);
}
void draw () {


for(int x = 0; x < 25; x++){
  rect(0, random (height) , random (width) , 20);
  fill(RGB, x + 20);
  stroke(random(255,0));
   x++;
   
  }
}  




