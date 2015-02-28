
void setup() {
  size (500, 500);

};

// if mouseX is less than(<) 250 (w/2)
void draw(){
background(200, 183, 140);

if (mouseX < width/2) {
  fill(40, 40, 0);
  rect(200, 200, 20, 30);
}

if (mouseX < 125) {
  rect(100, 200, 20, 30);
  fill(200, 40, 30);
  ellipse(200, 10, 20, 30);
};
};
