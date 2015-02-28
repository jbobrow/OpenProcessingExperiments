
float start_x=30;
float start_y=10;
int i=0;
int n=0;

ArrayList<Human> humans;//居場所を作ってあげて

void setup(){
  size(640, 480);
  fill(102, 102, 102);
  rect(0,0,width,height);
  humans = new ArrayList();
}

void draw(){
  ArrayList<Human> dead = new ArrayList();
  
  background(50);
  fill(255);
  textSize(30);
  text("コミケ会場→",450,30);
  println(n);
  
  for(Human h : humans){
    h.draw();
    h.walk();
    if(h.x > width+50){
      dead.add(h);
      n--;
    }
  }
  
  for(Human h : dead){
    humans.remove(h);
  }

  if(random(1) < 0.25 ){
    n++;
    humans.add(new Human());
  }

}

class Human{
  int col;
  float x,y,sp;

  Human(){//newしたときにこれは必ず呼ばれる。コンストラクタ。
    this.x = random(-50);
    this.y = random(25,height-25);
    col = int(random(0,200));
    sp = random(1,5);
  }

  void draw(){
    stroke(255);
    line(x,y,x,y+80);
    line(x,y+25,x-25,y+50);
    line(x,y+25,x+25,y+50);
    line(x,y+80,x-25,y+80+25);
    line(x,y+80,x+25,y+80+25);
    fill(col);
    ellipse(x,y,50,50);
  }
  
  void walk(){
    x+=sp;
  }
}


