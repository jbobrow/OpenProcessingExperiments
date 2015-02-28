
bot b = new bot(700,700, 25);
obst o[] = new obst [50];
void setup() {

  for (int i=0;i<o.length;i++) {
    float x = random(1000);
    float y = random(1000);
    o[i]=new obst(random(1000), random(1000), random(10, 60));
  }
  smooth();
  size(1000, 1000);
}
float eggX=200;
float eggY=200;

void draw() {
  colorMode(RGB, 255);
  background(0,255,0 );

  ellipse(eggX, eggY, 400, 400);
  b.render();
  if (dist(b.x, b.y, eggX, eggY)<200) {
    strokeWeight(5);
    b.m=0;
  }

  b.render(); 
  for (int i=0;i<o.length;i++) {
    o[i].render();
  }
}

  class obst {

    float x=0;
    float y=0;
    float d=0;
    float a=0;
    float m=0;
    int colour=0;
    obst(float newX, float newY, float newD) {
      x=newX;
      y=newY;
      d=newD;
      a=(0);
      m=(0);
      colour =(int)random(100);
    }



    void render() {
      if (dist(this.x, this.y, b.x, b.y) <d/2) {
        if (b.life > 0) {
          b.life--;
        }
        else {
          b.m=0;
        }
      }

      ellipse(x, y, d, d);
    }
  }

  class bot {
    int life=3;
    float x=0;
    float y=0;
    float d=0;
    float a=0;
    float m=0;
    int colour=0;
    bot(float newX, float newY, float newD) {
      x=newX;
      y=newY;
      d=newD;
      a=(0);
      m=(0);
      colour =(int)random(100);
    }




    void render() {


      float xChange = cos(radians(a))*m;
      float yChange = sin(radians(a))*m;
      x+=xChange;
      y+=yChange;
      //a++;

      if (keyPressed == true) {
        if (key == 'w') {
          m+=0.05;
        }
        if (key == 'a') {
          a--;
        }
        if (key == 's') {
          m-=0.05;
        }
        if (key == 'd') {
          a++;
        }
        if (key == '.') {
          m+=0.05;
        }
        if (key == ',') {
          m-=0.05;
        }
      }


      ellipse(x, y, d, d);

      line(x, y, (x-xChange*30), (y-yChange*30));

      if (x>width) {
        x=0;
      }
      if (x<0) {
        x=width;
      }
      if (y>height) {
        y=0;
      }
      if (y<0) {
        y=height;
      }
      colorMode(HSB, 100);
      fill(life, 100, 100);
    }
  }
