
float xb, yb, angle, speed, grow,x3,y3,x2,y2;
float x1, y1, in, out, targetx, targety, x, y, d, d2, d3;
float easing = 0.02;
float r = random(20,80);
float rr = random(20,60);
float rrr = random(10,40);
Circle[] circle = new Circle[3];
Circle2[] circle2 =  new Circle2[100];
PFont futura;
int score, startTime;
float mx, my;
int f;


void setup() {
  background(0);
  size(600,600);
  redo();
  smooth();
  noCursor();
  futura = createFont("Futura", f);
  
}

void redo() {
  startTime = millis();
  out = 255;
  x1 = width/2;
  f = 25;
  y1 = height/2;
  x = width/2;
  y = height/2;
  xb = width/2;
  yb = height/2;
  speed = 1;

    for(int i = 0; i < 100; i++){
    circle2[i] = new Circle2();
    }
    for(int i = 0; i < 3; i++){
    circle[i] = new Circle();
    }
}

void draw() {
  rect(0,0,width,height);
  fill(0,0,0,40);
  counting();
  breath();
  player();
  d = dist(x,y, xb, height/2);
  d2 = dist(x,y, x2, y2);
  d3 = dist(x,y, x3, y3);
  if (score > 262){
    r = 30;
    rr = 30;
    rrr = 90;   
  }
  
  if (score > 513){
    r = 40;
    rr = 40;
    rrr = 105;   
  }
  
  if (score > 1023){
    r = 50;
    rr = 50;
    rrr = 115;   
  }
  
  if (d < grow/2) {
    in = 0;
    out += .05;
    if (out > 255) {
    out = 255;
    }
  }
  else{
    out--;
  }
  
  if (d2 < rrr/2) {
    out--;
  }
  
  if (d3 < rr/2 || d3 < r/2) {
    out--;
  }
  
  if (out > 1) {
    score = (millis()-startTime)/100;
    for(int i = 0; i <3; i++){
        circle[i].display();
        circle[i].go();
    }
   }
  
  
  if(out < 0){
    for(int i = 0; i < circle2.length; i++){
      circle2[i].run();
      circle2[i].spawn();
     }
    mx = mouseX;
    my = mouseY;
    cursor();
    textFont(futura);
    text ("CLICK", width/2 - 36, height/2);
    text ("retry", width/2 - 27, 330);
    }
    
}
  
   void mouseClicked() { 
   if (out < 0 && dist(mx,my,xb,yb) < height/2) {
   redo();
   }
   }

void player() {
  
  fill(255);
    targetx = x1;
  float dx = targetx - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  targety = y1;
  float dy = targety - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
  if (d > grow/2) {
    stroke(color(out, 0, in));
    strokeWeight(3);
  }
  ellipse(x, y, 33, 33);
  
  if (out < 0 && dist(x,y,width/2,height/2) < 30) {
   redo();
   }

}


void counting() {
  textFont(futura, f);
  text (score, 450, 40);
  
  if (out < 0) {
    f = 40;
  }
}

void keyPressed() {
  if (key == 'a') {
   x1 += -50;
  }
  
  if (key == 'w') {
   y1 += -50;
  }
  
  if (key == 'd') {
    x1 += 50;
  }
  
  if (key == 's') {
    y1 += 50;
  } 
}

void breath() {
  noStroke();
  angle += speed;
  grow = cos(radians(angle)) * 100 + width/2;
  xb = sin(radians(angle)) * 100 + height/2;
  fill(out, 0, in);
  ellipse(xb,yb,grow,grow);
}

class Circle {
    float xspeed;

 Circle(){
   x = random(620,900);
   y = random(20,580);
   xspeed = -1;
    }
    
  void display() {
    noStroke();
    ellipse(x3,y3,r,r);
    ellipse(x3,angle,rr,rr);
    ellipse(x2,y2,rrr,rrr);
    ellipse(x2,angle,r,r);
  }
  
  void go() {
  
    x3 = -tan(radians(angle)) * 80 + width/2;
    y3 = -sin(radians(angle)) * 80 + width/2;
    x2 = -tan(radians(angle)) * 105 + width/2;
    y2 = -cos(radians(angle)) * 50 + width/2;
    
    println(angle);
    
    x3 += xspeed;
    x2 += xspeed;
  }
}

class Circle2 {
  float xpos, ypos, rad, xspeed, yspeed;
  
  Circle2(){
    rad = random(20, 80);
    xpos += x;
    ypos += y;
    xspeed = random(-5,5);
    yspeed = random(-5,5);
    if (xspeed < 1 && xspeed > -1) {
      xspeed *= 3;
    }
    
    if (yspeed < 1 && yspeed > -1) {
      yspeed *= 3;
    }
  }
    
  void spawn(){
   noStroke();
   fill(255,0,0);
   ellipse (xpos,ypos,rad,rad);
  }

  void run(){
  xpos += xspeed * 2;
  ypos += yspeed * 2;
    }
}

