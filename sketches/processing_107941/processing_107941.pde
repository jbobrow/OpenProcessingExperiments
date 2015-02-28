
boolean loop = true;
int gx = 25, gy = 50;
color[] col = {#fd140d, #074fa1, #cdd5c0, #f2d62c, #2d2520};
int colNum = 5, colSeq = 0;
int xold1, yold1, xold2, yold2;

void setup(){
  size(500, 500, P2D);
  background(255);
  strokeWeight(10);
  rectMode(CORNERS);
  //frameRate(10);
  xold1 = xold2 = width/2/gx;
  yold1 = yold2 = height/2/gy;
}

void draw(){
  int x1, y1;
  if (random(1) < 0.5) x1 = xold1;
  else x1 = xold2;
  if (random(1) < 0.5) y1 = yold1;
  else y1 = yold2;

  int x2, y2;
  do{
    x2 = (int)(random(-width/2, width/2)/gx + x1);
  } while (x2 < 0 || x2*gx > width);
  do{
    y2 = (int)(random(-height/2, height/2)/gy + y1);
  } while (y2 < 0 || y2*gy > height);

  if (random(1) < 0.3) fill(color(col[(colSeq++) % colNum]));
  else fill(255);
  
  rect(x1*gx, y1*gy, x2*gx, y2*gy);
  xold1 = x1;
  yold1 = y1;
  xold2 = x2;
  yold2 = y2;
}

void keyReleased(){
  if (key == ' '){
    if (loop){
      noLoop();
      loop = false;
    } else {
      loop();
      loop = true;
    }
  }
}

