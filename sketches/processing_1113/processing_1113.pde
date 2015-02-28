
int i;
int j;
int nj;
float d;
float abs_speed;
float f_corr1;
float f_corr2;
float f_corr3;
int n = 25;
MyBoid[] bv = new MyBoid[n];
Position center = new Position(0, 0);
Speed avgspd = new Speed(0, 0);

MyBoid predator = new MyBoid(n + 1);
float distToPred = 0;

void setup() {
  size(500, 500);
  noStroke();
  for(i=0; i<n; i++) {
    bv[i] = new MyBoid(i);
    bv[i].position.x = random(0, width);
    bv[i].position.y = random(0, height);
    bv[i].speed.x = random(0, 2);
    bv[i].speed.y = random(0, 2);
    predator.position.x = random(0, width);
    predator.position.y = random(0, height);
  }
}

void draw() {
  background(#CCCCCC);
  for(i=0; i<n; i++) {
    center.x = 0.0;
    center.y = 0.0;
    avgspd.x = 0.0;
    avgspd.y = 0.0;
    nj = 0;
    for(j=0; j<n; j++) {
      if(j != i) {
        d = dist(bv[i].position.x, bv[i].position.y, bv[j].position.x, bv[j].position.y);
        if(d < 50) {
          center.x += bv[j].position.x;
          center.y += bv[j].position.y;
          avgspd.x += bv[j].speed.x;
          avgspd.y += bv[j].speed.y;
          if(d < 20) {
            bv[i].speed.x -= ruleTwo(bv[i].position.x, bv[j].position.x, d);
            bv[i].speed.y -= ruleTwo(bv[i].position.y, bv[j].position.y, d);
          }
          nj += 1;
        }
      }
    }
    if(nj > 0) {
      bv[i].speed.x += ruleOne(bv[i].position.x, center.x/nj);
      bv[i].speed.y += ruleOne(bv[i].position.y, center.y/nj);
      bv[i].speed.x += ruleThree(bv[i].speed.x, avgspd.x/nj);
      bv[i].speed.y += ruleThree(bv[i].speed.y, avgspd.y/nj);
    }
    bv[i].speed.x -= 0.005*bv[i].speed.x;
    bv[i].speed.y -= 0.005*bv[i].speed.y;
    distToPred = dist(bv[i].position.x, bv[i].position.y, predator.position.x, predator.position.y);
    bv[i].speed.x -= ruleFour(bv[i].position.x, predator.position.x, distToPred);
    bv[i].speed.y -= ruleFour(bv[i].position.y, predator.position.y, distToPred);
    bv[i].move();
    
    if(bv[i].position.x > width) {
      bv[i].speed.x -= 0.1*(bv[i].position.x - width);
    }
    if (bv[i].position.x < 0) {
      bv[i].speed.x += -0.1*(bv[i].position.x);
    }
    if(bv[i].position.y > height) {
      bv[i].speed.y -= 0.1*(bv[i].position.y - height);
    }
    if (bv[i].position.y < 0) {
      bv[i].speed.y += -0.1*(bv[i].position.y);
    }
    fill(#000099);
    
    abs_speed = sqrt(bv[i].speed.x*bv[i].speed.x + bv[i].speed.y*bv[i].speed.y);
    if(abs_speed != 0) {
      f_corr1 = 10/abs_speed;
      f_corr2 = bv[i].speed.x/abs_speed;
      f_corr3 = -bv[i].speed.y/abs_speed;
      triangle(bv[i].position.x+bv[i].speed.x*f_corr1, bv[i].position.y+bv[i].speed.y*f_corr1, bv[i].position.x+2*f_corr3, bv[i].position.y+2*f_corr2, bv[i].position.x-2*f_corr3, bv[i].position.y-2*f_corr2);
    }
    else triangle(bv[i].position.x, bv[i].position.y+10, bv[i].position.x-2, bv[i].position.y, bv[i].position.x+2, bv[i].position.y);
  }
  // predator movements
  nj = 0;
  center.x = 0;
  center.y = 0;
  for(j=0; j<n; j++) {
    d = dist(predator.position.x, predator.position.y, bv[j].position.x, bv[j].position.y);
    if(d < 100) {
      center.x += bv[j].position.x;
      center.y += bv[j].position.y;
      nj += 1;
    }
  }
  if(nj > 0) {
    predator.speed.x += 1.5*ruleOne(predator.position.x, center.x/nj);
    predator.speed.y += 1.5*ruleOne(predator.position.y, center.y/nj);
  }
  predator.speed.x -= 0.01*predator.speed.x;
  predator.speed.y -= 0.01*predator.speed.y;
  if(predator.position.x > width) {
      predator.speed.x -= 0.1*(predator.position.x - width);
    }
    if (predator.position.x < 0) {
      predator.speed.x += -0.1*(predator.position.x);
    }
    if(predator.position.y > height) {
      predator.speed.y -= 0.1*(predator.position.y - height);
    }
    if (predator.position.y < 0) {
      predator.speed.y += -0.1*(predator.position.y);
    }
  predator.move();
  fill(#FF0000);
  abs_speed = sqrt(predator.speed.x*predator.speed.x + predator.speed.y*predator.speed.y);
  if(abs_speed != 0) {
    f_corr1 = 15/abs_speed;
    f_corr2 = predator.speed.x/abs_speed;
    f_corr3 = -predator.speed.y/abs_speed;
    triangle(predator.position.x+predator.speed.x*f_corr1, predator.position.y+predator.speed.y*f_corr1, predator.position.x+3*f_corr3, predator.position.y+3*f_corr2, predator.position.x-3*f_corr3, predator.position.y-3*f_corr2);
  }
  else triangle(predator.position.x, predator.position.y+15, predator.position.x-3, predator.position.y, predator.position.x+3, predator.position.y);
}

float ruleOne(float p, float c) {
  return (c - p)/1000;
}
float ruleTwo(float p, float p2, float d) {
  return ((20/(d+1)-1)*((p2 - p)/d));
}
float ruleThree(float s, float avgs) {
  return (avgs - s)/15;
}
float ruleFour(float p, float p_pred, float d) {
  if (d < 40)
    return ((40/(d+1)-1)*((p_pred - p)/d));
  else
    return 0.0;
}

public class MyBoid {
  public int index;
  public Position position;
  public Speed speed;
  
  MyBoid(int idx) {
    this.index = idx;
    this.position = new Position(0, 0);
    this.speed = new Speed(0, 0);
  }
  
  public void move() {
    this.position.x += this.speed.x;
    this.position.y += this.speed.y;
  }
}

public class Position {
  public float x;
  public float y;
  
  Position(float ax, float ay) {
    this.x = ax;
    this.y = ay;
  }
}

public class Speed {
  public float x;
  public float y;
  
  Speed(float sx, float sy) {
    this.x = sx;
    this.y = sy;
  }
}

