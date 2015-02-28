
float a = 15;
void setup () {
  size (600,600);
background(random(200),255,255);
}

void draw () {

  ellipse (mouseX, mouseY, width/6, height/6);
  ellipse (mouseY, mouseX, width/6, height/6);
  stroke (1+a,255,255,255); 
  noFill();
  a += 1 ;

}
