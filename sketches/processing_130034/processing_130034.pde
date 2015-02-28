
float y = 250;
float grav = 0;
boolean lose = false;
block block1;
block block2;
block block3;
block block4;
block block5;
block block6;
block block7;
block block8;
block block9;
block block10;
block block11;
block block12;
void setup(){
  size(500,500);
  block1 = new block();
  block2 = new block();
  block3 = new block();
  block4 = new block();
  block5 = new block();
  block6 = new block();
  block7 = new block();
  block8 = new block();
  block9 = new block();
  block10 = new block();
  block11 = new block();
  block12 = new block();
}
void draw(){
  background(0,120,240);
  block1.run();
  block2.run();
  block3.run();
  block4.run();
  block5.run();
  block6.run();
  block7.run();
  block8.run();
  block9.run();
  block10.run();
  block11.run();
  block12.run();
  if(lose == false){
    fill(255);
    y += grav;
    if(keyPressed == true){
      grav -= 0.4;
    }
    if(y > 470){
      lose = true;
    }else{
      grav += 0.2;
    }
    ellipse(100,y,20,20);
  }
}

class block{
  float x1 = random(300,500);
  float y1 = random(450);
  float speed = 1;
  float w = random(100);
  float h = random(100);
  void display(){
    x1 -= speed;
    rect(x1,y1,w,h);
  }
  void redo(){
    if(x1 < 10){
      speed += 0.1;
      x1 = 500;
      y1 = random(50,450);
      w = random(100);
      h = random(100);
    }
  }
  void touch(){
    if(100 > x1 && 100 < x1 + w && y > y1 && y < y1 + h){
      lose = true;
    }
  }
  void run(){
    touch();
    redo();
    display();
  }
}


