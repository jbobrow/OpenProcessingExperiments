
int glass=0, score=0, cell=0, disscore=0, discell=0;
float speed = 0.1;
color glasson, glassoff;
int kazu = 60;
Bacteria[] bacteria = new Bacteria[kazu];
float[] textX = new float[kazu];
float[] textY = new float[kazu];
int[] textScore = new int[kazu];
int[] textT = new int[kazu];

void setup() {
  size(1024, 768);
  colorMode(HSB, 360, 100, 100);
  smooth();
  frameRate(60);
  textAlign(CENTER);
  rectMode(CENTER);

  bacteria[0] = new Bacteria(35, 0, 0, 1);
  bacteria[0].x = width/2;
  bacteria[0].y = height/2;
  for (int i=1; i < kazu; i++) {
    bacteria[i] = new Bacteria(35, 0, 0, 0);
  }
}

void draw() {
  background(0, 0, 99);
  noFill();
  rect(width/2, height/2, width*0.7, height*0.6);

  for (int i=0; i < kazu; i++) {
    if (bacteria[i].id == 1) {
      bacteria[i].glow();
      bacteria[i].division();
      bacteria[i].move();
      bacteria[i].display();
    }
    if (bacteria[i].dflag != 0) {
      while (bacteria[i].dflag != 0) {
        for (int j=0; j < kazu; j++) {
          if (bacteria[j].id == 0) {
            bacteria[j].id = 1;
            bacteria[j].x = bacteria[i].x + random(-10, 10);
            bacteria[j].y = bacteria[i].y + random(-10, 10);
            bacteria[j].vx = 0;
            bacteria[j].vy = 0;
            bacteria[j].size = 35;
            bacteria[j].t = 0;
            bacteria[i].dflag--;
            break;
          }
          if (j >= kazu-1) {
            bacteria[i].dflag = 0;
          }
        }
      }
    }
  }
  for (int i=0; i < kazu; i++) {//------------------浮遊数字。上のにいれると被る
    if (textT[i] > 0) {
      textSize(20+textScore[i]);
      fill(200+textScore[i]*10, 99, 99);
      text("+"+textScore[i], textX[i], textY[i]);
      textY[i] -= 0.3;
      textT[i]--;
    }
  }//---------------------------------------------浮遊数字ここまで

  if (score > disscore) {//値が１ずつ増えてなんかかっこいい
    disscore++;
  }
  if (cell > discell) {
    discell++;
  }

  //-------------------------------------------------------ここからテキスト表示
  fill(0);
  textSize(64);
  text("Break Bacteria Touch", width/2, 64*1.5);

  if (glass==1) {
    glasson = color(0, 99, 99);
    glassoff = color(0, 0, 80);
  }
  else {
    glasson = color(0, 0, 80);
    glassoff = color(0, 99, 99);
  }
  textSize(32);
  fill(glasson);
  text("glassON", width*0.3/4, height/3);//width/2 - width*0.7/2 = width*0.3/2 の半分（真ん中）
  fill(glassoff);
  text("glassOFF", width*0.3/4, height/3+100);

  for (float i = 0.1; i <= 0.4; i += 0.1) {
    if (speed == i) {
      fill(0, 99, 99);
    }
    else {
      fill(0, 0, 80);
    }
    text(i+" cell / s", 200+(i-0.1)*2000, height-100);
  }

  fill(0);
  text("cell", width*3.7/4, height/3);
  text(discell, width*3.7/4, height/3+32);
  text("score", width*3.7/4, height/3+100);
  text(disscore, width*3.7/4, height/3+100+32);

  if (mouseX > width*1.7/2 && mouseX < width && mouseY > height/3+200-32 && mouseY < height/3+200) {
    fill(0, 99, 99);
  }
  text("RESET", width*3.7/4, height/3+200);
  //------------------------------------------------------テキスト表示おわり
}


void mousePressed() {
  if (mouseX >= 0 && mouseX <= width*0.3/2 && mouseY <= height/3 && mouseY >= height/3-32) {//-------------ここから設定
    glass = 1;
  }
  if (mouseX >= 0 && mouseX <= width*0.3/2 && mouseY <= height/3+100 && mouseY >= height/3+100-32) {
    glass = 0;
  }
  if (mouseY >= height-100-32 && mouseY <= height-100) {
    for (float i = 0.1; i <= 0.4; i += 0.1) {
      if (mouseX >= 200+(i-0.1)*2000-70 && mouseX <= 200+(i-0.1)*2000+70) {
        speed = i;
        break;//無駄の削減
      }
    }
  }//----------------------------------------------------------------------------------------------------設定ここまで

  if (mouseX > width*1.7/2 && mouseX < width && mouseY > height/3+200-32 && mouseY < height/3+200) {//-------リセット
    glass = 0;
    score = 0;
    cell = 0;
    disscore = 0;
    discell = 0;
    speed = 0.1;
    textT[0] = 0;
    bacteria[0].id = 1;
    bacteria[0].x = width/2;
    bacteria[0].y = height/2;
    bacteria[0].vx = 0;
    bacteria[0].vy = 0;
    bacteria[0].t = 0;
    bacteria[0].size = 35;
    for (int i=1; i < kazu; i++) {
      if (bacteria[i].id == 1) {
        bacteria[i].id = 0;     
        textT[i] = 0;
      }
    }
  }

  for (int i=0; i < kazu; i++) {//------------------------ここから死亡判定
    if (bacteria[i].id == 1) {
      if (sqrt(sq(mouseX - bacteria[i].x)+sq(mouseY - bacteria[i].y)) < bacteria[i].size/2) {
        cell++;
        score += int(bacteria[i].t/10);
        textX[i] = bacteria[i].x;
        textY[i] = bacteria[i].y;
        textScore[i] = int(bacteria[i].t/10);
        textT[i] = 60;
        bacteria[i].id = 0;
      }
    }
  }//---------------------------------------------------死亡判定ここまで
}




class Bacteria {
  float x, y, size, vx, vy, t;
  int id, dflag;
  float gosa;
  Bacteria(float Size, float VX, float VY, int ID) {
    size = Size;
    vx = VX;
    vy = VY;
    id = ID;
  }

  void display() {
    if (glass == 1) {
      fill(0, t, 99);
    }
    else {
      fill(0, 0, 99);
    }
    ellipse(x, y, size, size);
  }

  void move() {
    x += vx;
    y += vy;
    vx += random(-0.2, 0.2);
    vy += random(-0.2, 0.2);
    if (x-size/2 < width*0.3/2) {
      x = width*0.3/2 + size/2;
      vx *= -1;
    }
    if (x+size/2 > width*1.7/2) {
      x = width*1.7/2 - size/2;
      vx *= -1;
    }
    if (y-size/2 < height*0.4/2) {
      y = height*0.4/2 + size/2;
      vy *= -1;
    }
    if (y+size/2 > height*1.6/2) {
      y = height*1.6/2 - size/2;
      vy *= -1;
    }
  }

  void glow() {
    gosa = random(-0.7, 0.7);//個体ごとに微妙に差をつくる
    t += 99.*speed/60 + gosa;
    if (size <= 70) {
      size += 35.*speed/30 + gosa;
    }
  }

  void division() {
    if (t > 99) {
      id = 0;
      dflag = 2;
    }
  }
}
