
void setup(){
  size(600, 600);
  //colorMode(HSB, 360, 100, 100); use for color
}

void draw(){
  float my_angle = map(mouseX, 0, width, 0, 2*PI);
  float my_size = map(mouseY, 0, height, 50, 450);
  float my_color = map(mouseX, 0, width, 0, 255);
  //float my_color_inv = map(mouseX, 0, width, 255, 0);
  
  //background(my_color_inv);
  pushMatrix();
  translate(width/2, height/2);
  rotate(my_angle);
  rectMode(CENTER);
  stroke(0);
  //fill(color(my_color, 255, 255)); //use for color
  fill(my_color);
  rect(0,0, my_size,my_size/20);
  popMatrix();
}
