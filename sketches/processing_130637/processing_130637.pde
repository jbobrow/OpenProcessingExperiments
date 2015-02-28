
void setup() {
  size(500, 500);
  //noLoop();
  noStroke();
  frameRate(1);
}

void draw() {
  background(255);
  fill(155);
  
  fill(random(0, 255), random(155, 255), random(0, 255), 20);
  ellipse(width/2,height/2,150,150);
  
  for (int i=0;i<360;i+=random(9,10)) {
    float x = cos(radians(i))*80; 
    float y = sin(radians(i))*80;
    if (random(0, 10)>2) {
      new Tail(width/2+x, height/2+y, random(5, 10), i);
    }
    else {
      fill(random(0, 255), random(0, 255), random(0, 255), 80);
      ellipse(width/2+x, height/2+y, 5, 5);
    }
  }
}

class Tail {
  float x=0;
  float y=0;
  float size=0;
  float heading=0;
  float curve= random(-15, 15);

  public Tail(float x, float y, float size, float heading) {
    fill(random(0, 255), random(155, 255), random(0, 255), 80);
    this.x=x;
    this.y=y;
    this.size=size;
    this.heading=heading;
    this.render();
  }

  public void render() {
    int len = int(random(3, 40));
    float decrement = size/len;
    for (int i=0;i<len;i++) {
      ellipse(x, y, size, size);
      x+=cos(radians(heading))*size;
      y+=sin(radians(heading))*size;

      heading+=curve;

      size-=decrement;
    }
  }
}

