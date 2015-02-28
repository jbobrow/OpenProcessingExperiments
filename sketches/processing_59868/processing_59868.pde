
class employee {

  float x;
  float y;
  float speed;

  int on;
  int face;
  
  boolean ePlaying;

  employee(float tempx, float tempy) {

    x = tempx;
    y = tempy;

    speed = .5;
    on = 0;
    face = 0;
    
    ePlaying = false;
  }

  void display() {
    if (on == 1) {
      if (face == 0) {
        noStroke();
        fill(255);
        rect(x, y, 8, 22);//body
        rect(x, y-13, 14, 12);//head
        fill(0);
        rect(x-3, y-12, 2, 2);//left eye
        rect(x+3, y-12, 2, 2);//right eye
      }

      if (face == 1) {
        noStroke();
        fill(255);
        rect(x, y, 8, 28);//body
        rect(x-4, y-17, 14, 12);//head
        fill(0);
        rect(x-8, y-16, 2, 2);//left eye
        rect(x-2, y-16, 2, 2);//right eye
      }

      if (face == 2) {
        noStroke();
        fill(255);
        rect(x, y, 8, 28);//body
        rect(x+4, y-17, 14, 12);//head
        fill(0);
        rect(x+2, y-16, 2, 2);//left eye
        rect(x+8, y-16, 2, 2);//right eye
      }
    }
  }


  void chase(player p) {
    if (on == 1) {
      float d = dist(x, y, p.x, p.y);

      if (d<=15) {
        if (pa6.collected==false){
        dTrans = 255;
        p.death();
        }
      }

      if (on == 1) {
        if (x<p.x) {
          face=2;
          x+=speed;
        }
        if (x>p.x) {
          face = 1;
          x-=speed;
        }
        if (y<p.y) {
          y+=speed;
        }
        if (y>p.y) {
          y-=speed;
        }
      }
    }
  }

  void on() {
    ePlaying = true;
    playing = false;
    //layer1.pause();
    siren.loop();
    on = 1;
    x = round(random(width));
    y = height+15;
  }

  void on2() {
    ePlaying = true;
    playing = false;
    //layer1.pause();
    siren.loop();
    on = 1;
    x = round(random(width));
    y = round(random(height/2-25, height/2));
  }

  void off() {
    if (ePlaying){
      siren.pause();
      if (playing==false){
    //layer1.loop();
      }
      if (room == 2 || room == 3){
      chaos.pause();
      layer1.loop();
      }
    ePlaying = false;
    }
    on = 0;
  }
}


