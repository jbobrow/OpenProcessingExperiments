
PImage happydolls;

void setup(){
  size(400, 400, P3D);
  background(192,161,11);
  happydolls = loadImage("delicious.jpg");
  happydolls.loadPixels();
}

void draw(){
  //background(192,161,11);
  int x = (int) random(width);
  int y = (int) random(height);

  color c = nabcolour(x,y,happydolls);

  


  noStroke();
  fill(red(c), green(c), blue(c), 50);
  ellipseMode(CENTER);
  translate(height/2,width/2);
  rotateZ(random(height));

  ellipse(x,y+5,8,11);

  ellipse(x,y-5,8,11);

  ellipse(x-5,y,11,8);

ellipse(x+5,y,11,8); //}
}
color nabcolour(int x, int y, PImage pic){
int maxLoc = pic.width*pic.height;
int loc = (y*pic.width) + x;
if (loc < maxLoc){
  return pic.pixels[loc];
} else {
  return 0;

 }}

