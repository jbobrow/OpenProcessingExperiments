
ArrayList eyes;
int eyeWidth= 48;
int eyeHeight= 48;
float x= 0;
float y= 0;
float easing =.09;

void setup() {
  size(700, 700);
  frameRate(17);
  smooth();
  noStroke();

  eyes = new ArrayList();
  eyes.add(new Eye(width/2, 0, eyeWidth, eyeHeight));
}

void draw() {
  background(0);
  for (int i = eyes.size()-1; i >= 0; i--) { 
    Eye eye = (Eye) eyes.get(i);
    eye.move();
    eye.display();
    if (eye.finished()) {
      eyes.remove(i);
    }
  }  
}

void mousePressed() {
  eyes.add(new Eye(mouseX, mouseY, eyeWidth, eyeHeight));
}

class Eye {
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float h;
  float sleep = 300;
  
  Eye(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speed = 5;
    gravity = 0.1;
  }
  
    void move() {
    x += random(-2,2);
    speed += gravity;
    y += speed;
    if (y > height) {
      speed = speed*-0.8;
      y = height;
    }
  }
  
  boolean finished() {
    sleep--;
    if (sleep < 1) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
    colorMode(HSB,700,100,100);
    w = random(95,98);
    h = random(20,90);
    stroke(0,0,60,sleep);
    fill(0,0,100,sleep);
    ellipse(x,y,w,h);
    float mx = constrain(mouseX,x-w*1.6,x+w*1.6);
    float my = constrain(mouseY,y-h/3,y+h/3);
    x += (mx-x)*easing;
    y += (my-y)*easing;
    strokeWeight(2);
    stroke((x+y)/2,random(70,100),random(50,80),sleep);
    fill((x+y)/2,random(70,100),random(50,100),sleep);
    ellipse(x+(mx-x)/16,y+(my-y)/15,30+w/10,h-h/5);
    noStroke();
    fill(0,0,0,sleep);
    ellipse(x+(mx-x)/10,y+(my-y)/5,10+w/17,35-h/12);
  }
}  

