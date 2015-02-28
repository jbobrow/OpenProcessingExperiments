
float angle = 0.0;
float x = 0;
 
void setup(){
  size(250, 250);
  background(#FF62DD);
  frameRate(200);
  fill(0);
}
 
void draw() {
  rotate(angle);
  fill(#36C1FF);
  text("m2k2v6", 0, x);
  angle += 0.1; //changes angle each time it runs
  x += 1.0; //spacing between each circle loop
}


