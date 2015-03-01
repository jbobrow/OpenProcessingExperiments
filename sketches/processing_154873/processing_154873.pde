
float num = 0;

void setup(){
  size(640, 640);
  stroke(255);
}

void draw(){
  fill(0, 50);
  rect(0, 0, width, height);
  /* Smaller the number the slower the effect */
  num += 0.01;
  pushMatrix();
  /* Middle of pattern. replace with mouseX and mouseY to make it follow your mouse */
  translate(width/2, height/2);
  /* Rotate entire pattern. Optional: num or nothing */
  rotate(-num);
  for(int i = 0; i < 360; i+=15){
    float x = cos(radians(i))*150;
    float y = sin(radians(i))*150;
    /* Change line() to rect() or ellipse() */
    pushMatrix();
    translate(x, y);
    rotate(num);
    line(0, 0, x, y);
    rotate(num/2);
    line(0, 0, x, y);
    rotate(num/4);
    line(0, 0, x, y);
    popMatrix();
  }
  popMatrix();
}


