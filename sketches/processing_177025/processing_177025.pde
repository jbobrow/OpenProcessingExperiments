
void setup(){
size(600,4000);
background(204, 204, 255);
}

void draw(){smooth();
  stroke(random(500),0,360,500);
  fill(random(360),0,360,500);
triangle(mouseX,mouseY,100,11,14,13,14,15);
}


