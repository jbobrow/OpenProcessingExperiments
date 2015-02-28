
void setup() {
  size(600,600);
  smooth();
  background(255);
}
 
void draw() {
  if (mousePressed && mouseButton == LEFT){
    for (int i=0;i<width;i+=random(40)) {
      for (int j=0;j<height;j+=random(40)) {
        fill(random(255),random(255),random(255), random(255));
        float t = random(sqrt(j));
        float s = random(sqrt(i));
        stroke(random(255),random(255),random(255), random(255));
//        line(random(i),random(j),random(i),random(j));
        ellipse(i, j, t, s);
        ellipse(i, j, s, t);
      }
    }
  }
}
 
void mousePressed(){
  if (mouseButton==RIGHT)background(255);
}

