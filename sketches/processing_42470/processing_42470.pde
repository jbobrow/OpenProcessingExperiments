
Bot bot;

void setup() {

  smooth();
  noStroke();
  size(500, 500);
  
  bot = new Bot(width/2,height/2,2);
}

void draw() {
  background(50);
  bot.update();
}


class Bot {
  int x=0;
  int y=0;
  int m=0;

  public Bot(int x, int y, int m) {
    this.x=x;
    this.y=y;
    this.m=m;
  }
  
  public void update() {
    if (keyPressed) {
      if (keyCode == 38) {
        y-=m;
      }
      if (keyCode == 37) {
        x-=m;
      }
      if (keyCode == 39) {
        x+=m;
      }
      if (keyCode == 40) {
        y+=m;
      }
    }

    ellipse(x, y, 20, 20);
  }
}


