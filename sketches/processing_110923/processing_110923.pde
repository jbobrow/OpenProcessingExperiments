


float x, y;
float vx;
float vy;
int[]xx=new int[100];
int[]yy=new int[100];

void setup() {
  size(800, 800);
  x=10;
  y=height/2;
  vx=3;
  vy=6;
}

void draw() {
  background(0);

  if (mousePressed) {
    background(mouseX/2, mouseY/2, mouseX);
    noFill();
    stroke(mouseX/10, mouseY/2, mouseX/2);
    ellipse(980, 350, mouseX*5, mouseY*5);
    ellipse(20, 50, mouseX*5, mouseY*5);
    ellipse(980, 50, mouseX*5, mouseY*5);
    ellipse(20, 350, mouseX*5, mouseY*5);
    ellipse(500, 50, mouseX*5, mouseY*5); 
    ellipse(500, 350, mouseX*5, mouseY*5);
  }
  for (int i=99; i>0;i--) {
    xx[i]=xx[i-1];
    yy[i]=yy[i-1];
  }

  xx[0]=int(x)-50;
  yy[0]=int(y)-60;


  for (int i=40;i>0;i-=5) {
    pushMatrix();
    translate(xx[i], yy[i]);
    stroke(152-i*2, 87-i, 240);
    noFill();
    ellipse(50, 75, 85-i, 45-i);
    translate(xx[i], yy[i]);

    popMatrix();
  }

  if (mousePressed) {
     if ((mouseX>x-50)&&(mouseX<x+50)&&(mouseY>y-50)&&(mouseY<y+50)) {
      x=mouseX;
      y=mouseY;
    chara_d(int (x)-50, int(y)-60);
    x=x+vx;
    y=y+vy;
    if (x>width) {
      vx=-40;
    } 
    else if (x<0) {
      vx=50;
    }


    if (y>height) {
      vy=-35;
    }
    else if (y<0) {
      vy=80;
    }


    
  }
  else {

    chara(int (x)-50, int(y)-60);
    //chara((int)x,(int)y);
    x=x+vx;
    y=y+vy;
    if (x>width) {
      vx=-40;
    } 
    else if (x<0) {
      vx=25;
    }


    if (y>height) {
      vy=-35;
    }
    else if (y<0) {
      vy=10;
    }
  }
}
  else {

    chara(int (x)-50, int(y)-60);
    chara(int (x)-50/100, int(y)-60*2);
    chara(int (x)-50/100, int(y)-60/5);
    chara(int (x)-50*-7/8, int(y)-90*5/7);
    chara(int (x)-50*2, int(y)-60*2);
    chara(int (x)-50*3, int(y)-60/3);
    chara(int (x)-50*3, int(y)-85);
    //chara((int)x,(int)y);

    x=x+vx;
    y=y+vy;
    if (x>width) {
      vx=-5;
    } 
    else if (x<0) {
      vx=13;
    }


    if (y>height) {
      vy=-3;
    }
    else if (y<0) {
      vy=15;
    }
  }
}





 void chara(int a,int b){
  pushMatrix();
  translate(a, b);
  noStroke();

  //hane
  fill(110, 50, 252);
  //triangle(10, 13, 5, 15, 18, 58);
  pushMatrix();
  translate(18, 58); 
  rotate(map(b/2, 0, -400, 0, 3.14));
  triangle(-8, -45, -13, -43, 0, 0);
  popMatrix();
  pushMatrix();
  //triangle(90, 13, 82, 58, 95, 15);
  translate(82, 58);
  rotate(map(b/2, 400, 0, 3.14, 0));
  triangle(8, -45, -0, 0, 13, -43);
  popMatrix();
  fill(80, 80, 252);
  pushMatrix();
  //triangle(5, 15, 3, 18, 19, 59);
  translate(19, 59);
  rotate(map(b/2, 0, -400, 0, 3.14));
  triangle(-14, -44, -16, -41, 0, 0);
  popMatrix(); 
  pushMatrix();
  //triangle(95, 15, 81, 59, 97, 18);
  translate(81, 59);
  rotate(map(b/2, 400, 0, 3.14, 0));
  triangle(14, -44, 0, 0, 16, -41);
  popMatrix();
  fill(50, 130, 252);
  pushMatrix();
  //triangle(3, 18, 1, 28, 20, 60);
  translate(20, 60); 
  rotate(map(b/2, 0, -400, 0, 3.14)); 
  triangle(-17, -42, -19, -32, 0, 0);
  popMatrix();
  pushMatrix();
  //triangle(7, 55, 7, 60, 19, 59);
  translate(19, 59);
  rotate(map(b/2, 0, -400, 0, 3.14));
  triangle(-12, -4, -12, 1, 0, 0);  
  popMatrix(); 
  pushMatrix();
  //triangle(97, 18, 80, 60, 99, 28);
  translate(80, 60);
  rotate(map(b/2, 400, 0, 3.14, 0));
  triangle(17, -42, 0, 0, 19, -32);
  popMatrix();
  pushMatrix();
  //triangle(93, 55, 81, 59, 93, 60);
  translate(81, 59);
  rotate(map(b/2, 400, 0, 3.14, 0));
  triangle(12, -4, 0, 0, 12, 1);
  popMatrix();
  fill(50, 160, 252);
  pushMatrix();
  //triangle(5, 48, 7, 55, 20, 60);
  translate(20, 60); 
  rotate(map(b/2, 0, -400, 0, 3.14));
  triangle(-15, -12, -13, -5, 0, 0);
  popMatrix();
  pushMatrix();
  //triangle(1, 28, 2, 38, 20, 60);
  translate(20, 60);  
  rotate(map(b/2, 0, -400, 0, 3.14));
  triangle(-19, -32, -18, -22, 0, 0);  
  popMatrix();
  pushMatrix();
  //triangle(95, 48, 80, 60, 93, 55)
  translate(80, 60);
  rotate(map(b/2, 400, 0, 3.14, 0));
  triangle(15, -12, 0, 0, 13, -5);
  popMatrix();
  pushMatrix();
  // triangle(99, 28, 80, 60, 98, 38);
  translate(80, 60);
  rotate(map(b/2, 400, 0, 3.14, 0));
  triangle(19, -32, 0, 0, 18, -22);
  popMatrix();
  fill(50, 170, 252); 
  pushMatrix();
  //triangle(2, 38, 5, 48, 20, 60);
  translate(20, 60); 
  rotate(map(b/2, 0, -400, 0, 3.14));
  triangle(-18, -22, -15, -12, 0, 0);  
  popMatrix();
  pushMatrix();
  //triangle(98, 38, 80, 60, 95, 48);
  translate(80, 60);
  rotate(map(b/2, 400, 0, 3.14, 0));
  triangle(18, -22, 0, 0, 15, -12);
  popMatrix();

  //asi
  fill(188, 240, 238);
  pushMatrix();
  translate(18, 90);
  rotate(map(a, 800, 0, 0, 1));
  //ellipse(18, 90, 10, 20);
  ellipse(0, 0, 10, 20);
  popMatrix();
  pushMatrix();
  translate(82, 90);
  rotate(map(a, 800, 0, 0, -1));
  //ellipse(82, 90, 10, 20);
  ellipse(0, 0, 10, 20);
  popMatrix();

  //doutai
  fill(193, 245, 243);
  ellipse(50, 75, 85, 45);

    noStroke();
    //me
    //fill(0);
    fill(a/2, b/2, a);
    ellipse(35, 65, 10, 10);
    ellipse(65, 65, 10, 10);

    //highlight
    //fill(255, 255, 255);
    fill(a*5, b*5, a*5);
    pushMatrix();
    translate(35, 65);
    rotate(map(a, 400, 0, 0, 6.28));
    //ellipse(33, 62, 3, 3);
    ellipse(2, 2, 3, 3);
    popMatrix();
    pushMatrix(); 
    translate(65, 65);
    rotate(map(a, 400, 0, 0, 6.28));
    //ellipse(63,63, 3, 3);
    ellipse(2, 2, 3, 3);
    popMatrix();

    //tuno
    fill(245, a, 12);
    quad(20, 40, 25, 50, 26, 58, 22, 60);
    quad(75, 50, 80, 40, 78, 60, 74, 58);
  

  //kuti
  fill(255, 113, 41);
  triangle(50, 67, 47, 70, 53, 70);

  popMatrix();
}

void chara_d(int a,int b){
  
  
  pushMatrix();
  translate(a, b);
  noStroke();

  //hane
  fill(110, 50, 252);
  //triangle(10, 13, 5, 15, 18, 58);
  pushMatrix();
  translate(18, 58); 
  rotate(map(b/2, 0, -400, 0, 3.14));
  triangle(-8, -45, -13, -43, 0, 0);
  popMatrix();
  pushMatrix();
  //triangle(90, 13, 82, 58, 95, 15);
  translate(82, 58);
  rotate(map(b/2, 400, 0, 3.14, 0));
  triangle(8, -45, -0, 0, 13, -43);
  popMatrix();
  fill(80, 80, 252);
  pushMatrix();
  //triangle(5, 15, 3, 18, 19, 59);
  translate(19, 59);
  rotate(map(b/2, 0, -400, 0, 3.14));
  triangle(-14, -44, -16, -41, 0, 0);
  popMatrix(); 
  pushMatrix();
  //triangle(95, 15, 81, 59, 97, 18);
  translate(81, 59);
  rotate(map(b/2, 400, 0, 3.14, 0));
  triangle(14, -44, 0, 0, 16, -41);
  popMatrix();
  fill(50, 130, 252);
  pushMatrix();
  //triangle(3, 18, 1, 28, 20, 60);
  translate(20, 60); 
  rotate(map(b/2, 0, -400, 0, 3.14)); 
  triangle(-17, -42, -19, -32, 0, 0);
  popMatrix();
  pushMatrix();
  //triangle(7, 55, 7, 60, 19, 59);
  translate(19, 59);
  rotate(map(b/2, 0, -400, 0, 3.14));
  triangle(-12, -4, -12, 1, 0, 0);  
  popMatrix(); 
  pushMatrix();
  //triangle(97, 18, 80, 60, 99, 28);
  translate(80, 60);
  rotate(map(b/2, 400, 0, 3.14, 0));
  triangle(17, -42, 0, 0, 19, -32);
  popMatrix();
  pushMatrix();
  //triangle(93, 55, 81, 59, 93, 60);
  translate(81, 59);
  rotate(map(b/2, 400, 0, 3.14, 0));
  triangle(12, -4, 0, 0, 12, 1);
  popMatrix();
  fill(50, 160, 252);
  pushMatrix();
  //triangle(5, 48, 7, 55, 20, 60);
  translate(20, 60); 
  rotate(map(b/2, 0, -400, 0, 3.14));
  triangle(-15, -12, -13, -5, 0, 0);
  popMatrix();
  pushMatrix();
  //triangle(1, 28, 2, 38, 20, 60);
  translate(20, 60);  
  rotate(map(b/2, 0, -400, 0, 3.14));
  triangle(-19, -32, -18, -22, 0, 0);  
  popMatrix();
  pushMatrix();
  //triangle(95, 48, 80, 60, 93, 55)
  translate(80, 60);
  rotate(map(b/2, 400, 0, 3.14, 0));
  triangle(15, -12, 0, 0, 13, -5);
  popMatrix();
  pushMatrix();
  // triangle(99, 28, 80, 60, 98, 38);
  translate(80, 60);
  rotate(map(b/2, 400, 0, 3.14, 0));
  triangle(19, -32, 0, 0, 18, -22);
  popMatrix();
  fill(50, 170, 252); 
  pushMatrix();
  //triangle(2, 38, 5, 48, 20, 60);
  translate(20, 60); 
  rotate(map(b/2, 0, -400, 0, 3.14));
  triangle(-18, -22, -15, -12, 0, 0);  
  popMatrix();
  pushMatrix();
  //triangle(98, 38, 80, 60, 95, 48);
  translate(80, 60);
  rotate(map(b/2, 400, 0, 3.14, 0));
  triangle(18, -22, 0, 0, 15, -12);
  popMatrix();

  //asi
  
  fill(240, 70, 98);
  pushMatrix();
  translate(18, 90);
  rotate(map(a, 800, 0, 0, 1));
  //ellipse(18, 90, 10, 20);
  ellipse(0, 0, 10, 20);
  popMatrix();
  pushMatrix();
  translate(82, 90);
  rotate(map(a, 800, 0, 0, -1));
  //ellipse(82, 90, 10, 20);
  ellipse(0, 0, 10, 20);
  popMatrix();
  

  //doutai
  fill(255, 77, 98);
  ellipse(50, 75, 85, 45);

    noStroke();
    //me
    //fill(0);
    if(frameCount%20<10){
    fill(0);
    }else{
      fill(137,4,20);}
    arc(35, 65, 10, 10,PI/4,PI*5/4);
    arc(65, 65, 10, 10,-PI/4,PI*3/4);

    

    //tuno
    if(frameCount%20<10){
    fill(18,95,7);
    }else{
      fill(13,49,8);}
    quad(20, 40, 25, 50, 26, 58, 22, 60);
    quad(75, 50, 80, 40, 78, 60, 74, 58);
  

  //kuti
  fill(72, 4, 12);
  triangle(50, 67, 47, 70, 53, 70);
  

  popMatrix();
}



