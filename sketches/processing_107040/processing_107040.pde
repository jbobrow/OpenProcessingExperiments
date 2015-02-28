
float x, y;
float vx, vy;
float ay;
float al;

void setup() {
  size(600, 600) ;
  
  x =5 ;
  y =250;
  vx = 2;
  vy = 2;
  ay = 0.5 ;
  al=height/2;
}





void draw() {
  background(#D9FAFC);
  fill(255);
  strokeJoin(ROUND);
  noStroke();
  rect(0, 500, 400, 100);
  rect(400, 450, 600, 450);







 chara(int(x), int(y));

x = x + vx ;
y = y + vy ;





if (x > 560) { vx=-vx;
x=560;
}
if (x <50) { vx=-vx;
x=50;
}
if (y >560) { vy=-vy;
y=560;
}
if (y <40) { vy=-vy;
y=40;
}

vy = vy + ay ;
if (mousePressed) { 
  if ((mouseX > x-50) && (mouseX < x+50) && (mouseY > y-50) && (mouseY <y+50)) { 

    x = mouseX ;
    y = mouseY ;

    vx = 0 ;
    vy = 0 ;
    
 
 haikei(int(x),int(y));
al=al+2;
if(al<0){

al=height;
  
}
  }
}
}

void mouseReleased() {

  vx = mouseX - pmouseX ;  
  vy = mouseY - pmouseY ;

  vx = vx * 0.5 ;
  vy = vy * 0.5 ;
}


void chara(int a,int b) {
  pushMatrix();
  translate(a-50,b-50);
 
  strokeWeight(1.5);
  fill(a,240,b);
  stroke(0, 0, 0);
  //karadaue
  quad(15, 50, 40,b/20, 60, b/17, 90, 50);
  fill(255, 246, 196);
  //karadasita
  quad(20, 50, 90, 50, 90, 80, 20, 80);
  fill(a,240,b);
  //moyou
  rect(20, 50, 10, 10, 3);
  rect(40, 50, 10, 10, 3);
  rect(60, 50, 10, 10, 3);
  rect(80, 50, 10, 10, 3);
  stroke(0, 0, 0);
  fill(255, 246, 196);
  //asi
  triangle(20, 80, 40, 80, map(b,500,10,13,30), 90);
  triangle(40, 80, 50, 80, map(b,500,10,33,45), 90);
  triangle(60, 80, 70, 80, map(b,10,500,65,73), 90);
  triangle(70, 80, 90, 80, map(b,10,500,80,93), 90);
  stroke(a,240,b);
  strokeWeight(3);
  line(17, 50, 87, 50);
  stroke(0, 0, 0);
  //moyou2
  strokeWeight(1.5);
  line(30, 50, 40, 50);
  line(50, 50, 60, 50);
  line(70, 50, 80, 50);
  //kao
  ellipse(15, 65, 30, 30);
  //me
  stroke(0, 0, 0);
  strokeWeight(1);
  //pushMatrix();
  line(6.3, map(b,40,400,63,67), 8.3, 64);
  line(21.3,64, 23.3, map(b,40,400,63,67));
  //popMatrix();
  strokeWeight(3);
  point(10, 70);
  point(20, 70);
  
  popMatrix();
  
}
void haikei(int a,int b) {
  pushMatrix();


for (int j = 0; j < 50; j++) {
  for (int i = 0; i < 50; i++) {
    noStroke();
    fill(255);
    ellipse(50 + 100 * i, al-100*j, 20, 20);

  }
}
popMatrix();
  
}


