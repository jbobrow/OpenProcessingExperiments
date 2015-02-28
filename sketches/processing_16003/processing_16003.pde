
//Kim Sujung

void setup() {
  size(700,1200);
  background(205,160,200);
  smooth();
  noStroke();
}

void draw() {
fish(0,0,300,140);
fish(0,400,50,20);
fish(0,600,100,40);
fish(0,1000,50,20);
}


//s1=300, s2=140
void fish(int x, int y, int s1, int s2){
  
  pushMatrix();
  translate(x,y);
  fill(255);
// ellipse(300,180,300,140);
  fill(146,228,235);
  arc(300,180,s1,s2,3.67,8.9);
  
  fill(32,57,110);
  triangle(470,180,560,120,560,240);
  fill(0);
  ellipse(250,140,20,20);
  fill(245,152,176);
  ellipse(150,160,30,30);
  ellipse(100,130,15,15);
  ellipse(80,100,10,10);
  popMatrix();
}

