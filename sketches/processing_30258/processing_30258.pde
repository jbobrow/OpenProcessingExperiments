
float t = 0; //Incrementing value 

int z = 2; //Zoom multiplier


PImage img = createImage(width, height, ARGB);


void setup() {

  size(300, 300);
  background(0);
  smooth();
  colorMode(HSB);
  noCursor();
}

void draw() {
  
  pushMatrix();
  
  float s = sin(t);
  float c = cos(t);
  float rl = map(mouseX, 0, width, -width, width)/40;
  float tb = map(mouseY, 0, height, -height, height)/40;

  point(mouseX, mouseY); //Cursor
  
//Blend

  tint(30, 0, 250, 106); 
  image(img, rl*z*s, tb*z*c, width+rl*z*s, height+tb*z*c);

  translate(width/2+sin(1.3*t), height/2+cos(2.7*t));
  rotate(t);

  fill (30, 0, 0, 5);
  stroke(40*c+150, 50*s+250, 20*c+240, 128);

  star(3, c, s, 50*s+60, 50*c);
  star(3, s, c, 60*s, 60*c+70);
  
  popMatrix();



  t+=.02;
  img=get();
}






