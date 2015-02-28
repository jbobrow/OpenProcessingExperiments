

Ball[] balls = new Ball[3];
int num_ball=0;
float reduction = 0.99;
float gravity = 0.1;


//* 処理が重くなってしまう描画方法をとっているため、生成するスライムはせいぜい３匹まで *//


void setup() {
  size(480, 480);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  stroke(1);
  fill(230);
  rect(0, 381, 480, 99);
  fill(180);
  rect(5, 386, 470, 89);
  fill(0);
  textSize(16);
  PFont font = createFont("MS Gothic", 20, true);
  textFont(font);
  String s = "なんとスライムがおきあがり、なかまになりたそうにこちらをみている！";
  text(s, 15, 400, 460, 85);
  for (int i=0; i<num_ball;i++) {
    balls[i].reflect();
    balls[i].mov();
  }
}

void mousePressed() {
  if(num_ball < 2){//個数を制限
  balls[num_ball] = new Ball(mouseX, mouseY, random(10, 60), 
  random(-5, 5), random(-5, 5), color(random(0, 255),random(0,255),random(0, 255)));
  num_ball++;
  }
}

//-------------------------------------------------------------------------------------------------

class Ball {
  float x, y, spx, spy, radi;
  color clr;

  //コンストラクタ
  Ball(float xx, float yy, float rad, float vx, float vy, color cl) {
    x = xx;
    y = yy;
    radi = rad;
    spx = vx;
    spy = vy;
    clr = cl;
  }

  void mov() {
    spx *= reduction;
    spy *= reduction;
    
    fill(clr);
    drawSlime(x, y, 1);
    x += spx;
    y += spy;
    spy += gravity;
  }

  void collision() {
    for(int i=0;i<num_ball;i++){
      
      
      
    }
  }


  void reflect() {
    if ( (x+radi) > width) {
      x = width - radi;
      spx = -spx;
    }
    if ( (x-radi) < 0 ) {
      x = radi;
      spx = -spx;
    }


    if ( (y+radi) > height-100) {
      y = height-100 - radi;
      spy = -spy;
    }
    if ( (y-radi)<  0) {
      y = radi;
      spy = -spy;
    }
  }
  
  
  
  
  
  void drawSlime(float x, float y, float large){
  pushMatrix();
  translate(x, y);
  scale(large);
  fill(0, 0, 255);
  noStroke();
  ellipse(0, 0, 80, 40);
  ellipse(0, -18, 20, 55);
  pushMatrix();
  rotate(-PI*1/6);
  ellipse(-5, -20, 30, 10);
  rotate(-PI*1/9);
  ellipse(14, -20, 30, 10);
  popMatrix();
  
  pushMatrix();
  rotate(PI*1/6);
  ellipse(5, -20, 30, 10);
  rotate(PI*1/9);
  ellipse(-14, -20, 30, 10);
  popMatrix();
  
  fill(255);
  ellipse(-10, -8, 15, 15);
  ellipse(10, -8, 15, 15);
  fill(0);
  ellipse(-10, -8, 8, 8);
  ellipse(10, -8, 8, 8);
  fill(200,0,0);
  ellipse(0, 8, 30, 8);
  pushMatrix();
  rotate(-PI*1/8);
  ellipse(10, 10, 15, 8);
  popMatrix();
  pushMatrix();
  rotate(PI*1/8);
  ellipse(-10, 10, 15, 8);
  popMatrix();
  
  ellipse(-7, 5, 8, 5);
  ellipse(7, 5, 8, 5);
  
  
  
  popMatrix();
}
}


