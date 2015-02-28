
int a = 700;
int b = 150;
float c = 100;
float d = 140;
int e = 500;
int f = 230;
float g = 80;
float h = 80;
int i = 550;
int j = 50;
float k = 60;
float l = 90;
int m = 610;
int n = 70;
float o =100;
float p = 130;
int q = 690;
int r = 300;
float s = 80;
float t = 100;
int u = 800;
int v = 30;
foat w = 90;
float x = 120;
int y = 485;
int z = 60;
float ab = 100;
float ac = 150;

void setup() {
  size(900,450);
  background(100);

  frameRate(30);
}
void draw() {
 background(100);
  fond();
  balon();
}

void balon() {
  smooth();
  strokeWeight(3);
  line(690,330,500,250);
  line(690,330,600,100);
  line(690,330,800,80);
  line(690,330,550,80);
  line(690,330,690,200);
  line(690,330,470,120);
  fill(255,50,50);
  ellipse(e,f,g,h);
  ellipse(a,b,c,d);
  ellipse(i,j,k,l);

  if (mousePressed && (mouseButton == LEFT)) {
    fill(60,250,60);
  }
  else if (mousePressed && (mouseButton == RIGHT)) {
    fill(255,210,30);
  }
  ellipse(m,n,o,p);
  ellipse(q,r,s,t);
  ellipse(u,v,w,x);
  ellipse(y,z,ab,ac);

if (mousePressed && mouseX>650 && mouseX<750 && 

mouseY>80 && mouseY<220) {
    a = a-1;
    b = b-3;
    c = c-1;
    d = d-1;
  }
  if (mousePressed && mouseX>460 && mouseX<540 && 

mouseY>190 && mouseY<270) {
    e = e-2;
    f = f-6;
    g = g+5;
    h = h+5;
   }
  if (mousePressed && mouseX>505 && mouseX<595 && 

mouseY>20 && mouseY<80) {
    i = i-2;
    j = j-2; 
    k = k-0.5;
    l = l-0.5;
  }
  if (mousePressed && mouseX>545 && mouseX<675 && 

mouseY>20 && mouseY<120) {
    m = m+1;
    n = n-3; 
    o = o+2;
    p = p+2;
  }
  if (mousePressed && mouseX>620 && mouseX<740 && 

mouseY>260 && mouseY<340) {
    q = q-1;
    r = r-8; 
    s = s+2;
    t = t+2;
  }
  if (mousePressed && mouseX>740 && mouseX<860 && 

mouseY>-15 && mouseY<75) {
    u = u+4;
    v = v+7; 
    w = w+8;
    x = x+8;
 }
  if (mousePressed && mouseX>410 && mouseX<560 && 

mouseY>-10 && mouseY<110) {
    y = y-9;
    z = z-3; 
    ab = ab-2;
    ac = ac-2;
 }
}
void fond() {
  fill(0);
  rect(0,450,450,-450);
  fill(0);
  ellipse(860,190,100,140);
  strokeWeight(9);
  line(780,160,900,145);
  quad(808,110,885,100,895,145,808,155);
  ellipse(860,320,50,60);
  quad(850,310,870,340,780,450,770,420);
  quad(690,360,710,360,770,420,770,450);
  quad(710,400,710,370,770,420,760,450);
  quad(680,320,700,330,710,360,690,360);
  fill(255,40,60);
  strokeWeight(random(3,9));
  ellipse(random(150,150),random(450),random

(90),random(90));
  strokeWeight(1);
  ellipse(random(700),random(190,190),random

(45),random(20));
  fill(200,150,10);
  ellipse(random(300,300),random(200,450),random

(20),random(15));
}
