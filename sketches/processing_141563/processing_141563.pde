
MrBat myMrBat;

void setup() {
  frameRate(25);
  size(800, 600);
  background(0);
  smooth();
  myMrBat=new MrBat(width* 1.05,height*1.05);
}

void draw() {
  background(0);
  if(myMrBat != null){
    myMrBat.display();
    myMrBat.move();
  }
  
}

class MrBat {
  float bodyR;
  float bodyG;
  float bodyB;
  float eyeR;
  float eyeG;
  float eyeB;
  int x;
  int y;
  int speed;

  MrBat(int cx, int cy) {
    x=cx;// center x of bat body
    y=cy;// center y of bat body 
    bodyR=random(50, 100);
    bodyG=random(50, 100);
    bodyB=random(50, 100);
    eyeR=random(175, 215);
    eyeG=random(100, 150);
    eyeB=50;
    speed=int (random(10,15));
  }


  void display() {
    ellipseMode(CENTER); 

    noStroke();
    fill(bodyR, bodyG, bodyB);

    ellipse(x, y, 40, 40);
    triangle(x+10, y, x+50, y-30, x+90, y-10);// main right wing
    triangle(x-90, y-10, x-10, y, x-50, y-30);// main left wing
    triangle(x+90, y-10, x+90, y, x+60, y-10); //sub right wing A
    triangle(x+65, y-10, x+65, y+10, x+40, y-10); //sub right wing B
    triangle(x+45, y-10, x+45, y+10, x+15, y); //sub right wing C
    triangle(x-90, y-10, x-90, y, x-60, y-10); // sub left wing A
    triangle(x-65, y-10, x-65, y+10, x-40, y-10); // sub left wing B
    triangle(x-45, y-10, x-45, y+10, x-15, y); // sub left wing C
    triangle(x-20, y-5, x-20, y-30, x-10, y-15); // left ear
    triangle(x+10, y-15, x+20, y-30, x+20, y-5); // right ear

    fill(eyeR, eyeG, eyeB);
    ellipse(x-10, y, 10, 20); // left eye
    ellipse(x+10, y, 10, 20); // right eye
  }
  
  void move(){
    y--;
    x--;
    /*if (cy>=height || cx>=width){
     cy= cy-speed;
      cx=cx+speed;
  }*/
  
  }
}




