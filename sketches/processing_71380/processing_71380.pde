
void setup() {
  size (600, 600);
  background (0);
  stroke (100, 255, 100);
  fill (0);
  ellipse (300, 300, 510, 510);
  ellipse (300, 300, 505, 505);
  ellipse (300, 300, 500, 500);
  ellipse (300, 300, 400, 400);
  ellipse (300, 300, 300, 300);
  ellipse (300, 300, 200, 200);
  ellipse (300, 300, 100, 100);
  line (0,0, 600, 600);
  line (600,0, 0, 600);
  


}

void draw () {
  stroke (random(80,100), random(200,225), random(80,100), random(80,100));
  fill (random(200,255), random(10,100), random(10,155));
  line (300, 300, mouseY , mouseX); 

//  line (pmouseX, pmouseY, mouseY/10 , random(40,150)); 

}


