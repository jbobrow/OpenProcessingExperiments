



float x, y;
float vx, vy;
float ay;

float h, i;
float vh, vi;
float ci;

float l, m;
float vl, vm;
float el;




void setup() {
  size(600, 600);
  

  x=50;
  y=50;
  vx=17;
  vy=15;
  ay=0.9;

  //hair
  h=mouseX-50;
  i=mouseY-50;
  vh=30;
  vi=20;
  ci=0.7;
  translate(-50, -50);

  //flower
  l=mouseX;
  m=mouseY;
  vl=20;
  vm=20;
}

void draw() {
  background(255); 
  
  //flowers(int(l),int(m));
  
  chara(int(x), int(y));
  x= x+ vx;
  y= y+ vy;

  if (x>570) { 
    vx=-vx;
  }
  if (x<30) {
    vx =-vx;
    vx= vx * 1.0;
  }
  if (y>550) {
    vy= -vy;
    vy= vy * 1.0 ;
    y= 550 - (y-550);
  }

  if (y<00) { 
    vy=-vy;
    background(255, 255, 0);
  }
  vy= vy + ay;


  if (mousePressed) {
    if ((mouseX>x-50)&&(mouseX<x+50)&&(mouseY>y-50)&&(mouseY<y+50)) {
      x= mouseX ;
      y= mouseY ;
      vx= 0 ;
      vy= 0 ;
    }
  }
  //hair
  hair(int(x), int(y));
  h= h+ vh;
  i= i+ vi;

  if (h>600) { 
    vh=-vh*0.5;
    h=600-(h-600);
  }
  if (h<0) vh=-vh*0.5;
  if (i>600) {
    vi=-vi*0.5;
    i=600-(i-600);
  }
  if (i<0) vi=-vi*0.5;

  vi=vi+ci;
  
 //flower
  flower(int(l), int(m));
  l= l + vl ;
  m= m+ vm ;
}

void mouseReleased() {
  ///pmouse=maeno zahyou///
  vx= mouseX - pmouseX;
  vy= mouseY - pmouseY;

  vx = vx*0.6;
  vy = vy*0.6;
}

void mousePressed () {
  l = 0 ;
  m = 0 ;
  vl = 10;
  vm = 10;
}

void chara(int a, int b) {


  //backgronund
  pushMatrix();
  translate(50, 50);
  scale(map(a+b, 0, 600, 0, 1));
  translate(-50, -50);
  fill(0, b, 255);
  ellipse(50, 10, 40, 40);
  ellipse(15, 30, 40, 40);
  ellipse(15, 70, 40, 40);
  ellipse(50, 90, 40, 40);
  ellipse(85, 70, 40, 40);
  ellipse(85, 30, 40, 40);
  ellipse(50, 10, 40, 40);
  ellipse(15, 30, 40, 40);
  ellipse(15, 70, 40, 40);
  popMatrix();

  pushMatrix();
  translate(450, 70);
  scale(map(a+b, 0, 600, 0, 4));
  translate(-50, -50);
  fill(a, b, 255,a);
  ellipse(50, 10, 40, 40);
  ellipse(15, 30, 40, 40);
  ellipse(15, 70, 40, 40); 
  ellipse(50, 90, 40, 40);
  ellipse(85, 70, 40, 40);
  ellipse(85, 30, 40, 40);
  ellipse(50, 10, 40, 40);
  ellipse(15, 30, 40, 40);
  ellipse(15, 70, 40, 40);

  popMatrix();

  pushMatrix();
  translate(500, 120);
  scale(map(a+b, 0, 600, 0, 1));
  translate(-50, -50);
  fill(a, b, 255);
  ellipse(50, 10, 40, 40);
  ellipse(15, 30, 40, 40);
  ellipse(15, 70, 40, 40);
  ellipse(50, 90, 40, 40);
  ellipse(85, 70, 40, 40);
  ellipse(85, 30, 40, 40);
  ellipse(50, 10, 40, 40);
  ellipse(15, 30, 40, 40);
  ellipse(15, 70, 40, 40);
  popMatrix();

  pushMatrix();
  translate(500, 500);
  scale(map(a, 0, 600, 1, 0));
  fill(0, a, 255, b);
  ellipse(50, 10, 40, 40);
  ellipse(15, 30, 40, 40);
  ellipse(15, 70, 40, 40);
  ellipse(50, 90, 40, 40);
  ellipse(85, 70, 40, 40);
  ellipse(85, 30, 40, 40);
  ellipse(50, 10, 40, 40);
  ellipse(15, 30, 40, 40);
  ellipse(15, 70, 40, 40);
  popMatrix();

  pushMatrix();
  translate(200, 300);
  scale(map(a+b, 0, 600, 1, 0));
  fill(a, 122, 255);
  ellipse(50, 10, 40, 40);
  ellipse(15, 30, 40, 40);
  ellipse(15, 70, 40, 40); 
  ellipse(50, 90, 40, 40);
  ellipse(85, 70, 40, 40);
  ellipse(85, 30, 40, 40);
  ellipse(50, 10, 40, 40);
  ellipse(15, 30, 40, 40);
  ellipse(15, 70, 40, 40);
  popMatrix();

  pushMatrix();
  translate(460, 480);
  scale(map(a, 0, 600, 1, 0));
  fill(0, 255, a, a);
  ellipse(50, 10, 40, 40);
  ellipse(15, 30, 40, 40);
  ellipse(15, 70, 40, 40);
  ellipse(50, 90, 40, 40);
  ellipse(85, 70, 40, 40);
  ellipse(85, 30, 40, 40);
  ellipse(50, 10, 40, 40);
  ellipse(15, 30, 40, 40);
  ellipse(15, 70, 40, 40);
  popMatrix();

  pushMatrix();
  translate(50, 500);
  scale(map(a, 0, 600, 0, 3));
  fill(122, b, 255, a);
  ellipse(50, 10, 40, 40);
  ellipse(15, 30, 40, 40);
  ellipse(15, 70, 40, 40);
  ellipse(50, 90, 40, 40);
  ellipse(85, 70, 40, 40);
  ellipse(85, 30, 40, 40);
  ellipse(50, 10, 40, 40);
  ellipse(15, 30, 40, 40);
  ellipse(15, 70, 40, 40);
  popMatrix();

  //main
  pushMatrix();
  translate(a-50, b-50);

  strokeWeight(1);
  fill(255);
  stroke(0);


  //faceshape
  pushMatrix();
  translate(50, 50);
  rotate(map(a+b, 0, 1200, 0, radians(3600)));
  scale(map(a, 0, 600, 1, 1), map(b, 0, 600, 2, 1));
  translate(-50, -50);
  stroke(200, 0, 0);
  ellipse(50, 50, 80, 80); 
  popMatrix();

  //face
  pushMatrix();
  translate(50, 50);
  rotate(map(a+b, 0, 1200, 0, radians(1080)));
  translate(-50, -50);

  //eye mask
  stroke(00, 00, 00);
  strokeWeight(2);
  pushMatrix();
  translate(60, 45);
  scale(map(a+b, 0, 600, 1, 1.2));
  translate(-60, -45);
  line(80, 60, 35, 25);
  popMatrix();
  fill(00, 00, 00);
  //fill(map(a, 0, 600, 0, 255), b, 255);
  rect(63, 45, 15, 13);

  //eyes
  strokeWeight(2);
  stroke(00, 00, 00);
  //fill(00, 170, 170);
  fill(map(b, 0, 300, 255, 0), map(b, 250, 600, 0, 255), map(b, 300, 600, 0, 255));
  ellipse(30, 50, 10, 10);

  //noze
  fill(#000000);
  triangle(45, 55, 55, 55, 50, 63);
  line(50, 63, 50, 67);

  //blow
  line(37, 35, 40, 40);
  line(63, 35, 60, 40);

  popMatrix();


  //heiar
  pushMatrix();
  translate(50, 50);
  rotate(map(a+b, 0, 1200, 0, radians(3600)));
  scale(map(a, 0, 600, 1, 1), map(b, 0, 600, 2, 1));
  translate(-50, -50);
  fill(255, map(b, 0, 600, 0, 200), map (a, 0, 600, 200, 0));
  noStroke();
  strokeWeight(2);
  //fill(255, 15, 90);
  ellipse(50, 10, 22, 22);
  ellipse(30, 15, 22, 22);
  ellipse(15, 30, 22, 22);
  ellipse(10, 50, 22, 22);
  ellipse(15, 70, 22, 22);
  ellipse(30, 85, 22, 22); 
  ellipse(50, 90, 22, 22);
  ellipse(70, 85, 22, 22);
  ellipse(85, 70, 22, 22);
  ellipse(90, 50, 22, 22);
  ellipse(85, 30, 22, 22);
  ellipse(70, 15, 22, 22);
  popMatrix();

  popMatrix();
}

void flower(int e, int f ) {
  
  if (mousePressed) {
    rotate(map(f, 0, 1200, 0, radians(3600)));
    scale(map(e, 0, 600, 0, 1));
    translate(-50, -50);
    noStroke();
    fill(255, 15, 90);

    strokeWeight(2);
    ellipse(50, 10, 40, 40);
    ellipse(30, 15, 10, 10);
    ellipse(15, 30, 10, 10);
    ellipse(10, 50, 40, 40);
    ellipse(15, 70, 10, 10);
    ellipse(30, 85, 10, 10); 
    ellipse(50, 90, 40, 40);
    ellipse(70, 85, 10, 10);
    ellipse(85, 70, 10, 10);
    ellipse(90, 50, 40, 40);
    ellipse(85, 30, 10, 10);
    ellipse(70, 15, 10, 10);
  }
}

void hair(int c, int d) {


//if (mousePressed) {
  translate(mouseX-15, mouseY-15);
  rotate(map(c, 0, 1200, 0, radians(3600)));
  scale( map(c+d, 0, 600, 1, 3));
  fill(255, map(c, 0, 600, 0, 255), 255,map(d,0,600,100,200));
  noStroke();
  strokeWeight(2);
  //fill(255, 15, 90);
  ellipse(50, 10, 22, 22);
  ellipse(30, 15, 22, 22);
  ellipse(15, 30, 22, 22);
  ellipse(10, 50, 22, 22);
  ellipse(15, 70, 22, 22);
  ellipse(30, 85, 22, 22); 
  ellipse(50, 90, 22, 22);
  ellipse(70, 85, 22, 22);
  ellipse(85, 70, 22, 22);
  ellipse(90, 50, 22, 22);
  ellipse(85, 30, 22, 22);
  ellipse(70, 15, 22, 22);
}
//}


