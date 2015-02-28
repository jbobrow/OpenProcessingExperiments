
int counter;
PVector v1, v2, v3;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  v2 = new PVector(100,100);
  stroke(0);
  line(0,0,v2.x,v2.y);
}

void draw() {  //draw function loops 
  if(mousePressed == true) { //add some interaction
    stroke(0);
    v1 = new Pvector(mouseX, mouseY);
    line(0,0,v1.x,v1.y);
    line(0,0,mouse.x,mouse.y);
    v3 = v2.sub(v1);
    line(125,125,v3.x,v3.y);
  }
}
