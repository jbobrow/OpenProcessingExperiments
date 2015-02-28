
float a=0;
PImage bkrnd;

void setup(){
  size(500,500);
  background(0);
  smooth();
  colorMode(HSB, 100);
}

void draw (){
  imageMode(CENTER);
  bkrnd = loadImage("background.jpeg");
  image(bkrnd, 250,250);
  //background(0);
  
  //changing these will effect the "orbit" of the pla
  float x = map(sin(a), -1, 1, 0, width);
  float y = map(sin(a+1.4), -1, 1, 0, height);
  
  //"planets"
  fill(90);
  ellipse(x,y,10,10);
  fill(40);
  ellipse(x,y/2, 20,20);
  fill(20);
  ellipse(x/2,y/4, 40,40);
  
  a = a + 0.03;
}

