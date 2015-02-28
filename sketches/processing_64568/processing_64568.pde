
int e_w = 0;
int e_h = 400;
int flg;
float theta;
int num = 4;

void setup() {
  size(400, 400);
  background(255);
  smooth();
}



void draw() {
  noStroke();
  fill(255, 10);
  rect(0, 0, width, height);

  noFill();
  stroke(0, 80);

  translate(width/2, height/2);
  rotate(radians(theta));
  for (int i = 0; i < num;i++) {
    pushMatrix();
    rotate(radians(180 / num) * i);
    ellipse(0, 0, e_w, e_h);
    popMatrix();
  }

  if (flg == 0) {
    e_w++;
  }
  else {
    e_w--;
  }

  if (e_w > e_h) {
    e_w = 400;
    flg = 1;
    stroke(0, 80);
  }
  if (e_w < 0) {
    e_w=0;
    flg= 0;
  }

  theta += 0.5;
  
  println(num);
}

void mousePressed(){
  num++;
  
  if(num > 12){
    num = 4;
  }
}

