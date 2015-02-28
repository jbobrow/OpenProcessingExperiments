

int x, y;
int[]xx=new int[100];
int[]yy=new int[100];

PImage photo;

void setup() {
  size(650, 340);
  photo = loadImage("flower13.jpg");
}

void draw() {
  image(photo, 0, 0);
  //background(200);


  //  xx[0]=mouseX;
  //  yy[0]=mouseY;
  if (mousePressed) {
    xx[0]+=(mouseX-xx[0])*0.05;
    yy[0]+=(mouseY-yy[0])*0.05;
  }

  for (int i=99; i>0; i--) {
    xx[i]=xx[i-1];
    yy[i]=yy[i-1];
  }


  chara(xx[0], yy[0], true);


  for (int i=99; i>=0; i=-i-10) {
    chara(xx[i], yy[i], false);
    ribbon(xx[i], yy[i]);
    float x = random(200);
    float y = random(50, 200);
  }

  //chara(xx[99],yy[99]);
  //chara(xx[80],yy[80]);
  //chara(xx[0],yy[0]);

  //for(int j=0; j<= height; j+=(mouseY+10)){
  //for(int i=0; i<=width; i+=(mouseX+10)){
  // x= mouseX;
  // y= mouseY;
  // chara(x,y);
}

void chara(int a, int b, boolean close) {

  pushMatrix();
  translate(a, b);

  // noCursor();

  fill(255, 255, 255);
  strokeWeight(2);
  //ear_under
  stroke(242, 179, 219);
  quad(56, 2, random(64, 66), random(1, 3), 71, 19, 59, 19);
  quad(22, 8, random(27, 29), random(1, 3), 41, 15, 32, 21);
  //foot
  rect(33, 70, random(8, 10), random(14, 16), 3, 6, 9, 9);
  rect(56, 75, random(8, 10), random(10, 12), 3, 6, 16, 18);
  //hand
  rect(24, 53, random(8, 12), random(7, 10), 3, 6, 16, 18);
  //body
  rect(31, 51, random(35, 38), random(29, 32), 3, 6, 16, 18);
  //righthand
  rect(63, 54, random(9, 11), random(7, 9), 3, 6, 16, 18);
  //face
  ellipse(50, 35, random(56, 59), 45);
  //ear_top2
  ellipse(56, 23, random(8, 10), random(8, 10));
  ellipse(17, 21, random(8, 10), random(8, 10));
  //ear_top
  quad(56, 2, random(63,65), random(0,2), 61, 23, 51, 23);
  quad(27, 2, random(33,35), random(7,9), 22, 23, 13, 18);
  //rinkakukesi kubi,rightear,leftear
  noStroke();
  fill(255, 255, 255);
  rect(35, 30, 28, 30);
  noStroke();
  fill(255, 255, 255);
  rect(64, 13, 5, 6);
  //rinkakukesi eartop2
  noStroke();
  fill(255, 255, 255);
  quad(57, 3, 65, 3, 61, 25, 52, 25);
  noStroke();
  fill(255, 255, 255);
  quad(28, 3, 34, 9, 21, 25, 13, 20);
  //rinakakukesi ear_under
  fill(255, 255, 255);
  quad(63, 4, 65, 4, 71, 19, 63, 19);
  fill(255, 255, 255);
  quad(23, 9, 28, 3, 41, 15, 33, 21);
  //sisikakusi migite hidarite
  fill(255, 255, 255);
  rect(62, 55, 11, 7, 3, 6, 16, 18);
  fill(255, 255, 255);
  rect(25, 54, 9, 7, 3, 6, 16, 18);
  //sisikakusi migiasi hidariasi
  fill(255, 255, 255);
  rect(34, 75, 7, 10, 3, 6, 9, 9);
  fill(255, 255, 255);
  rect(57, 75, 7, 11, 3, 6, 9, 9);
  //eyes
  if (close) {
    fill(90, 140, 191);
    ellipse(39, 40, 5.5, 8);
    ellipse(55, 40, 5.5, 8);
  } 
  else {
    //fill(90, 140, 191);
    fill(232,33,163);
    ellipse(39, 40, 5.5, 13);
    ellipse(55, 40, 5.5, 13);
  }

  //hoppe
  pushMatrix();
  fill( map(b, 0, 600, 255, 244), map(a, 0, 600, 255, 100), map(a, 0, 600, 255, 200));
  ellipse(30, 45, random(8, 10), random(8, 10));
  ellipse(65, 46, random(8, 10), random(8, 10));
  popMatrix();


  popMatrix();
}

void ribbon(int a, int b) {   //ribon
  pushMatrix();
  translate(a+47, b+15);
  fill( map(a, 0, 600, 234, 255), map(b, 0, 600, 100, 255), 245);
  scale(map(a, 0, 600, 0, 3));
  rotate(map(b, 0, 600, 0, TWO_PI*10));
  triangle(0, 0, -20, -10, -20, 10);
  triangle(0, 0, 20, -10, 20, 10);
  popMatrix();
}



