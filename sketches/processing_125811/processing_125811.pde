
LED led[][];
int x=5, y=5;
int endX=0, endY=0;
int gridDim = 50;
void setup() {
  size(600, 300);

  led = new LED[width/gridDim][height/gridDim];

  for (int x=0;x<width/gridDim;x++) {
    for (int y=0;y<height/gridDim;y++) {
      led[x][y] = new LED(x*gridDim, y*gridDim);
    }
  }  
  stroke(255/2);
  endX=int(random(width/gridDim));
  endY=int(random(height/gridDim));
}
int tick=0;
float r = 0;

void draw() {
  tick++;
  background(255);
  renderGrid();

  if (tick%10 == 0) {
    moveBot();
    if (x==endX && y == endY) {
      newLevel();
    }
  }

  fill(255, 255, 0);
  rect(endX*gridDim, endY*gridDim, gridDim, gridDim);
  fill(255, 0, 0);
  ellipse(x*gridDim+gridDim/2, y*gridDim+gridDim/2, 15, 15);
}

void renderGrid() {
  led[endX][endY].on=false;
  for (int x=0;x<width/gridDim;x++) {
    for (int y=0;y<height/gridDim;y++) {
      led[x][y].render();
    }
  }
}
void moveBot() {
  boolean move=false;
  if (r>=0 && r<= 20) {//right
    if (x<(width/gridDim)-1 && !led[x+1][y].on) {
      x+=1;
      move=true;
    }
  }
  else if (r>=20 && r<= 40) {//left
    if (x>0 && !led[x-1][y].on) {
      x-=1;
      move=true;
    }
  }
  else if (r>=40 && r<= 60) { //down
    if (y<(height/gridDim)-1 && !led[x][y+1].on) {
      y+=1;
      move=true;
    }
  }
  else if (r>=60 && r<= 80) {//up
    if (y>0 && !led[x][y-1].on) {
      y-=1;
      move=true;
    }
  }

  if (!move) {
    r = random(80);
  }
}

void newLevel() {


  for (int x=0;x<width/gridDim;x++) {
    for (int y=0;y<height/gridDim;y++) {
      led[x][y].on = false;
    }
  }

  endX=int(random(width/gridDim));
  endY=int(random(height/gridDim));

  for (int i = 0;i<((width/gridDim)*(height/gridDim)/10);i++) {
    led[int(random(width/gridDim))][int(random(height/gridDim))].on = true;
  }
}
void mousePressed() {
  int x = int(map(mouseX, 0, width, 0, width/gridDim));
  int y = int(map(mouseY, 0, height, 0, height/gridDim));
  led[x][y].switchState();
}



void keyPressed() {
  for (int x=0;x<width/gridDim;x++) {
    for (int y=0;y<height/gridDim;y++) {
      led[x][y].switchState();
    }
  }
}
class LED {
  float x=0, y=0;
  boolean on=false;
  public LED(float x, float y) {
    this.x=x;
    this.y=y;
  }

  public void render() {
    if (on) {
      fill(255);
    }
    else {
      fill(0);
    }
    rect(x, y, gridDim, gridDim);
  }

  public void switchState() {
    if (on) {
      on=false;
    }
    else {
      on=true;
    }
  }
}
