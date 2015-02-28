
void setup() {
  size(1000,1000);
  background(206,166,206);
  smooth();
  noStroke();
  
}


void draw() {

  fish(0,0,240,120);
  fish(200,100,300,200);
  fish(400,500,150,40);
  fish(-350,700,300,200);
}

//body=140, fin1=240, fin2=120
void fish(int x, int y,int fin1, int fin2) {
 
  pushMatrix();
  translate(x,y);
  fill(255);
// ellipse(300,180,300,140);
  fill(146,228,235);
  arc(300,180,300,140,3.67,8.9);
  
  fill(32,57,110);
  triangle(470,180,560,fin2,560,fin1);
  fill(0);
  ellipse(250,140,20,20);
  fill(245,152,176);
  ellipse(150,160,30,30);
  ellipse(100,130,15,15);
  ellipse(80,100,10,10);
  popMatrix();
}


