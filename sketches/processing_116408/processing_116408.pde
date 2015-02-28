
int card = 0;
PFont f;
PImage i1,i2,i3,i4,i5,i6,i7,i8;
int x = 669;
int y = 10;
int w = 30;
int h = 30;
float t, u;
float angle = 0;
float a = 600;
float b = 5;
float bx = 80;
float by = 80;
float speedX = 1;
float speedY = 0;

void setup() { 
  size(709,539); 
  f = loadFont("YDIYGO130-KSCPC-EUC-H-20.vlw");
  i1 = loadImage("10.png"); 
  i2 = loadImage("0.png"); 
  i3 = loadImage("3.png"); 
  i4 = loadImage("5.png"); 
  i5 = loadImage("2.png"); 
  i6 = loadImage("6.png"); 
  i7 = loadImage("4.png");
  i8 = loadImage("7.png");
  textFont(f);
  smooth(); 
  noStroke();
  frameRate(10);
  bx = width/2;
  by = height/2;
} 
 
void draw() { 
  if (card == 0) { 
    background(0); 
    image(i1,0,0); 
    fill(255); 
    text("Welcome to",50, 80); 
    text("our restaurant♥",53, 105); 
    fill(255);
    rect (319,280,20,30);
    triangle(309,310,349,310,329,340);
    fill(100,30,13); 
    rect (299,349,60,130);
  } 
  else if (card == 1) { 
    background(0); 
    image(i2,0,0); 
    fill(255); 
    text("MENU",50,255); 
    fill(255);
    rect (x,y,w,h);
    fill(255,0,0);
    rect(50,300,100,30);
    fill(255,100,0);
    rect(170,300,100,30);
    fill(230,230,0);
    rect(50,350,100,30);
    fill(0,150,0);
    rect(170,350,100,30);
    fill(0,0,230);
    rect(50,400,100,30);
    fill(130,20,230);
    rect(170,400,100,30);
  } 
 
  else if (card  == 2) { 
    frameRate(10);
    image(i3,0,0); 
    fill(255); 
    text("PIZZA",40,75); 
    text("Sharing in a friendly,",40,110); 
    text("and blossom friendship",40,135); 
    rect (x,y,w,h);
    fill(random(255),random(255),random(255),100);
    triangle(mouseX-100,mouseY,mouseX+100,mouseY,mouseX,mouseY+160);
} 

  else if (card  == 3) { 
    frameRate(10);
    background(0);
    image(i4,0,0); 
    fill(255); 
    text("SPAGHETTI",40,75);
    text("Ggumul,",40,110); 
    text("Ggumul,",40,135); 
    text("Ggumul,",40,160); 
    text("Ggumul,",40,185); 
    text("Ggumul,",40,210); 
    text("I would go inside",40,245); 
    text("your mouth",40,270); 
    rect (x,y,w,h);
    noFill();
    for (int xx=0; xx<width; xx=xx+100) {
     for (int yy=0; yy<height; yy=yy+100) {
  stroke(random(255),random(255),random(255));
  ellipse(xx,yy,mouseX,mouseY);
  noStroke();
 }
}} 
 
  else if (card  == 4) { 
    frameRate(50);
    ellipseMode(CORNER);
    background(random(150),0,0);
    image(i5,0,0); 
    fill(255); 
    text("STEAK",480,75);
    text("Knife,",480,110); 
    text("Fork,",480,135); 
    text("and YOU",480,160); 
    rect (x,y,w,h);
    fill(210,0,0);
    ellipse(bx, by, 80, 80);
    speedY = speedY + 0.5;
    bx = bx + speedX;
    by = by + speedY;
    if ((bx > width - 80) || (bx <= 0)) {
      speedX = -speedX;
    }
    if (by > height - 80) {
      by = height - 80;
      speedY = speedY * -0.9;
    }
    else if (by <= 0) {
      speedY = -speedY;
    }
} 

  else if (card  == 5) { 
    image(i6,0,0); 
    fill(255);
    text("SANDWICH",480,75); 
    text("Pile,",480,110); 
    text("Pile,",480,135); 
    text("Pile,",480,160); 
    text("Pile,",480,185); 
    text("and EAT!!",480,220); 
    rect (x,y,w,h); 
    if ((mouseX > 0) && (mouseX < 0 + 709) && (mouseY > 0) && (mouseY < 0+ 30)) {
      fill(255,255,200,30);
      rect(0,0,709,30);
     }
     if ((mouseX > 0) && (mouseX < 0 + 709) && (mouseY > 30) && (mouseY < 30+ 50)) {
      fill(50,150,100,30);
      rect(0,30,709,50);
     }
     if ((mouseX > 0) && (mouseX < 0 + 709) && (mouseY > 80) && (mouseY < 80+ 30)) {
      fill(255,200,180,30);
      rect(0,80,709,30);
     }
     if ((mouseX > 0) && (mouseX < 0 + 709) && (mouseY > 110) && (mouseY < 110+ 90)) {
      fill(100,80,50,30);
      rect(0,110,709,90);
     }
     if ((mouseX > 0) && (mouseX < 0 + 709) && (mouseY > 200) && (mouseY < 200+ 10)) {
      fill(220,220,100,30);
      rect(0,200,709,10);
     }
     if ((mouseX > 0) && (mouseX < 0 + 709) && (mouseY > 210) && (mouseY < 210+ 30)) {
      fill(150,250,100,30);
      rect(0,210,709,30);
     }
     if ((mouseX > 0) && (mouseX < 0 + 709) && (mouseY > 240) && (mouseY < 240+ 70)) {
      fill(230,50,50,30);
      rect(0,240,709,70);
     }
     if ((mouseX > 0) && (mouseX < 0 + 709) && (mouseY > 310) && (mouseY < 310+ 90)) {
      fill(130,110,80,30);
      rect(0,310,709,90);
     }
     if ((mouseX > 0) && (mouseX < 0 + 709) && (mouseY > 400) && (mouseY < 400+ 30)) {
      fill(255,200,180,30);
      rect(0,400,709,30);
     }
     if ((mouseX > 0) && (mouseX < 0 + 709) && (mouseY > 430) && (mouseY < 430+ 50)) {
      fill(50,150,100,30);
      rect(0,430,709,50);
     }
     if ((mouseX > 0) && (mouseX < 0 + 709) && (mouseY > 480) && (mouseY < 480+ 60)) {
      fill(255,255,200,30);
      rect(0,480,709,60);
     }
  } 

  else if (card  == 6) { 
    ellipseMode(CENTER);
    frameRate(10);
    image(i7,0,0);
    fill(255);
    text("SALAD",40,75);
    text("Vegetables are dancing",40,110); 
    text("Dressed in green skirt",40,135); 
    rect (x,y,w,h); 
    float r = random(300);
    fill(0,random(255),random(150),50);
    ellipse(mouseX, mouseY, r, r);
  } 

  else if (card == 7){ 
    ellipseMode(CENTER);
    frameRate(10);
    background (random(100),random(100),random(100));
    image(i8,0,0);
    fill(255); 
    text("HAMBURGER",40,75);
    text("Cute",40,110); 
    text("cute egg,",40,135); 
    text("cute pickle,",40,160); 
    text("cute bacon,",40,185); 
    text("cute meat",40,210); 
    rect (x,y,w,h);
    t = a * cos(angle);
    u = a * sin(angle);
    fill(random(255),random(255),random(255));
    translate(width/2, height/2);
    rotate(a);
    ellipse(0, 0, t, u);
    angle = angle +5;
    a = a - b;
    if ( a == 0 || a == 600) {
     b =  b * -0.5;
    }
  }
}

 
void mousePressed() { 
  if (card == 0) {
    if((mouseX > 299) && (mouseX < 299 + 60) && (mouseY > 349) && (mouseY < 349 + 130)) { 
      card = 1;
    } 
    else card = 0;
  } 
  else if (card == 1) {  
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) { 
      card = 0;
    } 
    
    else card = 1; 
    
    if (card == 1) {
    if ((mouseX > 50) && (mouseX < 50 + 100) && (mouseY > 300) && (mouseY < 300+ 30)) { 
      card = 2; 
      background(0);
     }}
    if (card == 1) {
    if ((mouseX > 170) && (mouseX < 170 + 100) && (mouseY > 300) && (mouseY < 300+ 30)) { 
      card = 3; 
     }}
    if (card == 1) {
    if ((mouseX > 50) && (mouseX < 50 + 100) && (mouseY > 350) && (mouseY < 350+ 30)) { 
      card = 4; 
     }}
    if (card == 1) {
    if ((mouseX > 170) && (mouseX < 170 + 100) && (mouseY > 350) && (mouseY < 350+ 30)) { 
      card = 5; 
      background(0);
     }}
    if (card == 1) {
    if ((mouseX > 50) && (mouseX < 50 + 100) && (mouseY > 400) && (mouseY < 400+ 30)) { 
      card = 6; 
      background(0);
     }}
    if (card == 1) {
    if ((mouseX > 170) && (mouseX < 170 + 100) && (mouseY > 400) && (mouseY < 400+ 30)) { 
      card = 7; 
     }}
  }  
   
  else if (card == 2) { 
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) { 
      card = 1;
    } 
    else card = 2; 
  } 
  
  else if (card == 3) { 
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) { 
      card = 1;
    } 
    else card = 3; 
  } 
   
  else if (card == 4) { 
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) { 
      card = 1;
    } 
    else card = 4; 
    if (card == 4) {
    speedX = random(-20, 20);     
    speedY = -20;
    }
  } 
  
  else if (card == 5) { 
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) { 
      card = 1;
    } 
    else card = 5; 
  } 
   
  else if (card == 6) { 
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) { 
      card = 1;
    } 
    else card = 6; 
  } 
 
  else if (card == 7) { 
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) { 
      card = 1;
    } 
    else card = 7; 
  }
}

