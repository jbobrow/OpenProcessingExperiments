
int counter;
int num;
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  num = 1;
}

void draw() {  //draw function loops 
  counter += 5;
  if (num < 100){
  num += 3;
  }
  else {
  num = 0;
  }
  noStroke();
  fill(random(200),200,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 60, 60);
  }
  else {
    ellipse(200- num, 200-num, 80*sin(counter)+num, 80*sin(counter)+num);
  }
}
