
int counter;

void setup() { 
size (400, 400);
background (255,160,122)
}

void mouseDragged() {   
  fill (random(0, 255),random(0, 255),random(0, 255));
  rotate(PI/3.0);
  rect(mouseX, mouseY, 55, 55, 3, 6, 12, 18);
counter=counter+1
}
