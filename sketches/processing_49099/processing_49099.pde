
int x = 5;
int y = 110;
int[] numbers = new int[10];
ArrayList enemy = new ArrayList();
ArrayList bullet = new ArrayList();
ArrayList bomb = new ArrayList();
 
void addInto() {
    numbers[0] = width;
    for (int a = 1; a < numbers.length; a++) {   
        numbers[a] = numbers[a - 1] - width / numbers.length;
    }
}

void addEnemy(int s) {
  for (int a = 0; a < s; a++){
      enemy.add(new Enemy(random(600)+100,random(100)+100));
  }
}
 
void setup() {
  size(800, 250);
  frameRate(30);
  addInto();
  addEnemy(5);
}
 
void draw() {
  background(0);
   move();
    fill(255);    //stars
    for (int a = 0; a < numbers.length; a++) {
      ellipse(numbers[a],random(250),5,5);
  }
  for (int i = bullet.size()-1; i >= 0; i--) {
      bullet.get(i).draw();
      bullet.get(i).move();
      if (bullet.get(i).x1 > width ) {
      bullet.remove(i);
      }
    }
  for (int i = bomb.size()-1; i >= 0; i--) {
      bomb.get(i).draw();
      bomb.get(i).move();
      if (bomb.get(i).x1 > width ) {
      bomb.remove(i);
      }
    }
  for (int i = enemy.size()-1; i >= 0; i--) {
      enemy.get(i).draw();
      enemy.get(i).move();
      }
  fill (200);     //ship
  noStroke();
  quad(x,y,x+10,y+15,x,y+30,x+50,y+15); 
      }
 
void keyPressed() (
  if (keyCode == 40){
      y = y + 10;
  }
  else if (keyCode == 38){
      y = y - 10;
  }
  if (keyCode == 32){
      if (bullet.size() < 3) {
      bullet.add(new Bullet(x + 40, y + 12));
      }}  
  if (key == 'c') {
      if (bomb.size() < 1) {
          bomb.add(new Bomb(x + 50, y + 10));
      }}}
      
void move() { //stars
  for (int a = 0; a < numbers.length; a++) {
      numbers[a] -= 30;
      if (numbers[a] < 0) {
          numbers[a] = 800;
      }
  }
  if (y > 250) {
      y = -30;
  }
  if (y+30 < 0) {
      y = 250;
  }
}
 
 class Bullet {
   int x1;
   int y1;
   int speed = 30;
   
   Bullet(int a, int b) {
       x1 = a;
       y1 = b;
   }
   
   void draw() {
       fill(175, 203, 243)
       noStroke();
       rect(x1,y1,30,5);
   }
   
   void move() {
       x1 = x1 + speed;
   }}
 
class Bomb {
    int x1;
    int y1;
    int y2;
    double a = 0;
    int speed = 5;
    
    Bomb(int a, int b) {
       x1 = a;
       y1 = b;
       y2 = b;
   }
   void draw() {
       fill(random(255),random(255),random(255));
       noStroke();
       ellipse(x1,y1,20,60);
   }
   void move() {
       x1 = x1 + speed;
       y1 = y2 + 40 * sin(degrees(a));
       a += 0.1;
   }
}

class Enemy {
    int x1;
    int y1;
    int y2;
    double a = 0;

    Enemy(int a, int b) {
       x1 = a;
       y1 = b;
       y2 = b;
    }
    void draw() {
        fill (100,100,100);
        ellipse (x1,y1,50,50);
    }
    void move() {
        y1 = y2 + 40 * sin(degrees(a));
       a += 0.1;
    }
}
