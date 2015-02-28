
// 계속적 사용 변수.
int screenW = 500, screenH = 500;
int bgCol = 0xffffffff;

// 4. 클래스 사용, 한 개의 공 튀기기.
BallStep4 ball;

int mX, mY;
int strokeCol = 0xffff0000;
float trgBuff = 0.1f;

public void setup() {
  size(500, 500);
  ball = new BallStep4(this, width / 2, height / 2, 10, radians(random(360)));
}

public void draw() {
  ball.positionUpdate();
  ball.reflection();
  background(bgCol);
  noStroke();
  fill(ball.get_fillCol());
  ellipse(ball.get_x(), ball.get_y(), ball.get_diameter(), 
  ball.get_diameter());
  if (mousePressed) {
    stroke(strokeCol);
    line(mX, mY, mouseX, mouseY);
  }
}

public void mousePressed() {
  mX = mouseX;
  mY = mouseY;
}

public void mouseReleased() {
  float dist = dist(mX, mY, mouseX, mouseY);
  float angle = atan2(mouseY - mY, mouseX - mX);
  ball = new BallStep4(this, mX, mY, trgBuff * dist, angle);
}

public class BallStep4 {
  private PApplet p;
  private int x, y;
  private int r = 10;
  private int vx, vy;
  private int fillCol = 0xff000000;

  BallStep4(PApplet p, int x, int y, float speed, float angle) {
    this.p = p;
    initiation(x, y, speed, angle);
  }

  public void initiation(int x, int y, float speed, float angle) {
    this.x = x;
    this.y = y;
    vx = (int) (speed * p.cos(angle));
    vy = (int) (speed * p.sin(angle));
  }

  public void positionUpdate() {
    x += vx;
    y += vy;
  }

  public void reflection() {
    if (x < r || x > p.width - 1 - r) {
      vx *= -1;
      if (x < r) {
        // 정확한 반사좌표는 아니다.
        x = r;
      } 
      else {
        // 정확한 반사좌표는 아니다.
        x = p.width - 1 - r;
      }
    }
    if (y < r || y > p.height - 1 - r) {
      vy *= -1;
      if (y < r) {
        // 정확한 반사좌표는 아니다.
        y = r;
      } 
      else {
        // 정확한 반사좌표는 아니다.
        y = p.height - 1 - r;
      }
    }
  }

  public int get_x() {
    return x;
  }

  public int get_y() {
    return y;
  }

  public int get_r() {
    return r;
  }

  public int get_diameter() {
    return 2*r;
  }

  public int get_fillCol() {
    return fillCol;
  }
}


