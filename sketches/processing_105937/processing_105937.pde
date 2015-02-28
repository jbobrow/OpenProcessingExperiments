
Blurb Sean = new Blurb();
Blurb Enrica = new Blurb();
Blurb Susan = new Blurb();

void setup() {
  size(400, 400);
  Sean.prime(0, height/2, 2);
  Enrica.prime(width/3, height/2, 2);
  Susan.prime(2* width/3, height/2, 2);
}

void draw() {
  background(255);
  Sean.animate();
  Enrica.animate();
  Susan.animate();
  }

class Blurb {

  float x;
  float y;
  float speed;

  void prime(float a, float b, float c) {
    x=a;
    y=b;
    speed=c;
  }

  void animate() {
    //Body
    fill(240, 230, 220);
    rect(x, y, 100, 100);

    //Eyes
    fill(255);
    ellipse(x+30, y+20, 20, 30);
    ellipse(x+60, y+20, 20, 30);

    //Pupils
    fill(0);
    ellipse(x+35, y+25, 10, 20);
    ellipse(x+55, y+25, 10, 20);

    //Mouth
    noStroke();
    fill(255, 0, 0);
    ellipse(x+45, y+55, 20, 15);

    //Type
    textSize(20);
    fill(233);
    text("AAHHH!",x+40, y-10);
    
    x+=speed;
      
  }
}
