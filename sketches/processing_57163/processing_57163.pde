
PImage steve;
int[] data = new int [100];
//Variables***********
int nb = 12;
int sizeball = 150;
int big = 200;
//********************
Ball [] aBall = new Ball[nb];
Ball b;
int buffer;

void setup() {
   size(900, 750);
   imageMode(CENTER);
   b = new Ball(200);
   steve = loadImage("steve.png");
   for(int i=0; i<data.length; i++) data[i]=i;
   for (int i=0; i<nb; i++) {
     aBall[i] = new Ball(round(random(0, 50)));
   }
}

void draw(){
  
  background(255);
//  b.displayArray(data);
//  b.displayArrayImg(data, steve);
  
  for(int i=0; i<nb; i++){
    
    buffer = sizeball;
    if(i==nb-1){
      sizeball = big;
    }
    aBall[i].display();
    aBall[i].img2ball(steve);
    aBall[i].moveBall(-2.5,6,-3,6);
    sizeball = buffer;
  }
}

class Ball {
  int s;
  int x, y;
  color c;
  
  Ball(int _s){
    s = _s;
    x = 50;
    y = 50;
    c = color(254, 67, 22, 50);
  }
  void moveBall(float xmin, float xmax, float ymin, float ymax){
       movex(xmin, xmax);
       movey(ymin, ymax);    
  }
  void movex(float minim, float maxi) {   
    if(x<= 0) x = width-s;
    if(x>= width) x -= width;
    x += random(minim, maxi);
  }
   void movey(float minim, float maxi) {
    if(y<= 0) y = height -s;
    if(y>= height) y -= height;
    y += random(minim, maxi);
  }
  void display() {
    fill(c);
    ellipse(x, y, sizeball, sizeball);
  }
  void img2ball(PImage j) {
    image(j , x, y, sizeball, sizeball);  
  }
}

