
class Fish {
  float x;
  float y; 
  float vx;
  float vy;
  float v;
  float ax;
  float ay;
  float avalue = 0.04;
  float r;
  float dt;
  float angle; //각도
  int frame;
  float sc;



  void init() {
    x = random(0,width);
    y = random(0,height);
    dt = 0.2;
    vx = random(-1.5,1.5);
    vy = random(-1.5,1.5);
    v = sqrt(vx * vx + vy * vy);
    r = 50;
    angle = atan2(vx, -vy);
    frame = int(random(0, 50));
    sc = random(0.7, 1.3);
  }

  void interact() {
    // parNum은 어차피 전역으로 잡혀 있는 파티클의 전체 개수라서 ok
    for(int i = 0; i < parNum; i++)
    {
      Fish other = myPar[i]; // 나와 다른파티클을 선정
      if(this != other) // 다른 것이 내가 아니라면... 이후는 HTML5 예제와 동일.
      {
        float dx = x - other.x;
        float dy = y - other.y;
        float d = sqrt(dx * dx + dy * dy);
        if(d > 0)
        {
          float R = r + other.r;
          if(d < R)
          {
            float dR = R - d;
            float ux = dx / d;
            float uy = dy / d;
            x += ux * dR * 0.5; //여기 부터 이전과 무엇이 다른지 관찰해 보세요
            y += uy * dR * 0.5;
            other.x += -ux * dR * 0.5;
            other.y += -uy * dR * 0.5;
          }
        }
      }
    }
  }

  void grid() {
    if(v < 0.3) {
      if ((x >= 0) && (x < width/5) && (y >= 0) && (y < width/5)) { //case1
        ax = avalue;
        ay = 0;
      } 
      else if ((x >= width/5) && (x < width/5 * 2) && (y >= 0) && (y < width/5)) {  //case2
        ax = avalue;
        ay = avalue;
      }
      else if ((x >= width/5 * 2) && (x < width/5 * 3) && (y >= 0) && (y < width/5)) {  //case3
        ax = avalue;
        ay = 0;
      }
      else if ((x >= width/5 * 3) && (x < width/5 * 4) && (y >= 0) && (y < width/5)) {  //case4
        ax = -avalue;
        ay = avalue;
      }
      else if ((x >= width/5 * 4) && (x < width/5 * 5) && (y >= 0) && (y < width/5)) {  //case5
        ax = -avalue;
        ay = avalue;
      }
      else if ((x >= 0) && (x < width/5) && (y >= width/5) && (y < width/5 * 2)) {  //case6
        ax = avalue;
        ay = -avalue;
      }
      else if ((x >= width/5) && (x < width/5 * 2) && (y >= width/5) && (y < width/5 * 2)) {  //case7
        ax = -avalue;
        ax = -avalue;
      }
      else if ((x >= width/5 * 2) && (x < width/5 * 3) && (y >= width/5) && (y < width/5 * 2)) {  //case8
        ax = avalue;
        ay = avalue;
      }
      else if ((x >= width/5 * 3) && (x < width/5 * 4) && (y >= width/5) && (y < width/5 * 2)) {  //case9
        ax = -avalue;
        ay = avalue;
      }
      else if ((x >= width/5 * 4) && (x < width/5 * 5) && (y >= width/5) && (y < width/5 * 2)) {  //case10
        ax = -avalue;
        ay = avalue;
      }
      else if ((x >= 0) && (x < width/5 * 1) && (y >= width/5 * 2) && (y < width/5 * 3)) {  //case11
        ax = avalue;
        ay = avalue;
      }
      else if ((x >= width/5 * 1) && (x < width/5 * 2) && (y >= width/5 * 2) && (y < width/5 * 3)) {  //case12
        ax = avalue;
        ay = -avalue;
      }
      else if ((x >= width/5 * 2) && (x < width/5 * 3) && (y >= width/5 * 2) && (y < width/5 * 3)) {  //case13
        ax = avalue;
        ay = avalue;
      }
      else if ((x >= width/5 * 3) && (x < width/5 * 4) && (y >= width/5 * 2) && (y < width/5 * 3)) {  //case14
        ax = -avalue;
        ay = avalue;
      }
      else if ((x >= width/5 * 4) && (x < width/5 * 5) && (y >= width/5 * 2) && (y < width/5 * 3)) {  //case15
        ax = -avalue;
        ay = avalue;
      }
      else if ((x >= 0) && (x < width/5) && (y >= width/5 * 3) && (y < width/5 * 4)) {  //case16
        ax = avalue;
        ay = -avalue;
      }
      else if ((x >= width/5 * 1) && (x < width/5 * 2) && (y >= width/5 * 3) && (y < width/5 * 4)) {  //case17
        ax = avalue;
        ay = -avalue;
      }
      else if ((x >= width/5 * 2) && (x < width/5 * 3) && (y >= width/5 * 3) && (y < width/5 * 4)) {  //case18
        ax = avalue;
        ay = -avalue;
      }
      else if ((x >= width/5 * 3) && (x < width/5 * 4) && (y >= width/5 * 3) && (y < width/5 * 4)) {  //case19
        ax = avalue;
        ay = -avalue;
      }
      else if ((x >= width/5 * 4) && (x < width/5 * 5) && (y >= width/5 * 3) && (y < width/5 * 4)) {  //case20
        ax = -avalue;
        ay = -avalue;
      }
      else if ((x >= 0) && (x < width/5) && (y >= width/5 * 4) && (y < width/5 * 5)) {  //case21
        ax = avalue;
        ay = -avalue;
      }
      else if ((x >= width/5 * 1) && (x < width/5 * 2) && (y >= width/5 * 4) && (y < width/5 * 5)) {  //case22
        ax = avalue;
        ay = -avalue;
      }
      else if ((x >= width/5 * 2) && (x < width/5 * 3) && (y >= width/5 * 4) && (y < width/5 * 5)) {  //case23
        ax = avalue;
        ay = -avalue;
      }
      else if ((x >= width/5 * 3) && (x < width/5 * 4) && (y >= width/5 * 4) && (y < width/5 * 5)) {  //case24
        ax = -avalue;
        ay = -avalue;
      }
      else if ((x >= width/5 * 4) && (x < width/5 * 5) && (y >= width/5 * 4) && (y < width/5 * 5)) {  //case25
        ax = -avalue;
        ay = -avalue;
      }
    }
  } 

  void update() {
    x += vx;
    y += vy;
    vx += ax;
    vy += ay;
    v = sqrt(vx * vx + vy * vy);
    if (x <= -(width/5) || x >= (7 * width/6))
      vx = -vx;
    if (y <= -(height/5) || y >= (7 * height/6))
      vy = -vy; 
    angle = atan2(vx, -vy);
  }

  void display() {
    //interact();
    //update();
    fill(0);
    pushMatrix();
    translate(x, y);
    rotate(angle);
    scale(sc);
    image(images[frame], 0, 0);
    popMatrix();
  }

  void animate() {
    frame++;
    if(frame == 50) {
      frame = 0;
    }
  }
}


