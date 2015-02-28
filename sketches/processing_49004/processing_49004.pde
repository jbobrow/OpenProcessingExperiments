
Creature[] c;
Spot[] sp = new Spot[50];
void setup() {//設定

  smooth();
  size(600, 600);//畫布大小

  c = new Creature[0];
  for(int a=0;a<5;a++){//水母數量
  new Creature( new PVector(int(random(width)), int(random(height)) / 2), 20, 20, 5, 20, 5, 5);//觸腳數量以及大小
  colorMode(RGB,255);

  smooth();//平滑
  noStroke();//沒邊框
  for (int i = 0; i < sp.length; i++) {//水母亂數
    sp[i] = new Spot(
    random(width),
    random(height),
    random(0.2,1.0),
    random(0.1,1.0));
  }
  }
}

void draw() {//開始畫

background(0,10,30);//背景
  for (int i = 0; i < sp.length; i++) {
    sp[i].move();//水母移動
    sp[i].display();//軌跡消失
  }
 
  for(int a=0;a<c.length;a++){
  c[a].update();
  c[a].draw(); 

  fill(153);//填滿
  ellipse(100, 600, 240,160);//圓形
   fill(170);
  ellipse(300, 650, 200,160);
          noStroke();
          fill(150,7,131,95);
  quad(270, 550, 300,500, 380, 400, 260, 600);//菱形
  quad(400, 550, 370,450, 380, 500, 400, 600);

   fill(120);
  ellipse(100, 620, 220,160);
   fill(100);
  ellipse(200, 620, 150,130);
  fill(146,7,131);
  quad(10, 550, 10,50, 10, 300, 30, 500);
  
    fill(153);
  ellipse(500, 610, 100,80);

      fill(100);
  ellipse(600, 610, 200,100);
  fill(146,7,131);
    quad(450, 500, 450,530, 460, 550, 450, 600);
       fill(200);
  ellipse(400, 600, 110,80);
  fill(255,90);
  rect(300,500,5,100);
   rect(120,450,5,250);//方形
   rect(555,480,5,250);
  fill(255);
  rect(100,550,5,100);
  rect(510,550,5,100);
 
  
   fill(0,0,255,99);
   ellipse(135, 600, 30,30);
    ellipse(110, 580, 27,27);
    ellipse(135, 560, 24,24);
   ellipse(110, 540, 21,21);
   ellipse(132, 520, 18,18);
  ellipse(115, 500, 15,15);
  ellipse(130, 480, 13,13);
  ellipse(115, 460, 10,10);
  ellipse(123, 450, 10,10);
   ellipse(292, 600, 18,18);
    ellipse(313, 595, 17,17);
   ellipse(292, 580, 16,16);
   ellipse(313, 570, 15,15);
   ellipse(293, 560, 14,14);
   ellipse(311, 550, 13,13);
   ellipse(294, 540, 12,12);
   ellipse(311, 530, 11,11);
      ellipse(297, 525, 10,10);
      ellipse(308, 515, 9,9); 
       ellipse(298, 510, 9,9); 
          ellipse(303, 500, 9,9);    
   fill(255,244,90);
    ellipse(108, 550,6,6);
    ellipse(97, 560,7,7);
   ellipse(110, 570,8,8);
   ellipse(95, 580,10,10);
    ellipse(110, 590,12,12);
     ellipse(95, 598,14,14);
     ellipse(100, 550,8,8);

     
beginShape();//開始畫圖形

 fill(100,10,150);
 
vertex(20, 600);//點坐標
bezierVertex(30,500, 50, 30, 20, 800);//貝茲曲線
bezierVertex(30, 500, 50,30, 20, 800);
vertex(800, 800);
bezierVertex(500,100, 250,40,350, 100);
bezierVertex(10, 40,800,80, 550,700);

vertex(500, 800);
bezierVertex(400,50, 450,260,500, 800);
bezierVertex(550, 200,550,5, 550,700);

vertex(50, 800);
bezierVertex(10,300, 20, 80, 10, 700);
bezierVertex(90, 100, 50,100, 50, 800);
 
vertex(80, 200);
bezierVertex(50,600, 50, 30, 20, 100);
bezierVertex(50, 300, 50,100, 50, 800);
endShape();

 fill(255);
  rect(30,500,5,100);
   fill(255,244,90,99);
    ellipse(45, 600,20,20);
    ellipse(20, 585,25,25);
    ellipse(45, 570,18,18);
    ellipse(23, 555,20,20);
     ellipse(42, 540,18,18);
     ellipse(23, 530,16,16);
     ellipse(40, 520,14,14);
     ellipse(25, 510,12,12);
    ellipse(33, 500,12,12);
     
      fill(255,244,90,99);
   ellipse(545, 600,22,22);
    ellipse(570, 590,22,22);
   ellipse(545, 570,20,20);
   ellipse(570, 560,20,20);
   ellipse(548, 540,18,18);
   ellipse(568, 525,18,18);
   ellipse(548, 510,16,16);
   ellipse(568, 500,16,16);
   ellipse(550, 485,14,14);
   ellipse(564, 480,12,12);
   ellipse(558, 470,10,10);
    fill(0,0,255,99);
   ellipse(503, 600, 20,20);
   ellipse(525, 595, 20,20);
   ellipse(503, 580, 18,18);
    ellipse(525, 570, 18,18);
   ellipse(505, 560, 16,16);
   ellipse(520, 550, 16,16);
   ellipse(508, 540, 12,12);
   noFill();//不填滿
   stroke(150);//邊框
   ellipse(400,10,80,80);
       ellipse(400,10,90,90);
      ellipse(330,30,70,70);
      ellipse(50,300,50,50);
      ellipse(355,350,40,40);
      ellipse(100,500,20,20);
      stroke(200);
      ellipse(100,90,30,30);
      ellipse(30,30,20,20);
       ellipse(250,30,5,5);
        ellipse(280,380,5,5);
         ellipse(335,340,15,15);
         stroke(100);
       ellipse(280,80,10,10);
        ellipse(500,500,10,10);
        ellipse(500,300,50,50);
 
  }
}
 
  
// From Robert Penner's easing equations
static class Penner {
  // time, beginning position, change in position, and duration
  static float easeInOutExpo(float t, float b, float c, float d) {
    if (t==0) return b+t;
    if (t==d) return b+c;
    if ((t/=d/2) < 1) return c/2 * pow(2, 10 * (t - 1)) + b;
    return c/2 * (-pow(2, -10 * --t) + 2) + b;
  }
};
class Spot {
  float x, y, diameter, speed; // x座標, y座標, 直径, 速さ
    
  Spot(float _x, float _y, float _diameter, float _speed) {
    x = _x;
    y = _y;
    diameter = _diameter;
    speed = _speed;
  }
    
  void move() {
    speed *= 1.001;
    y -= speed;
    if (y < - width*diameter/2) {
      x = random(width);
      y = height + width*diameter/2;
      speed = random(0.5,3);
      }
  }
    
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(TWO_PI*diameter);
    scale(diameter);
tint(10, 15, 10, 10);
    fill(255,80);
    ellipse(0,0,random(10,10),random(10,10));
    popMatrix();
  }
}
  
class TentaclePart {
  PVector position;
  float width;
  float height;
  color clr;
  
};
  
class Tentacle {
  
  PVector position;
  float orientation;
  float angularVelocity;
  int nbParts;
  float compactness;
  ArrayList<TentaclePart> parts;
  
  Tentacle(PVector pos, int nb, float w, float h, float o, float c) {
    position = pos;
    nbParts = nb;
    float headWidth = w;
    float headHeight = h;
    compactness = c;
    orientation = o;
    angularVelocity = 5;
    parts = new ArrayList<TentaclePart>();
    float coul = 255.0/nbParts;
    for (int i = 0; i < nbParts; i++) {
      TentaclePart part = new TentaclePart();
      part.width = (nbParts-i) * headWidth / (float)nbParts;
      part.height = (nbParts-i) * headHeight / (float)nbParts;
      part.position = position.get();
      part.position.x += compactness * i * cos( orientation );
      part.position.y += compactness * i * tan( orientation );
      part.clr = color(0, 255-coul*i,255);
      parts.add( part );
    }
  }
  
  void update() {
    PVector pos0 = parts.get(0).position;
    PVector pos1 = parts.get(1).position;
    pos0.set(position.get());
    pos1.x = pos0.x + ( compactness * cos( orientation ) );
    pos1.y = pos0.y + ( compactness * sin( orientation ) );
    for (int i = 2; i < nbParts; i++) {
      PVector currentPos = parts.get(i).position.get();
      PVector dist = PVector.sub( currentPos, parts.get(i-2).position.get() );
      float distmag = dist.mag();
      PVector pos = parts.get(i - 1).position.get();
      PVector move = PVector.mult(dist, compactness);
      move.div(distmag);
      pos.add(move);
      parts.get(i).position.set(pos);
    }
  }
  
  void draw() {
    for (int i = nbParts - 1; i >= 0; i--) {
      TentaclePart part = parts.get(i);
      noStroke();
      
     fill(part.clr);
      ellipse(part.position.x, part.position.y, part.width, part.height);
    }
  }
};
  
class Creature {
  
  PVector position;
  float radX, radY;
  float orientation;
  
  color headClr;
  
  ArrayList<Tentacle> tentacles;
  int nbTentacles;
  int tentaclesLength;
  
  int moveTime;
  int moveDuration;
  PVector dest;
  PVector lastPos;
  float moveDistance;
  boolean reachedDest;
  
  Creature(PVector pos, float rx, float ry, int nb, int l, float ts, float td) {
  
    position = pos;
    radX = rx;
    radY = ry;
    orientation = 0;
  
    nbTentacles = nb;
    tentaclesLength = l;
    tentacles = new ArrayList<Tentacle>();
  
    headClr = color(random(50,200), random(50,200), random(50,200));
  
    dest = new PVector(random(-1,2), random(-1,3));
    dest.mult(moveDistance);
    lastPos = position.get();
    moveDuration = int(random(100,150));
    moveDistance = random(300,400);
    reachedDest = true;
    moveTime = 0;
  
  
    for (int i = 0; i < nbTentacles; i++) {
      float tx = position.x + (cos(i * TWO_PI / nbTentacles) * radX/4);
      float ty = position.y + (sin(i * TWO_PI / nbTentacles) * radY/2);
      float tr = atan2(ty - position.y, tx - position.x);
      Tentacle tentacle = new Tentacle(new PVector(tx, ty), tentaclesLength, ts, ts, tr, td);
      tentacles.add(tentacle);
    }
    c = (Creature[]) append(c, this);
  }
  
  void update() {
    for (int i = 0; i < nbTentacles; i++) {
      Tentacle t = tentacles.get(i);
      t.position.x = position.x + (cos((i * TWO_PI / nbTentacles) + orientation) * radX/2);
      t.position.y = position.y + (sin((i * TWO_PI / nbTentacles) + orientation) * radY/2);
      t.orientation = atan2((t.position.y - position.y), (t.position.x - position.x));
      t.update();
    }
  
    if(reachedDest) {
      lastPos = position.get();
      dest = new PVector(random(-1,1), random(-1,1));
      dest.normalize();
      dest.mult(moveDistance);
  
      PVector nextPos = PVector.add(position, dest);
      if(nextPos.x > width)
        dest.x = -abs(dest.x);
      else if(nextPos.x < 0)
        dest.x = abs(dest.x);
      if(nextPos.y  > height)
        dest.y = -abs(dest.y);
      else if(nextPos.y < 0)
        dest.y = abs(dest.y);
      reachedDest = false;
      moveTime = 0;
    }
    else {
      position.x = Penner.easeInOutExpo(moveTime, lastPos.x, dest.x, moveDuration);
      position.y = Penner.easeInOutExpo(moveTime, lastPos.y, dest.y, moveDuration);
      moveTime++;
      if(moveTime >= moveDuration)
        reachedDest = true;
    }
    orientation += random(-3, 3) * radians(.5);
  }
  
  void draw() {
    fill(200/*headClr*/);
    for(int i = 0; i < nbTentacles; i++)
      tentacles.get(i).draw();

  }
};


