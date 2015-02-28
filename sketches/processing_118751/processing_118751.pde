
/* @pjs preload= "sedan.png"; */
Car car;
Dash dash1;
Dash dash2;
Dash dash3;
Dash dash4;
Dash dash5;
Tree tree1;
Tree tree2;
Tree tree3;
Tree tree4;
Tree tree5;
Tree tree6;
Tree tree7;
Tree tree8;
Tree tree9;
Tree tree10;
Tree tree11;
Tree tree12;
Cloud cloud1;
Cloud cloud2;
Cloud cloud3;
Cloud cloud4;
Cloud cloud5;
Cloud cloud6;
Cloud cloud7;
Cloud cloud8;
Cloud cloud9;
Cloud cloud10;

void setup(){
  size(720,240);
  smooth();
  
  //create the lines on the road
  dash1 = new Dash(0);
  dash2 = new Dash(width/4);
  dash3 = new Dash(-width/4);
  dash4 = new Dash(-width/2-30);
  
  //create the clouds
  cloud1 = new Cloud();
  cloud2 = new Cloud();
  cloud3 = new Cloud();
  cloud4 = new Cloud();
  cloud5 = new Cloud();
  cloud6 = new Cloud();
  cloud7 = new Cloud();
  cloud8 = new Cloud();
  cloud9 = new Cloud();
  cloud10 = new Cloud();
  
  //create the trees
  tree1 = new Tree();
  tree2 = new Tree();
  tree3 = new Tree();
  tree4 = new Tree();
  tree5 = new Tree();
  tree6 = new Tree();
  tree7 = new Tree();
  tree8 = new Tree();
  tree9 = new Tree();
  tree10 = new Tree();
  tree11 = new Tree();
  tree12 = new Tree();
  
  //create the car
  car = new Car("sedan.png", 0, 25, 400, 132);
}

float j = random(4);
float z = random(5);

void draw(){
  float mid = width/2;
  float cen = height/2;
  background(0,135,218); 
  translate(mid, cen);
  
  //draw and move the road
  drawRoad();
  dash1.move();
  dash1.display();
  dash2.move();
  dash2.display();
  dash3.move();
  dash3.display();
  dash4.move();
  dash4.display();
  
  //draw and move the clouds
  cloud1.move();
  cloud1.display();
  cloud2.move();
  cloud2.display();
  cloud3.move();
  cloud3.display();
  cloud4.move();
  cloud4.display();
  cloud5.move();
  cloud5.display();
  cloud6.move();
  cloud6.display();
  if (j>3){
    cloud7.move();
    cloud7.display();
    cloud8.move();
    cloud8.display();
  }
  if (j>3.5){
    cloud9.move();
    cloud9.display();
  }
  if (j>3.75){
    cloud10.move();
    cloud10.display();
  }  
   
  //draw and move the trees
  tree1.move();
  tree1.display();
  tree2.move();
  tree2.display();
  tree3.move();
  tree3.display(); 
  tree4.move();
  tree4.display(); 
  tree5.move();
  tree5.display(); 
  tree6.move();
  tree6.display();
  if (z>3){
    tree7.move();
    tree7.display();
    tree8.move();
    tree8.display();
  }
  if (z>4){
    tree9.move();
    tree9.display(); 
    tree10.move();
    tree10.display(); 
  }
  if (z>4.5){
    tree11.move();
    tree11.display(); 
  }
  if (z>4.75){
    tree12.move();
    tree12.display();
  }
  
  //draw and move the car
  car.sway();
  car.display();  
}

void drawRoad(){
  rectMode(CENTER);
  
  //shoulder
  noStroke();
  fill(176,165,88);
  rect(0, height/4, width, height/2);
  
  //asphalt
  fill(153,150,161);
  rect(0, height/4+9, width+20, height/2 - 32);
  strokeWeight(1);
  
  //edges
  fill(245,246,250);
  rect(0,32,width,4);
  rect(0, height/2-15, width, 4);
}

class Car {
  float w;
  float h;
  float xpos;
  float ypos;
  float angle;
  float wheelX1;
  float wheelX2;
  float wheelY1;
  float wheelY2;
  PImage carShape;
  float yoffset = 0.0;
  
  Car(String shapeName, float tempX, float tempY, float sizeX, float sizeY){
    carShape = loadImage(shapeName);
    w = sizeX;
    h = sizeY;
    xpos = tempX;
    ypos = tempY;
    wheelX1 = tempX + width/6 + 3;
    wheelY1 = tempY + height/7;
    wheelX2 = tempX - width/6+11;
    wheelY2 = tempY + height/7 +3;
    angle = random(0,TWO_PI);    
  }
  
  void sway(){
    angle += 0.05;
    yoffset = sin(angle)*3;  
  }
  
  void display(){
    imageMode(CENTER);
    
    //brake light
    stroke(0);
    strokeWeight(2);
    fill(237,131,154);
    quad(-width/4 - 15, ypos + yoffset, -width/4 +15, ypos +yoffset, -width/4 +15, ypos-30 +yoffset, -width/4-12, ypos-30+yoffset);
    strokeWeight(1);
    fill(213,62,106);
    quad(-width/4 - 15, ypos + yoffset, -width/4 +15, ypos +yoffset, -width/4 +15, ypos-12 +yoffset, -width/4-15, ypos-12+yoffset);
    
    //head light
    noStroke();
    fill(255,204,64);
    quad(width/5+20, ypos -15 +yoffset, width/5+42, ypos-8+yoffset, width/5+52, ypos+yoffset + 20, width/5+20, ypos+yoffset +20);
    stroke(0);
    fill(221,112,11);
    quad(width/5+20, ypos -15 +yoffset, width/5+33, ypos-8+yoffset, width/5+33, ypos+yoffset + 20, width/5+20, ypos+yoffset +20);
    
    //tinted windows
    noStroke();
    fill(120,200);
    quad(-width/5, ypos+yoffset, width/6, ypos+yoffset, width/25, ypos+yoffset - 60, -width/7, ypos+yoffset-60);
        
    //car body
    image(carShape, xpos, ypos + yoffset, w, h);    
   
    //wheels
    fill(217,227,208);
    ellipse(wheelX1, wheelY1 + yoffset, 48, 46);
    ellipse(wheelX2, wheelY2 + yoffset, 48, 46);
        
    //rotate wheel lines
    stroke(0);
    pushMatrix();
    translate(wheelX1, wheelY1+yoffset);
    rotate(angle*4);
    line(0,23,0,-23);
    line(-24,0,24,0);
    popMatrix();
    pushMatrix();
    translate(wheelX2, wheelY2+yoffset);
    rotate(angle*4);
    line(0,23,0,-23);    
    line(-24,0,24,0);
    popMatrix();
  }
}

class Dash { 
  float xpos;
  float ypos = height/4+6;
  float w = 25;
  float h = 5;
  float speed = 4.25;

  Dash(float tempXpos) {
    xpos = tempXpos;
  }

  void display() {
    fill(255,234,151);
    rectMode(CENTER);
    rect(xpos,ypos,w,h);
  }

  void move() {
    xpos = xpos - speed;
    if (xpos < -width/2-w) {
      xpos = width/2+w;
    }
  }
}

class Tree{
  float xpos;
  float ypos;
  float w;
  float h;
  float speed = 4;
  float r;
  float g;
  float b;
  float k = random(5);
  
  Tree(){
    xpos = random(-width/2, width/2);
    ypos = random(8, 23);
    w = random(10,25);    
    if (w<17){
      h = 1.618*w*random(1,3);
    } else {
      h = 1.618*w*random(1.5,2.5); 
    }
  }
  
  void display(){
    noStroke();
    
    //trunk
    fill(143,114,87);
    //rect(xpos, ypos-3*h/8, w/2, 7*h/4);
    rect(xpos, ypos-5*h/16, w/2, 5*h/8);
    
    //leaves
    if (k>0){
      r = 71;
      g = 135;
      b = 25;
    }     
    fill(r,g,b);
    triangle(xpos, ypos-h, xpos-w, ypos-h/6, xpos+w, ypos-h/6);    
  }
  
  void move(){
    xpos = xpos - speed;
    if (xpos < -width/2-2*w) {
      xpos = width/2+w;
    }
  }
}

class Cloud{
  float xpos;
  float ypos;
  float r;
  float speed;
  float c;
  float c1 = random(125,150);
  float c2 = random(150, 175);
  float c3 = random(175, 225);
  float k = random(6);
  float v;
  
  Cloud(){
    xpos = random(-width/2, width/2);
    ypos = random(-3*height/8, -height/4);
    r = random(10,40);
  }
  
  void display(){
    noStroke();
    v = map(r, 10, 40, 1.5, 1);
    if (k>5){
      c = c1;
      speed = 2*v;
    } else if (k>4){
      c = c2;
      speed = 2.25*v;
    } else {
      c = c3;
      speed = 2.5*v;
    }
    fill(c);
    ellipse(xpos, ypos, 2*r, 2*r);
    ellipse(xpos+3*r/4, ypos+r/4, 3*r/2, 3*r/2);
    ellipse(xpos-3*r/4, ypos+r/4, 3*r/2, 3*r/2);     
    
  }
  
  void move(){
    xpos = xpos - speed;
    if (xpos < -width/2 - 9*r/2) {
      xpos = width/2 +9*r/2;
    }
  }
} 


