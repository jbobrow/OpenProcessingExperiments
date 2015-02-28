
//Kevin Gutowski
//April 22 2014
//www.ocf.berkeley.edu/~keving

float my_num = 0;
int box_num = 100;
float [] Boxes = new float[box_num];
int [] Box_color = new int[box_num];
float t = 1;
float changer = .5;
color [] colors = { color(34,83,120), color(22,149,163), color(172,240,242), color(243,255,226), color(235,127,0)};

void setup() {
  size(500,500);
  background(255);
  smooth();

  for (int i = 0; i < box_num; i++) {
    Boxes[i] = random(-width,width);
    Box_color[i] = int(random(0,5));
  }
}

void draw() {

  fill(0,0,0,120);
  noStroke();
  rect(0,0,width,height);

  t += changer;
  if ((t==100) || (t==1)) {
    changer = changer*-1;
  }

  for (int i = 0; i<Boxes.length; i++) {
    pushMatrix();
    
    translate(width * noise(my_num + Boxes[i]/10), height * noise(my_num) + Boxes[i]);
    rotate(8* noise(20 + my_num)+ Boxes[i]/t);
    fill(0,0,0,200);
    rect(-4,-4,100 * noise(30 + my_num), 100 * noise(my_num));
    fill(colors[Box_color[i]],240);
    rect(0,0,100 * noise(30 + my_num), 100 * noise(my_num));
    popMatrix();
  }
  my_num += 0.02;
}
