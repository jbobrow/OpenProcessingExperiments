
Bee Bee1;
Bee Bee2;
Bee Bee3;
Bee Bee4;
Bee Bee5;


color blue = color(0,227,250);
color white = color(224,252,255);

 
 
 
void setup() {
  size(400, 600, P2D);


  Bee1= new Bee(70, 0, 0, 0.2, 15);
  Bee2= new Bee(150, 0, 0, 0.5, 40);
  Bee3= new Bee(200, 0, 0, 1, 20);
  Bee4= new Bee(250, 0, 0, 1.5, 60);
  Bee5= new Bee(300, 0, 0, 2, 100);
  
}
 
void draw() {
  
  background(0);
  gradientRect(-5, -5, 500, 800, blue,white);
 
  Bee1.display();
  Bee1.move();
  Bee1.bounce();
 
  Bee2.display();
  Bee2.move();
  Bee2.bounce();
 
  Bee3.display();
  Bee3.move();
  Bee3.bounce();
  
  Bee4.display();
  Bee4.move();
  Bee4.bounce();
  
  Bee5.display();
  Bee5.move();
  Bee5.bounce();
  
}

 
 
void gradientRect(int x, int y, int w, int h, color c1, color c2) {
  beginShape();
  fill(c1);
    vertex(y+w,x);
  vertex(x+h,y+w);

  fill(c2);
  vertex(y,x+h);
  vertex(y,x);

  endShape();
}
 
 
 
class Bee {
  float x;
  float y;
  float speed;
  float gravity;
  float w;
 

Bee(float tempX, float tempY, float tempS, float tempG, float tempW) {
    x=tempX;
    y=tempY;
    speed=tempS;
    gravity=tempG;
    w=tempW;
  }

  void display() {
    stroke(0);
 

    noFill();
    strokeWeight(3);
    bezier(x-5, y-50, x-10, y-70, x-20, y-85, x-25, y-85);
    bezier(x+5, y-50, x+10, y-70, x, y-85, x-5, y-85);
    fill(0);
    noStroke();
    ellipse(x-25, y-85, 10, 10);
    ellipse(x-5, y-85, 10, 10);
    
    
    fill(250);
    bezier(x+45, y-5, x+100, y-10, x+70, y+50, x+20, y);
    fill(#F7FEFF);  
    bezier(x+40, y-10, x+90, y-70, x+110, y+10, x+30, y);
    

    fill(#FFCD00);
    ellipse(x, y+20, 65, 100);
    fill(#FFCD00);
    ellipse(x-5, y-20, 90, 90);
    

    fill(0);
    ellipse(x-22, y-31, 5,5);
    ellipse(x+10, y-20, 5,5);
    stroke(#b63521);
    strokeWeight(2);
    noFill();
    bezier(x-25, y-15, x-30, y-5, x-0, y, x+5, y-5);
    stroke(0);
    strokeWeight(12);
    bezier(x-35, y+15, x-25, y+25, x, y+40, x+35, y+25);
    strokeWeight(10);
    bezier(x-35, y+40, x-50, y+40, x-10, y+65, x+30, y+50);
  }
 
    void move() {
    y=+y+speed;
    speed=speed+gravity;
    }
 
    void bounce() {
      if (y>height) {
        speed=speed*-0.95;
      }
    }
  }
