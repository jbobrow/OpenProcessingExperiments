
Block[] block = new Block[20];
Flower[] flower = new Flower[10];

void setup() {
  size(250, 350);
  background(0);
  smooth();
  rectMode(CENTER);

  for (int i = 0; i < block.length;i++) {
    block[i] = new Block();
  }
  for (int j = 0; j < flower.length;j++) {
    flower[j] = new Flower();
  }
}

void draw() {
  background(0);

  for (int i = 0; i < block.length;i++) {
    block[i].display();
    block[i].move();
  }

  for (int j = 0; j < flower.length;j++) {
    flower[j].display();
    flower[j].blooming();
  }
}
class Block {
  float x;
  float y;
  float speed;
  float rect_w;
  float rect_h;

  Block() {
    speed = random(-10, 10);
    if(speed < 1 && speed > -1){
      speed += 3;
    }
    rect_w = random(10, 40);
    rect_h = random(220, 280);

    x = random(width);
    y = random(height);
  }

  void display() {
    noStroke();
    fill(255);
    rect(x, y, rect_w, rect_h);
  }

  void move() {
    y += speed;
    if (y > height + rect_h/2  || y < -rect_h/2) {
      rect_w = random(10, 40);
      rect_h = random(220, 280);
      x = random(width);

      if (speed > 0) {
        y = - rect_h/2;
      }
      else {
        y = height+rect_h/2;
      }
    }
  }
}

class Flower {
  float x;
  float y;
  float roundness; //花のまるっこさ 0.9 ~ 1.2 あたりが良いかも
  float size; //大きさ
  int val; //花びらの枚数
  float goal; //最終的なサイズ
  float speed;
  float alp;

  Flower() {
    x = random(width);
    y = random(height);

    roundness = random(0.89, 1.24);
    size = 0; 
    val = 6;//(int)random(6, 8.9);
    goal = random(0.2, 0.5); 
    speed = random(0.005, 0.02);
    alp = 255;
  }

  void blooming() {   
    size += speed;

    if (size > goal) {
      size = goal;
      alp -= 30;

      if (alp < 0) {
        size = 0;
        roundness = random(0.89, 1.24);
        goal = random(0.2, 0.5);
        speed = random(0.005, 0.02);
        alp = 255;
        x = random(width);
        y = random(height);
      }
    }
  }

  void display() {
    peacock(x, y);
  }

  void peacock(float x, float y) {
    for (int i = 6;i>3;i-=2) {
      noStroke();
      fill(0, alp);
      drop(x, y, i);
    }
  }

  void drop(float x, float y, int p) {
    for (int i = 0 ; i < val; i++) {
      pushMatrix();
      translate(x, y);
      rotate(radians((360/ val) * i));

      for (int j = 10; j > 0;j--) {
        ellipse(0, j*p*roundness*size, (j*p+3)*size, (j*p+3)*size);
      }
      popMatrix();
    }
  }
}



