
float ra = 0;


void setup() {
  size(300, 300);
}


void draw(){
  background(200);
  translate(width/2,height/2);
  rotate(ra);
  ellipse(0,0,160,80);
}

void mouseDragged() {
  ra += atan2(mouseY-height/2, mouseX-width/2) - atan2(pmouseY-height/2, pmouseX-width/2);
}
