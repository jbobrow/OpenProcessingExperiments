
class Ball{
  float x,y,dy,t;

  Ball(){//newしたときにこれは必ず呼ばれる
    this.x = random(-30,30)+mouseX;
    this.y = -5;
    dy = 0;
    t = 255;
  }

  void draw(){
    fill(t);
    ellipse(x,y,10,10);
  }

  void update(){
    y = y + dy;
    dy = dy + random(0.2);
    if(y >= height && dy > 0){
      dy = -dy*random(0.7,0.9);
    }
    t -= 0.2;
  }
}

