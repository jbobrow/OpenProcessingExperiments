
// Kao, Meng-Ting
// Intro to Creative Programming
// Exercise three : perspective shift

int a=154;
int b=150;
int e=459;
int f=316;
int g=707;
int h=157;
int m=0;
int n=400;
int u= 296; // changing color one
int v= 183;
int s= 507; // changing color two
int t= 105;
int w= 458; // changin color three
int o= 187;
int radius=28; 

// 追蹤滑鼠
float x;
float y;
float easing = 0.05;


PImage img;

void setup(){
  size(800, 400);
  smooth();
  img= loadImage("a2.png");
  ellipseMode(RADIUS);
  //追蹤滑鼠
  ellipseMode(RADIUS);
  rectMode(CORNERS);
}

void draw(){
  image(img, 0 ,0);
  noStroke();

// click, left pink one
  if (mouseButton==LEFT){
    fill(200);
    stroke(220);
    strokeWeight(3);
    
  }else{
    fill(217, 154, 180, 100);
    noStroke();
  }

// enlarge pink circle, left one
float d= dist(mouseX, mouseY, a, b);
if(d<radius){
  radius=50;
  fill(119, 107, 131, 80);
} else{
  fill(217, 154, 180, 80);
}
ellipse (a,b, radius, radius);

//enlarge pink circle, right
float i= dist(mouseX, mouseY, g, h);
if(i<radius){
  radius=80;
  fill(119, 107, 131, 80);
} else{
  fill(217, 154, 180, 80);
}
ellipse (g , h, radius, radius);

//enlarge pink circle, middle
float q= dist(mouseX, mouseY, e, f);
if(q<radius){
  radius=220;
  fill(119, 107, 131, 80);
} else{
  fill(217, 154, 180, 80);
}
ellipse (e , f, radius, radius);

//enlarge bule circle, big left 
float p= dist(mouseX, mouseY, m, n);
if(p<radius){
  radius=300;
  fill(255, 181, 77, 80);
} else{
  fill(119, 107, 131, 80);
}
ellipse (m , n, radius, radius);

// changing color one
float j= dist(mouseX, mouseY, u, v);
if(j<28){
 fill(175, 43, 23, 80);
} else{
  fill(119, 107, 131, 80);
}
ellipse (u , v, 42, 42);

// changing color two
float k= dist(mouseX, mouseY, s, t);
if(k<28){
 fill(255, 181, 77, 80);
} else{
  fill(119, 107, 131, 80);
}
ellipse (s , t, 42, 42);

// changing color three
float z= dist(mouseX, mouseY, w, o);
if(z<28){
 fill(42, 80, 129, 80);
} else{
  fill(119, 107, 131, 80);
}
ellipse (w , o, 42, 42);

// mouse dot
ellipse(mouseX, mouseY, 10,10);
ellipse (mouseX, mouseY, 20,20);

// 追蹤滑鼠
float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  fill(247, 170, 52, 80);
  ellipse(x, y, 30, 30);
  
  
  strokeWeight(1);
  noStroke();
  line(460, 318, 0, height);
  if(mousePressed){
    if(mouseButton==LEFT){
      stroke(200);
    } else{
      stroke(150);
    }
    line(70, 64, 400, 56);
    line(414, 91, 453, 174);
    line(466, 200, 629, 293);
    line(70, 64, 129, 128);
    line(135, 181, 42, 330);
    line(296, 186, 225, 290);
    line(327, 173, 472, 120);
    line(542, 94, 800, 0);
    line(613, 138, 535, 227);
    line(524, 243, 486, 288);
    line(434, 345, 388, 400);
    line(800, 0, 735, 232);
    line(800, 0, 728, 125);
  }
 
}


