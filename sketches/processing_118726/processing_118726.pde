
void setup() {
  background(255);
  size(600, 600);

  noFill();
}
/*
line(width/2, height/3,width/4, height/4);
 line(width/2, (height/3)*2,15, 80);
 */
float r=0;
float disfusion=1;
void draw() {
  translate(100, 100);
  float w=400;
  float h=400;
  strokeWeight(random(1, 2));

  stroke(0, 0, 0, 5);

  bezier(
  w/2, (h/4)+random(10), 
  w/3+random(disfusion), h/8+random(disfusion), 
  15+random(disfusion), 80+random(disfusion), 
  w/2, (h/3)*2);

  bezier(
  w/2, (h/4)+random(10), 
  ((w/3)*2)-random(disfusion), (h/8)+random(disfusion), 
  (w-15)-random(disfusion), 80+random(disfusion), 
  w/2, (h/3)*2);
  if (disfusion<width) {
    disfusion+=1;
    noLoop();
  }
}
