
//nervous_circles


void setup() {
  size(600, 600);
  //background(255);  //set background white
  
  frameRate(10);
  noLoop();
 }


void draw() {
  strokeWeight(1);
  stroke(#763E44);
  background(#F2ECD2);
  int i;
  noFill();
 for(i = 1; i <= 100; i++) {
  float w = (random(width/10, height/3));
  float x = random(width/3, width-(width/3));
  float y = random(width/3, width-(width/3));
  ellipse(x, y, w, w);
   }
  
  
}

void mousePressed () {
  redraw();
  
}
