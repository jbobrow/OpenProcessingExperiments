
int prevsec;
int starttime;
int curtime;
int dir; // 1 or -1
float lPos =1;
float rPos =1;

void setup() {
  size(300, 600);
  prevsec = second();
  starttime = millis();
  dir = 1;
}

void draw() {
  background(200);
  fill(0);
  ellipse(150, 220, 200, 200);
  ellipse(150, 500, 300, 400);
  fill(0);
  triangle(70, 180, 50, 100, 150, 180);
  triangle(150, 180, 250, 100, 230, 180);
  fill(240);
  ellipse(110, 200, 70, 70);
  ellipse(190, 200, 70, 70);
  fill(240);
  ellipse(150, 280, 80, 70);
  fill(242, 176, 176);
  ellipse(150, 245, 20, 20);

  fill(0);

  curtime = millis() - starttime;

  if (dir == 1)
  {
    lPos = map(curtime, 0, 1000, 100, 120);
  }

  if (dir == -1)
  {
    lPos = map(curtime, 0, 1000, 120, 100);
  }

  if (dir == 1)
  {
    rPos = map(curtime, 0, 1000, 180, 200);
  }

  if (dir == -1)
  {
    rPos = map(curtime, 0, 1000, 200, 180);
  }


  if (prevsec != second()) {
    prevsec = second();
    starttime = millis();
    println("Tick " + prevsec);
    dir = -dir;
    println(curtime);
  }


  //float cirsize = map(curtime, 0, 1000, 0, 200);
  //ellipse(width/2, height/2, cirsize, cirsize);

  ellipse(lPos, 200, 30, 70);
  ellipse(rPos, 200, 30, 70);
  
  textSize(32);
  fill(5, 242, 34);
  text("H:" + hour() + "  M:" + minute() + "  S:" + second(), 25, 500);

}



