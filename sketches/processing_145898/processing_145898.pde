
int[][] b = new int[4][4], bak = new int[4][4], prev[] = new int[4][4][3];
int pad = 20, bs = 100, len = pad*(b.length+1)+bs*b.length, score = 0, animStart, animLength = 10;
boolean dead = true;
void setup() {
  size(475,475);
  size(len, len);
  restart();
  textFont(createFont("Courier",40));
}
void restart() {
  b = new int[4][4];
  bak = new int[4][4];
  spawn();
  score = 0;
  dead = false;
}
void spawn() {
  ArrayList<Integer> xs = new ArrayList<Integer>(), ys = new ArrayList<Integer>();
  for (int j = 0 ; j < b.length; j++) for (int i = 0 ; i < b[j].length; i++) if (b[j][i]==0) {
    xs.add(i);
    ys.add(j);
  }
  int rnd = (int)random(0, xs.size()), y = ys.get(rnd), x = xs.get(rnd);
  b[y][x] = random(0,1) < .5 ? 2 : 4;
  prev[y][x][0] = -1;
}
void draw() {
  background(255);
  fill(150);
  noStroke();
  rect(0, 0, width, height, 10);
  for (int j = 0 ; j < b.length; j++) {
    for (int i = 0 ; i < b[j].length; i++) {
      fill(200);
      rect(pad+(pad+bs)*i, pad+(pad+bs)*j, bs, bs, 5);
    }
  }
  float gscore = 0, textvoff = 22;
  for (int j = 0 ; j < b.length; j++) {
    for (int i = 0 ; i < b[j].length; i++) {
      float xt = pad+(pad+bs)*i, yt = pad+(pad+bs)*j;
      float x = xt, y=yt;
      int val = b[j][i];
      float dur = (frameCount - animStart)*1.0/animLength;
      if (frameCount - animStart < animLength && prev[j][i][0]>0) {
        int prevy = pad+(pad+bs)*prev[j][i][1];
        int prevx = pad+(pad+bs)*prev[j][i][2];
        x = (x - prevx)*dur + prevx;
        y = (y - prevy)*dur + prevy;
        if (prev[j][i][0]>1) {
          val = prev[j][i][0];
          float p = log(val)/log(2);
          fill(255-p*255/11, p*255/11, 0);
          rect(xt, yt, bs, bs, 5);
          fill(0);
          textAlign(CENTER);
          textSize(40);
          text(""+prev[j][i][0], xt, yt + textvoff, bs, bs);
        }
      }
      if (frameCount - animStart > animLength || prev[j][i][0] >= 0) {
        if (prev[j][i][0]>=2) {
          float grow = abs(0.5-dur)*2;
          if(frameCount - animStart > animLength*3) grow = 1;
          else gscore = grow;
          fill(255,255,0,100);
          rect(x-2*grow, y-2*grow, bs+4*grow, bs+4*grow, 5);
        }
        else  if (prev[j][i][0]==1) {
          fill(255,100);
          rect(x-2, y-2, bs+4, bs+4, 5);
        }
        fill(200);
        if (val > 0) {
          float p = log(val)/log(2);
          fill(255-p*255/11, p*255/11, 0);
          rect(x, y, bs, bs, 5);
          fill(0);
          textAlign(CENTER);
          textSize(40);
          text(""+val, x, y + textvoff, bs, bs);
        }
      }
    }
  }
  if(gscore>0) {
    fill(255,255,0,200);
    textSize(gscore*40);
    textAlign(CENTER);
    text(""+score,0,height/2,width,200);
  }
  fill(0);
  textSize(10);
  textAlign(LEFT);
  text("Score: "+score, 10, 15);
  if(dead) {
    fill(255,100);
    rect(0,0,width,height);
    fill(0);
    textAlign(CENTER);
    textSize(30);
    text("Gameover! Click to restart", 0,height/2,width,50);
    if(mousePressed) restart();
  }
}
void keyPressed() {
  if(!dead) {
    int dy=keyCode==UP ? -1 : (keyCode==DOWN ? 1 : 0), dx=keyCode==LEFT ? -1 : (keyCode==RIGHT ? 1 : 0);
    int[][] newb = go(dy, dx);
    if (newb != null) {
      b = newb;
      spawn();
    }
    if (gameover()) dead = true;
  }
}
boolean gameover() {
  int[] dx = {    1, -1, 0, 0  }   , dy = {    0, 0, 1, -1  };
  int[][][] prevbak = prev;
  boolean out = true;
  int prevscore = score;
  for (int i = 0 ; i < 4; i++) if (go(dy[i], dx[i]) != null) out = false;
  prev = prevbak;
  score = prevscore;
  return out;
}
int[][] go(int dy, int dx) {
  int[][] bak = new int[4][4];
  for (int j = 0 ;j < 4; j++) for (int i = 0 ; i < 4; i++) bak[j][i] = b[j][i];
  prev = new int[4][4][3];
  boolean moved = false; 
  if (dx != 0 || dy != 0) {
    int d =  dx != 0 ? dx : dy;
    for (int perp = 0; perp < b.length; perp++) 
      for (int along = (d > 0 ? b.length - 2 : 1); along != (d > 0 ? -1 : b.length); along-=d) {
      int y = dx != 0 ? perp : along, x = dx != 0 ? along : perp, ty = y, tx = x;
      if (bak[y][x]==0) continue;
      for (int i=(dx != 0 ? x : y)+d; i!= (d > 0 ? b.length : -1); i+=d) {
        int r = dx != 0 ? y : i, c = dx != 0 ? i : x;
        if (bak[r][c] != 0 && bak[r][c] != bak[y][x]) break;
        if (dx != 0) tx = i; 
        else ty = i;
      }
      if ( (dx != 0 && tx == x) || (dy != 0 && ty == y)) continue;
      else if (bak[ty][tx]==bak[y][x]) {
        prev[ty][tx][0] = bak[ty][tx];          
        bak[ty][tx] *= 2;
        score += bak[ty][tx];
        moved = true;
      }
      else if ( (dx != 0 && tx != x) || (dy != 0 && ty != y)) {
        prev[ty][tx][0] = 1;
        bak[ty][tx] = bak[y][x];
        moved = true;
      }
      if (moved) {
        prev[ty][tx][1] = y;
        prev[ty][tx][2] = x;
        bak[y][x] = 0;
      }
    }
  }
  if (!moved) return null;
  animStart = frameCount;
  return bak;
}

