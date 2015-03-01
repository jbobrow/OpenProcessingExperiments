
int stagewidth=600, stageheight=300;
int tilewidth=stagewidth/2;
float vx = 4;

Tile[] tiles = {
    new Tile(0,           0xffff0000),
    new Tile(tilewidth,   0xff00ff00),
    new Tile(tilewidth*2, 0xff0000ff)
};

void setup() {
    size(stagewidth, stageheight);
}

void draw() {
    background(125);
    for (Tile t : tiles)
      t.update();
}

class Tile {
    float x;
    int colr;
    
    Tile(float x, int colr) {
        this.x=x;
        this.colr=colr;
    }

    void update() {
        if (x <= -tilewidth)
            x = stagewidth;
        x -= vx;
        fill(colr);
        rect(x, 200, tilewidth, 50);
  }
}
