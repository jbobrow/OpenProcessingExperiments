
Shape c1;
Shape t1, t2, t3;
Shape r1;
Dog1 d1;
Sun s1;
Kite k1;

PImage a;
PImage h;
PImage rh;
PImage lh;
PImage bd;
PImage k;


void setup(){

  size(800, 800);
  smooth();
  frameRate(60);
  c1 = new Shape(200, 150, 150);
  t1 = new Shape(200, 150, 180, 100);
  t2 = new Shape(200, 150, -90, 150);
  t3 = new Shape(400, 500, 60, 100);
  d1 = new Dog1(700, 650);
  r1 = new Shape(0, 500, 200, width);
  s1 = new Sun(200, 450);
  k1 = new Kite(600, 250);
}

void draw(){

  background(150, 200, 190, 180);
  //c1.circle2();
  c1.scalecircle();
  t1.tri();
  t2.tri();
  t3.tri3();
  t1.update1();
  t2.update1();
  c1.update2();
  r1.rec();
  s1.head();
  s1.righthand();
  s1.lefthand();
  s1.body();
  s1.move();
  d1.display();
  d1.move();
  k1.update();
  k1.display();


}

void keyPressed(){
  if(key == 'a' || key == 'A'){
    background(150, 200, 190, 180);
    r1.rec();
    c1.scalecircle();
    t2.tri();
    t3.tri3();
    s1.head();
    s1.righthand();
    s1.lefthand();
    s1.body();
    k1.display();
    d1.display();
    t1.trirote1();
  }
  if(key == 'b' || key == 'B'){
    background(150, 200, 190, 180);
    r1.rec();
    c1.scalecircle();
    t2.tri();
    t3.tri3();
    s1.head();
    s1.righthand();
    s1.lefthand();
    s1.body();
    k1.display();   
    d1.display();
    t1.trirote2();
  }
  if(key == 'c' || key == 'C'){
    background(150, 200, 190, 180);
    r1.rec();
    c1.scalecircle();
    t1.tri();
    t3.tri3();
    s1.head();
    s1.righthand();
    s1.lefthand();
    s1.body();
    k1.display();  
    d1.display();
    t2.trirote1();
  }
  if(key == 'd' || key == 'D'){
    background(150, 200, 190, 180);
    r1.rec();
    c1.scalecircle();
    t1.tri();
    t3.tri3();
    s1.head();
    s1.righthand();
    s1.lefthand();
    s1.body();
    k1.display();  
    d1.display();
    t2.trirote2();
  }
  if(key == 'e' || key == 'E'){
    background(150, 200, 190, 180);
    r1.rec();
    c1.scalecircle();
    t1.trirote1();
    t3.tri3();
    s1.head();
    s1.righthand();
    s1.lefthand();
    s1.body();
    k1.display();  
    d1.display();
    t2.trirote2();
    t1.move1();
    t2.move1();
    c1.move1();
    t3.move2();
    
   
  }
  
  if(key == 'f' || key == 'F'){
    r1.rec();
    c1.scalecircle();
    t1.tri();
    t2.tri();
    t3.tri3();
    k1.display();  
    d1.display(); 
    background(0);
     for(int j = 1; j < height; j +=(height/30)){
      stroke(random(255),random(255), random(222));
      strokeWeight(8);
      line(0, j, width, j);
     }
    
    
     for(int i = 1; i < width; i += (width/30)){
      stroke(random(255),random(255), random(222));
      strokeWeight(8);
      line(i, 0, i, height);
     }
    
    s1.bodydance();
    s1.headdance();
    s1.rhdance();
    s1.lhdance();
    s1.move2();
    
    if(mousePressed == true){
      s1.jump();
    }
  }
  
  if(key == 'g' || key == 'G'){
    background(150, 200, 190, 180);
    r1.rec();
    c1.scalecircle();
    t1.tri();
    t2.tri();
    t3.tri3();
    s1.head();
    s1.righthand();
    s1.lefthand();
    s1.body();
    k1.display();
    d1.move();
    d1.update();
    d1.jumpdisplay();
    if(mousePressed == true){
      d1.jump();
    }
  }
  
  if(key == 'h' || key == 'H'){
     background(150, 200, 190, 180);
     r1.rec();
     c1.scalecircle();
     t1.tri();
     t2.tri();
     t3.tri3();
     s1.head();
     s1.righthand();
     s1.lefthand();
     s1.body();
     //k1.display();
     d1.display();
     k1.update2();
     k1.fly();
     k1.move();
     if(mousePressed == true){
      k1.jump();
    }
  }   

}




class Shape{

  float cx, cy;
  float r;
  float h, d;
  float angle = 1;
  float speed = 13;
  float xspeed = 12;
  float yspeed = 15;
  float a = 0.0;
  float s = 0.0;


  Shape(float xpos, float ypos, float rpos){
    cx = xpos;
    cy = ypos;
    r = rpos;
  }

  Shape(float xpos, float ypos, float hh, float dd){
    cx = xpos;
    cy = ypos;
    h = hh;
    d = dd;

  }


  void circle2(){
    stroke(50,90,10);
    strokeWeight(5);
    fill(220,60);
    ellipse(cx, cy, r, r);
    noStroke();
    fill(0, 20, 80);
    ellipse(cx, cy, r/2.5, r/2.5);
  }

  void tri(){
    noStroke();
    fill(200, 85, 100, 200);
    triangle(cx, cy, cx - d/2, cy + h, cx + d/2, cy + h);
  }

  void tri3(){
    float g;
    pushMatrix();
    translate(cx, cy);
    g = map(mouseY, 0, height, 0.5, 3);
    scale(g);
    noStroke();
    fill(0);
    triangle(0, 0-3*h, 0 - d/2, 0 - 2*h, 0 + d/2, 0 - 2*h);
    triangle(0, 0 -2*h, 0 - d/3, 0 - h, 0 + d/3, 0 - h);
    triangle(0, -h , 0 - d/4, 0 , 0 + d/4, 0);
    popMatrix();
  }

  void update1(){
    angle += speed;
  }
  void update2(){   
    a = a + 0.04;
    s = cos(a)*2;
  }
  

  void trirote1(){
    pushMatrix();
    translate(cx, cy);
    angle += speed;
    rotate(radians(angle));
    fill(200, 85, 100, 200);
    triangle(0, 0, 0 - d/2, 0 + h, 0 + d/2, 0 + h);
    popMatrix();
  }

  void trirote2(){
    pushMatrix();
    translate(cx, cy);
    angle = angle - 2;
    rotate(radians(angle));
    fill(200, 85, 100, 200);
    triangle(0, 0, 0 - d/2, 0 + h, 0 + d/2, 0 + h);
    popMatrix();
  }

  void scalecircle(){
    pushMatrix();
    translate(cx, cy);
    scale(s);
    stroke(50,90,10);
    strokeWeight(5);
    fill(220,60);
    ellipse(0, 0, r, r);
    noStroke();
    fill(0, 20, 80);
    ellipse(0, 0, r/2.5, r/2.5);
    popMatrix();
  }

  void jump(){
    if(mousePressed == true){
      cx = mouseX;
      cy = mouseY;
    }
  }

  void rec(){
    noStroke();
    fill(255, 0, 255, 120);
    rect(cx, cy, d, h);
  }
  
  void move1(){
    cy = cy + yspeed;
    if(cy > height || cy < 0){
     yspeed = -yspeed;
    } 
  }
    void move2(){
    cx = cx + xspeed;
    if(cx > width || cx < 0){
     xspeed = -xspeed;
    }
   } 

}

class Dog1{
  float lx;
  float ly;
  float speed = -5;
  float kx = 0.0;
  float ky = 0.0;


  Dog1(float xpos, float ypos){
    lx = xpos;
    ly = ypos;
  }

  void display(){
    float s;
    a = loadImage("dog.png");
    imageMode(CENTER);
    pushMatrix();
    translate(lx, ly);
    s = map(mouseX, 0, width, 0.5, 2);
    scale(s);
    image(a, 0, 0);
    popMatrix();
  }

  void move(){
    lx = lx + speed;
    if(lx < (0-a.width)){
      lx = width + a.width;
    }
  } 
  
   void update(){
    kx = kx + 1;
    ky = 7*cos(kx + 1);
  }
  
  void jump(){
   lx = mouseX;
   ly = mouseY;
 }

   void jumpdisplay(){
     a = loadImage("dog.png");
     pushMatrix();
     translate(lx, ly);
     imageMode(CENTER);
     image(a, 0, ky);
     popMatrix();
   }
     
}

class Sun{
  float lx;
  float ly;
  float speed = 5;
  float speedx = 18;
  float speedy = 20;
  float angle = 0.0;
  float a = 0.0;
  float s;
  

  Sun(float xpos, float ypos){
    lx = xpos;
    ly = ypos;
  }

  void head(){
    h = loadImage("head.png");
    imageMode(CENTER);
    image(h, lx, ly);
  }

  void righthand(){
    //h = loadImage("head.png");
    rh = loadImage("righthand.png");
    imageMode(CORNER);
    image(rh, lx, ly + (h.height/4));
  }

  void lefthand(){
    lh = loadImage("lefthand.png");
    imageMode(CORNER);
    image(lh, lx - lh.width, ly + (h.height/4));
  }

  void body(){
    bd = loadImage("body.png");
    imageMode(CENTER);
    image(bd, lx, ly + (h.height/4) + lh.height + bd.height/3);
  }

  void move(){
    lx = lx + speed;
    if(lx > width-110 || lx < lh.width/2 + h.width/2){
      speed = -speed;
    }
  }
  
  void move2(){
    lx = lx + speedx;
    ly = ly + speedy;
    if(lx > width-110 || lx < lh.width/2 + h.width/2){
      speedx = -speedx;
    }
    if(ly > height - 200 || ly < (h.height/2)){
      speedy = -speedy;
    }
  }
  
     
  
  void stop(){
    lx = lx + 0;
  }
  
  void update1(){
    angle += speed;
  }
  
 
 
 void bodydance(){
   pushMatrix();
   translate(lx, ly + (h.height/4) + lh.height + bd.height/3);
   angle += speed;
   rotate(angle);
   imageMode(CENTER);
   image(bd, 0, 0);
   popMatrix();
 }
 
 void headdance(){
   pushMatrix();
   translate(lx, ly);
   a = a + 0.04;
   s = cos(a)*1 + 0.5;
   scale(s);
   imageMode(CENTER);
   image(h, 0, 0);
   popMatrix();
 }
 
 void rhdance(){
   pushMatrix();
   translate(lx + lh.width/2, ly + (h.height/4) + (rh.height/2) );
   angle += speed;
   rotate(angle);
   imageMode(CENTER);
   image(rh, 0, 0);
   popMatrix();
 }
 void lhdance(){
   pushMatrix();
   translate(lx - lh.width/2, ly + (h.height/4) + (lh.height/2));
   angle += speed;
   rotate(-angle);
   imageMode(CENTER);
   image(lh, 0, 0);
   popMatrix();  
 }
 
 void jump(){
   lx = mouseX;
   ly = mouseY;
 }
}

class Kite{
  float xx;
  float yy;
  float kx = 0.0;
  float ky = 0.0;
  float fx = 0.0;
  float fy = 0.0;
  int r = 100;
  float theta = 0;
  float theta_vel = 0;
  float theta_acc = 0.001;
  float xspeed = 3;
  float yspeed = 5;
  
  Kite(float xpos, float ypos){
    xx = xpos;
    yy = ypos;
  }
  
  void update(){
    kx = kx + 1;
    ky = 3*cos(kx + 1);
  }
  
  void update2(){
    theta_vel += theta_acc;
    theta += theta_vel;
  }

  
  void display(){
    k = loadImage("kite.png");
    pushMatrix();
    translate(xx, yy);
    imageMode(CENTER);
    image(k, 0, ky);
    popMatrix();
  }
  
  void fly(){
   pushMatrix();
   translate(xx, yy);
   fx = r * cos(theta);
   fy = r * sin(theta);
   imageMode(CENTER);
   image(k, fx, fy);
   popMatrix();
  }
  
   void jump(){
   xx = mouseX;
   yy = mouseY;
 }
  
  void move(){
    xx = xx + xspeed;
    yy = yy + yspeed;
    if(xx > width - r -100 || xx < r+100){
      xspeed = -xspeed;
    }
    if(yy > height/2 - 50 || yy < r + 100){
      yspeed = -yspeed;
    }
  }

}
    







