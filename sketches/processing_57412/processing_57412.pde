
//Make it Rain!

RainDrop Drop1 = new RainDrop(20, 5);
RainDrop Drop2 = new RainDrop(50, 8);
RainDrop Drop3 = new RainDrop(34, 3);
RainDrop Drop4 = new RainDrop(90, 4);
RainDrop Drop5 = new RainDrop(1, 2);
RainDrop Drop6 = new RainDrop(120, 10);
RainDrop Drop7 = new RainDrop(180, 7);
RainDrop Drop5 = new RainDrop(12, 2);
RainDrop Drop6 = new RainDrop(80, 4);
RainDrop Drop7 = new RainDrop(10, 9);

void setup()
{
  background(240);
  size(600, 200);
  frameRate(18);
}

void draw() {
 background(240);
 Drop1.update();
 Drop2.update();
 Drop3.update();
 Drop4.update();
 Drop5.update();
 Drop6.update();
 Drop7.update();
}

class RainDrop {
  float xpos, ypos, speed, rainLength, depth;
  RainDrop (float x, float d) {
    depth = d;
    xpos = x;
    ypos = 0;
    speed = 60/depth;
    rainLength = 100/depth;
    ypos -= rainLength;
}

void update() {
    ypos += speed;
    if (ypos > height) {
      ypos = 0-rainLength;
      xpos = random(width);
      depth += (random(2)-1);
      if (depth > 10){
       depth = 10;
      }else if(depth < 2){
       depth = 2;
      }
    }
    strokeWeight(25/depth);
    stroke(depth*25);
    line(xpos, ypos, xpos, ypos+rainLength);
  }
}
