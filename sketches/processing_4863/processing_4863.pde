
int x = 3;
int y = 1;
int s = 1;
int m = 1;
int n = 1;
int speed = 1;
int speed2 = 2;
int speed3 = 3;

void setup(){
  size(600,600);
  smooth();
  fill(50,50);
}

//draw stuff
void draw(){
  background (0);
  rect(300,0, 600, 600);
  capsule(x+170,200,100);
  capsule(m+100,80,50);
  capsule(x+95,400,300);

  capsule2(n + 120,100,17);
  capsule2(m + 85,250,25);

  capsule3(n + 450,400,200);
  capsule3(x + 330,3,65);
  
  move();
  if((x > width+100) || (x < 1-100)){
    speed = -speed; 
  }

  move2();
  if((m > width+100) || (m < 1-100)){
    speed2 = -speed2; 
  }
  
    move3();
  if((n > width+100) || (n < 1-100)){
    speed3 = -speed3; 
  }
}

//move things
void move(){
  x = x + speed;
}

void move2(){
  m = m + speed2;
}

void move3(){
  n = n + speed3;
}

//define capsule
void capsule (int x, int y, int s){
  rectMode(CENTER);
  rect(x+.5, y, s, s);
  ellipse(x, y-s/2,s,s);
  ellipse(x, y+s/2,s,s);
}
  
  void capsule2 (int x, int y, int s){
  rectMode(CENTER);
  rect(m+.5, y, s, s);
  ellipse(m, y-s/2,s,s);
  ellipse(m, y+s/2,s,s);
}

  void capsule3 (int x, int y, int s){
  rectMode(CENTER);
  rect(n+.5, y, s, s);
  ellipse(n, y-s/2,s,s);
  ellipse(n, y+s/2,s,s);
}



