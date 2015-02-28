
PFont futura;
PImage coffee;
PImage cart;
float xbound,ybound,xbound1,ybound1,x,y,a,b;
float xbound2,ybound2,xbound3,ybound3,yybound3,xbound4,ybound4,xbound5,ybound5,xbound6,ybound6,xbound7,ybound7;
float xbound8, ybound8, xbound9, ybound9,xbound10,xbound11,ybound10,ybound11;
float targetx;
float easing = 0.08;
float easing2 = 0.06;
float tr,tr2,tr3,tr4,aa,bb;
float boundx, boundy,boundx1,boundy1;
boolean go, rev, react,motion,back;
float m;
int  d,recall;

int x2,x3,x4,x5,x6,x7,x8,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21;

void setup() {
  size(820,730);
  smooth();
  noStroke();
  futura = createFont("Futura", 28);
  coffee = loadImage("Coffee2.png");
  cart = loadImage("Cart.png");
  x = 180;
  y = height/2 - 70;
  a = 230;
  b = height/2 - 122;
  tr = 0;
  go = false;
  rev = false;
  react = false;
  motion = false;
  back = false;
  recall = 0;
  m = 0;
  tr2 = 0;
  d = 0;
  tr3 = 0;
  tr4 = 255;
  x2 = 0;
  x3 = 0;
  x4 = 0;
  x5 = 0;
  x6 = 0;
  x8 = 0;
  x11 = 0;
  x12 = 0;
  x13 = 0;
  x14 = 0;
  x15 = 0;
  x16 = 0;
  x17 = 0;
  x18 = 0;
  x19 = 0;
  x20 = 0;
  x21 = 0;
  aa = 0;
  bb = 0;
}


void draw() {
  
  
  xbound = a;
  ybound = b;
  xbound1 = a + 130;
  ybound1 = b + 48;
  
  xbound2 = a + 379;
  ybound2 = b + 83;
  xbound3 = a;
  ybound3 = b - 280 + m;
  yybound3 = b - 80;
  
  xbound4 = a + 379;
  ybound4 = b + 53 + m;
  xbound5 = a + 30;
  ybound5 = b - 50 - m;
  
  xbound6 = a;
  ybound6 = b;
  xbound7 = a + 130;
  ybound7 = b - 160;
  
  xbound8 = xbound2;
  ybound8 = ybound2 + 125;
  xbound9 = a - 121;
  ybound9 = b - 206;
  
  xbound10 = width/2 + 186;
  ybound10 = 0;
  xbound11 = width;
  ybound11 = height;
  
  boundx = a - 190 - x8;
  boundy = b - 190 - x8;
  boundx1 =  a + 509 + (x8* 2);
  boundy1 = b + 425 + (x8* 2);
  
  fill(255);
  rect(xbound8,ybound8,xbound9,ybound9);
  noFill();
  
  background(255);
  image(coffee, aa, bb);
  
  noFill();
  stroke(255);
  strokeWeight(380);
  
  rect(boundx,boundy, boundx1,boundy1);
  noStroke();
  
  fill(0,tr3);
  rect(xbound6,ybound6,xbound7,ybound7);
  noFill();
  
  
  fill(0,x11);
  rect(xbound10 - x11,ybound10,xbound11,ybound11);
  noFill();
  
  textFont(futura, 18);
  fill(255,x13);
  text("Bean Type: Medium Roast", a + 560 - x12, b -180);
   fill(255,x14);
  text("Location: North California", a + 560 - x13, b -130);
   fill(255,x15);
  text("Expiration: 10/30/12", a + 560 - x14, b -80);
   fill(255,x16);
  text("Shipping Time: 2 Weeks", a + 560 - x15, b - 30);
   fill(255,x17);
  text("Delivery Method: FedEx", a + 560 - x16, b + 20);
   fill(255,x18);
  text("Phone Number: 415.112.3581", a + 560 - x17, b + 70);
   fill(255,x19);
  text("Email: admin@oromo.com", a + 560 - x18, b + 120);
   fill(255,x20);
  text("Website: www.oromo.com", a + 560 - x19, b + 170);
  fill(255,x21);
  text("Produce Status: Available", a + 560 - x20, b + 220);
  noFill();
      
  
  if(x < xbound1 + 180) {
    fill(255,tr);
  }
  else {
    fill(10);
  }
  
  textFont(futura);
  text("Medium Roast", x + x2, y);
  
  
  if (rectCircleIntersect(xbound, ybound, xbound1, ybound1, mouseX, mouseY, 0)) {
  go = true;
  }
  
  else{
  go = false;
  }
  
    if(react) {
     movementForward();
     tr3 += -10;
     tr4 += -2.5;
     if(x > targetx - 50) {
      fill(100,tr2);
      textFont(futura, 18);
      text("max quantity: 300lbs", xbound2 + x3, ybound2);
      text("min quantity: 30lbs", xbound2 + x4, ybound2 + 25);
      noFill();
      
      image(cart, xbound2 + x5, ybound2 + 125 - d);
      
      fill(255);
      rect(xbound4,ybound4,xbound5,ybound5);
      noFill();
      
      fill(255,tr4);
      rect(xbound2,ybound2,xbound3,yybound3);
      noFill();
      
      println(x15);
      
      m += x/100;
      tr2 += 5;
      if (m > b - 50) {
      m = b - 50;
      
      if (rectCircleIntersect(xbound8, ybound8, xbound9, ybound9, mouseX, mouseY, 0)) {
  if (mousePressed) {
    d = 4;
      }
      else {
        d = 0;
      }
     }
      
      }
  if (ybound5 < 1) {
    ybound5 = 1;
  }
     }
   }
  
  if(!react) {
  if (go) {
    rev = true;
    movement();
   }
   
   if (rev && !go) {
     tr+= -10;
     tr3+= -10;
     movementBack();
   }
  }
  
  if (motion) {
    click();
  }
   
   if (tr < 0) {
     tr = 0;
   }
   if (tr > 255) {
     tr = 255;
   }
   if (tr2 > 255) {
     tr2 = 255;
   }
   if (tr3 < 0) {
     tr3 = 0;
   }
   if (tr3 > 84) {
     tr3 = 84;
   }
    if (tr4 < 0) {
     tr4 = 0;
   }
   if (tr4 > 255) {
     tr4 = 255;
   }
   
   if (x11 < 0) {
     x11 = 0;
   }
   if (x11 > 255) {
     x11 = 255;
   }
   if (x12 > 255) {
     x12 = 255;
   }
   if (x12 < 0) {
     x12 = 0;
   }
   if (x13 > 255) {
     x13 = 255;
   }
    if (x13 < 0) {
     x13 = 0;
   }
   if (x14 > 255) {
     x14 = 255;
   }
     if (x14 < 0) {
     x14 = 0;
   }
     if (x15 < 0) {
     x15 = 0;
   }
   if (x15 > 255) {
     x15 = 255;
   }
   if (x16 > 255) {
     x16 = 255;
   }
   if (x16 < 0) {
     x16 = 0;
   }
   if (x17 > 255) {
     x17 = 255;
   }
    if (x17 < 0) {
     x17 = 0;
   }
   if (x18 > 255) {
     x18 = 255;
   }
     if (x18 < 0) {
     x18 = 0;
   }
   if (x19 > 255) {
     x19 = 255;
   }
     if (x19 < 0) {
     x19 = 0;
   }
   if (x20 > 255) {
     x20 = 255;
   }
   if (x20 < 0) {
     x20 = 0;
   }
   if (x21 > 255) {
     x21 = 255;
   }
    if (x21 < 0) {
     x21 = 0;
   }
    
   if (x5 > 1000) {
     x2 = 1000;
     x3 = 1000;
     x4 = 1000;
     x5 = 1000;
   }
   
   if (back) {
   restart();
   }

  if(recall == 100) {    
   x = 180;
   y = height/2 - 70;
   a = 230;
   b = height/2 - 122;
   
   tr = 0;
   m = 0;
   tr2 = 0;
   d = 0;
   tr3 = 0;
   tr4 = 255;
   
  aa = 0;
  bb = 0;
  }
  }

boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {
 
  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);
 
  if (circleDistanceX > (rw/2 + cr)) { return false; }
  if (circleDistanceY > (rh/2 + cr)) { return false; }
  if (circleDistanceX <= rw/2) { return true; }
  if (circleDistanceY <= rh/2) { return true; }
 
  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
}

void movement() {
  tr += 20;
  tr3 += 10;
  targetx = a + 50;
  float dx = targetx - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
}

void movementBack() {
  targetx = a - 50;
  float dx = targetx - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
}

void movementForward() {
  targetx = a + 380;
  float dx = targetx - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
}

void click() {
   
  targetx = x2 + 293;
  float dx = targetx - x2;
  if(abs(dx) > 1) {
  x2 += dx * easing;
  }
  
  if (x2 > 100) {
    click2();
  }
 }
 
 void click2() {
    targetx = x3 + 293;
  float dx = targetx - x3;
  if(abs(dx) > 1) {
  x3 += dx * easing;
  }
   if (x3 > 100) {
    click3();
  }
 }
 
  void click3() {
    targetx = x4 + 293;
  float dx = targetx - x4;
  if(abs(dx) > 1) {
  x4 += dx * easing;
  }
  
  if (x4 > 200) {
    click4();
  }
 }
 
  void click4() {
    targetx = x5 + 293;
  float dx = targetx - x5;
  if(abs(dx) > 1) {
  x5 += dx * easing;
  }
  if (x5 > 50) {
    click5();
  }
 }
 
 void click5() {
   targetx = 262;
  float dx = targetx - x8;
  if(abs(dx) > 1) {
  x8 += dx * easing2;
  }
  if (x8 > 244) {
    click6();
  }
 }
 
 void click6() {
   targetx = 100;
  float dx = targetx - x11;
  if(abs(dx) > 1) {
  x11 += dx * easing2;
  }
  if (x11 > 20) {
    click7();
  }
 }
 
  void click7() {
   targetx = 265;
  float dx = targetx - x12;
  if(abs(dx) > 1) {
  x12 += dx * easing2;
  }
   if (x12 > 60) {
    click8();
  }
 }
 
  void click8() {
   targetx = 265;
  float dx = targetx - x13;
  if(abs(dx) > 1) {
  x13 += dx * easing2;
  }
   if (x13 > 60) {
    click9();
  }
 }
 
  void click9() {
   targetx = 265;
  float dx = targetx - x14;
  if(abs(dx) > 1) {
  x14 += dx * easing2;
  }
   if (x14 > 60) {
    click10();
  }
 }
 
  void click10() {
   targetx = 265;
  float dx = targetx - x15;
  if(abs(dx) > 1) {
  x15 += dx * easing2;
  }
   if (x15 > 60) {
    click11();
  }
 }
 
 void click11() {
   targetx = 265;
  float dx = targetx - x16;
  if(abs(dx) > 1) {
  x16 += dx * easing2;
  }
   if (x16 > 60) {
    click12();
  }
 }
 void click12() {
   targetx = 265;
  float dx = targetx - x17;
  if(abs(dx) > 1) {
  x17 += dx * easing2;
  }
   if (x17 > 60) {
    click13();
  }
 }
 void click13() {
   targetx = 265;
  float dx = targetx - x18;
  if(abs(dx) > 1) {
  x18 += dx * easing2;
  }
   if (x18 > 60) {
    click14();
  }
 }
 void click14() {
   targetx = 265;
  float dx = targetx - x19;
  if(abs(dx) > 1) {
  x19 += dx * easing2;
  }
   if (x19 > 60) {
    click15();
  }
 }
 void click15() {
   targetx = 265;
  float dx = targetx - x20;
  if(abs(dx) > 1) {
  x20 += dx * easing2;
  }
   if (x20 > 60) {
    click16();
  }
 }
 
 void click16() {
   targetx = 265;
  float dx = targetx - x21;
  if(abs(dx) > 1) {
  x21 += dx * easing2;
  }
 }
 
 void restart() {
   
   recall++;
   
   x11 += -20;
   x12 += - 12/1.6;
   x13 += - 14/1.6;
   x14 += - 16/1.6;
   x15 += - 18/1.6;
   x16 += - 20/1.6;
   x17 += - 22/1.6;
   x18 += - 24/1.6;
   x19 += - 26/1.6;
   x20 += - 28/1.6;
   x21 += - 30/1.6;
   
   if (x21 < 200) {
     x8 += -15.5;
   }
   
   if (boundx < xbound + 190) {
     boundx = xbound  + 190;
   }
   if (boundy < ybound + 190) {
     boundy = ybound  + 190;
   }
    if (boundx1 < xbound1 + 190) {
     boundx1 = xbound1  + 190;
   }
   if (boundy1 < ybound1 + 190) {
     boundy1 = ybound1  + 190;
   }
 }
 
 

void mouseClicked() {
  if (rectCircleIntersect(xbound, ybound, xbound1, ybound1, mouseX, mouseY, 0)) {
    react = true;
  }
  
  if(react) {
  if (rectCircleIntersect(xbound8, ybound8, xbound9, ybound9, mouseX, mouseY, 0)) {
    motion= true;
   }
  }
  if(motion && x15 > 5) {
  if (rectCircleIntersect(0,0, 512, height, mouseX, mouseY, 0)) {
    back= true;
   }
  }
}





