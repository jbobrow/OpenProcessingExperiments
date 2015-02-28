
void setup() {
  size (600, 600);
  background (0);
}

void draw () {
  stroke (random(150,255), random(150,255), random(150,255));
  fill (random(200,255), random(10,100), random(10,155));
  rectMode (CENTER);
  rect (pmouseX, pmouseY, mouseY/5 , random(40,150)); 

}


