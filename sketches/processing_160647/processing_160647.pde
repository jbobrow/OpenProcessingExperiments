
PImage photo;
float speed = 4.0;
float move;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(200,0,250);  //set background white
  colorMode(HSB);  //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  photo = loadImage("http://cdn.i0.cz/public-data/4e/0c/5cbe5926316c890ec6dcb2ac3bf2_r1:1_w300_h300_gi:photo:76448.jpg?hash=ee3d78f654a7a8792381e26eefd08e3f");
  }

void draw() {  //draw function loops 
  counter++
  noStroke();
  fill(random(255),200,200,200);
  rect(width/2, height/2, 250*sin(counter), 250*sin(counter));
  ellipse(width/2,height/2, 200*sin(counter), 200*sin(counter));
  image(photo, 100, 100);
  move=move+speed 
  rect(0, 250, 250, 250);
  rect(250,0,250,250);
 }
