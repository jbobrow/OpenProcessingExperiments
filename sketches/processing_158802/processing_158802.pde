
void setup() {
  background(255,238,51);
  size(1000, 1000);
  smooth();
  noFill();
  frameRate(45);
}


void draw() {
float a =random (width);
float b =random (height);
float c = random (48, 999);
strokeWeight(2);
rect(a,b,c,c);
strokeWeight(1);
ellipse(a,b,c,c);

save("ellipserect.gifAnimation");
}
 






