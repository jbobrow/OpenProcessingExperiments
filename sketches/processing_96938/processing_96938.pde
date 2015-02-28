
ArrayList<PVector> stars = new ArrayList<PVector>();
float h2;//=height/2
float w2;//=width/2
float d2;//=diagonal/2

void setup() {
  size(600, 600);
  w2=width/2;
  h2= height/2;
  d2 = dist(0, 0, w2, h2);
  noStroke();
}
void draw() {
  fill(0, map(dist(mouseX, mouseY, w2, h2), 0, d2, 255, 5));
  rect(0, 0, width, height);
  fill(255);

  for (int i = 0; i<20; i++) {   // star init
    stars.add(new PVector(random(width), random(height), random(1, 3)));}

  for (int i = 0; i<stars.size(); i++) {
    float x =stars.get(i).x;//local vars
    float y =stars.get(i).y;
    float d =stars.get(i).z;

    /* movement+"glitter"*/
    stars.set(i, new PVector(x-map(mouseX, 0, width, -0.05, 0.05)*(w2-x), y-map(mouseY, 0, height, -0.05, 0.05)*(h2-y), d+0.2-0.6*noise(x, y, frameCount)));
    
    if (d>3||d<-3) stars.set(i, new PVector(x, y, 3));
    if (x<0||x>width||y<0||y>height) stars.remove(i);
    if (stars.size()>9999) stars.remove(1);
    ellipse(x, y, d, d);//draw stars
  }
}
