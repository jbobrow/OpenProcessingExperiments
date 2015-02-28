
//Victoria H, Pong CP1 mods 16/17

ball b;
paddle p1;
int score=0;
int scoreTwo=0;
void setup() {
  size(500, 500);
  background(0);
  b=new ball();
  p1=new paddle();
}
void draw() {
  background(201, 32, 2);
  noFill();
  stroke(255);
  strokeWeight(5);
  rect(10, 40, 480, 450);
  textAlign(CENTER);
  text("PONG",250,30);
  text("Score: "+scoreTwo,450,30);
  text("Score: "+score,50,30);
  p1.reds();
  p1.blues();
  p1.restrict();
  p1.move();
  b.bounce();
  b.move();
  b.show();
}
void mousePressed(){
  redraw();
}
class paddle {
  int a, b;
  int n, m;
  boolean up;
  paddle() {
    a=50;
    b=400;
    n=450;
    m=250;
    up=false;
  }
  void blues() {
    noStroke();
    fill(0, 0, 255);
    rect(a, b, 10, 50);
  }
  void reds() {
    noStroke();
    fill(255, 0, 0);
    rect(n, m, 10, 50);
  }
  void move() {
    frameRate(100);
    if (keyPressed==true&& key=='s'&& up==false) {
      b++;
    }else if (keyPressed==true&& key=='w') {
      b--;
    }
    if (keyPressed==true&& key=='5'&& up==false) {
      m++;
    }else if (keyPressed==true&& key=='8') {
      m--;
    }
  }
  void restrict() {
    if (b<=0) {
      b=30;
    }
    if (b>=500) {
      b=480;
    }
  }
}
class ball {
  int x, y;
  boolean up, right,mode;
  ball() {
    x=int(random(500));
    y=int(random(29,500));
    up=true;
    right=true;
    mode=true;
  }
  void move() {
    if (right==true) {
      x++;
    }else {
      x--;
    }
    if (up==true) {
      y--;
    }else {
      y++;
    }
  }
  void show() {
    fill(255);
    noStroke();
    ellipse(x, y, 20, 20);
  }
  void bounce() {
    boolean gameOver=false;
    if (get(x+10, y)!=color(201, 32, 2)) {
      right=false;
    }
    else if (get(x-10, y)!=color(201, 32, 2)) {
      right=true;
    }
    if (get(x, y+10)!=color(201, 32, 2)) {
      up=true;
    }
    else if (get(x, y-10)!=color(201, 32, 2)) {
      up=false;
    }
    if(x>=475){
      x=250;
      scoreTwo=scoreTwo+1;
      gameOver=true;
    }  
    if(x<=25){
      x=250;
      score=score+1;
      gameOver=true;
    }
  }
}
  
  
