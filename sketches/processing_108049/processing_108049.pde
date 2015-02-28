
int x, y;
int vx ;
int vy ;

void setup() {
   size(600, 600);
   x = 0 ;
   y = 250 ;
   vx = 1 ;
   vy = 2 ;
}

void draw() {
  background(#4AED48) ;
  stroke(#3D953C) ;
  fill(#3D953C) ;
  //1
  triangle(100, 100, 110, 60, 120, 100) ;
  triangle(115, 100, 125, 60, 135, 100) ;
  triangle(130, 100, 140, 60, 150, 100) ;
  //2
  triangle(200, 200, 210, 160, 220, 200) ;
  triangle(215, 200, 225, 160, 235, 200) ;
  triangle(230, 200, 240, 160, 250, 200) ;
  triangle(245, 200, 255, 160, 265, 200) ;
  //3
  stroke(#236215) ;
  fill(#236215) ;
  triangle(90, 280, 100, 240, 110, 280) ;
  //stroke(#236215) ;
  //fill(#236215) ;
  triangle(75, 280, 85, 240, 95, 280) ;
  //4
  triangle(350, 185, 360, 145, 370, 185) ;
  triangle(365, 185, 375, 145, 385, 185) ;
  triangle(380, 185, 390, 145, 400, 185) ;
  triangle(395, 185, 405, 145, 415, 185) ;
  //5(bigger)
  stroke(#3D953C) ;
  fill(#3D953C) ;
  triangle(120, 450, 140, 380, 160, 450) ;
  triangle(145, 450, 165, 380, 185, 450) ;
  triangle(170, 450, 190, 380, 210, 450) ;
  //6(bigger)
  stroke(#236215) ;
  fill(#236215) ;
  triangle(320, 350, 340, 280, 360, 350) ;
  triangle(345, 350, 365, 280, 385, 350) ;
  triangle(370, 350, 390, 280, 410, 350) ;
  //7(smaller)
  triangle(500, 50, 505, 30, 510, 50) ;
  triangle(510, 50, 515, 30, 520, 50) ;
  triangle(520, 50, 525, 30, 530, 50) ;
  triangle(530, 50, 535, 30, 540, 50) ;
  //8(biggest)
  stroke(#3D953C) ;
  fill(#3D953C) ;
  triangle(425, 500, 450, 420, 475, 500) ;
  triangle(450, 500, 475, 420, 500, 500) ;
  triangle(475, 500, 500, 420, 525, 500) ;
  //9
  triangle(500, 250, 510, 210, 520, 250) ;
  triangle(515, 250, 525, 210, 535, 250) ;

  if (mousePressed) {
  //1
  stroke(#FFF300) ; //yellow
  fill(#FFF300) ; 
  ellipse (70, 80, 10, 10) ;
  ellipse (80, 70, 10, 10) ;
  ellipse (90, 80, 10, 10) ;
  ellipse (80, 90, 10, 10) ;
  stroke(#FF0000) ; //red
  fill(#FF0000) ;
  ellipse (80, 80, 10, 10) ;
  //2
  stroke(#FFF300) ; //yellow
  fill(#FFF300) ;
  ellipse (280, 300, 10, 10) ;
  ellipse (300, 300, 10, 10) ;
  ellipse (290, 290, 10, 10) ;
  ellipse (290, 310, 10, 10) ;
  stroke(#FF0000) ; //red
  fill(#FF0000) ;
  ellipse (290, 300, 10, 10) ;
  //3
  stroke(#FFF300) ; //yellow
  fill(#FFF300) ;
  ellipse (300, 270, 10, 10) ;
  ellipse (320, 270, 10, 10) ; 
  ellipse (310, 260, 10, 10) ;
  ellipse (310, 280, 10, 10) ;
  stroke(#FF0000) ; //red
  fill(#FF0000) ;
  ellipse (310, 270, 10, 10) ;
  //4
  stroke(#FC94F7) ; //pink
  fill(#FC94F7) ; 
  ellipse (435, 100, 30, 30) ;
  ellipse (425, 130, 30, 30) ;
  ellipse (450, 145, 30, 30) ;
  ellipse (475, 130, 30, 30) ;
  ellipse (468, 100, 30, 30) ;
  stroke(#FFF300) ; //yellow
  fill(#FFF300) ;
  ellipse (450, 120, 20, 20) ;
  //5
  stroke(#FF0890) ; // pinkpink
  fill(#FF0890) ;
  ellipse (140, 200, 10, 10) ;
  ellipse (160, 200, 10, 10) ;
  ellipse (150, 190, 10, 10) ;
  ellipse (150, 210, 10, 10) ;
  ellipse (150, 200, 10, 10) ;
  //6
  stroke(#FF7300) ; //orange
  fill(#FF7300) ;
  ellipse (135, 480, 30, 30) ;
  ellipse (125, 510, 30, 30) ;
  ellipse (150, 525, 30, 30) ;
  ellipse (175, 510, 30, 30) ;
  ellipse (168, 480, 30, 30) ;
  stroke(#FFF300) ; //yellow
  fill(#FFF300) ;
  ellipse (150, 500, 20, 20) ;
  //7
  stroke(#FF0000) ; //red
  fill(#FF0000) ;
  ellipse (415, 490, 30, 30) ;
  ellipse (405, 520, 30, 30) ;
  ellipse (430, 535, 30, 30) ;
  ellipse (455, 520, 30, 30) ;
  ellipse (448, 490, 30, 30) ;
  stroke(#FFF300) ; //yellow
  fill(#FFF300) ;
  ellipse (430, 510, 20, 20) ;
  //8
  stroke(#FF0890) ; // pinkpink
  fill(#FF0890) ;
  ellipse (490, 380, 10, 10) ;
  ellipse (480, 380, 10, 10) ;
  ellipse (500, 380, 10, 10) ;
  ellipse (490, 370, 10, 10) ;
  ellipse (490, 390, 10, 10) ;
  //9
  stroke(#52B5FF) ;
  fill(#52B5FF) ;
  ellipse (280, 80, 15 ,15) ;
  ellipse (280, 67, 15, 15) ;
  ellipse (280, 93, 15, 15) ;
  ellipse (267, 80, 15, 15) ;
  ellipse (293, 80, 15, 15) ;
  //10
  ellipse (55, 380, 15, 15) ;
  ellipse (42, 380, 15, 15) ;
  ellipse (68, 380, 15, 15) ;
  ellipse (55, 367, 15, 15) ;
  ellipse (55, 393, 15, 15) ;
  }
  
  chara(int(x), int(y)) ;

  x = x + vx ;
  y = y + vy ;

  if (x > 500) {
    vx = -vx ;
    x = 500 ;
  }
  if (x < 40) {
    vx = -vx ;
    x = 40 ;
  }
  if (y > 560) {
    vy = -vy ;
    y = 560 ;
  }
  if (y < 0) {
    vy = -vy ;
    y = 0 ;
  }
 
  chara (x+30, y+30) ;
  chara (x-50, y-50) ;
  chara (x+80, y-80) ;
  chara (x-20, y+10) ;
  }
void chara(int a, int b) {
  pushMatrix() ;
  translate(a-50, b-50) ;
  
  ////////////////////
  scale (map(a,0,800,0,2.5));
  
  
  stroke(170, 93, 45);
  fill(170, 93, 45);
  rect(30, 10, 40, 60, 7);
  
  //mouse
  stroke(0, 0, 0);
  strokeWeight(1);
  fill(0, 0, 0);
  line(40, 40, 60, 40);
  line(50, 30, 50, 40);
  
  //leg
  stroke(67, 39, 22);
  fill(67, 39, 22);
  rect(30, 60, 10, 30);
  rect(60, 60, 10, 30);
  
  //ears
  stroke(67, 39, 22);
  fill(67, 39, 22);
  triangle(20, 30, 30, 10, 30, 30);
  triangle(70, 30, 70, 10, 80, 30);
  
  //eyes
  stroke(255, 255, 255);
  fill(255, 255, 255);
  triangle(40, 30, 30, 20, 50, 20);
  triangle(60, 30, 50, 20, 70, 20);
  stroke(0, 0, 0);
  strokeWeight(5);
  //line(40, 20, 40, 30);
  line(40, 20, 40, 30);
  line(60, 20, 60, 30);
  
  //hands
  pushMatrix();
  translate(30, 50);
  rotate(map(b, 0, 600, 0, radians(3600)));
  stroke(67, 39, 22);
  strokeWeight(3);
  fill(67, 39, 22);
  //triangle(30, 50, 30, 40, 50, 50);
  triangle(0, 0, 0, -10, 20, 0);
  popMatrix();
  
  pushMatrix();
  stroke(0, 255, 0);
  translate(70, 50);
  point(0, 0);
  rotate(map(b, 0, 600, 0, radians(3600)));
  translate(-20, 0);
  stroke(67, 39, 22);
  strokeWeight(3);
  fill(67, 39, 22);
  triangle(0, 0, 20, -10, 20, 0);
  popMatrix();
  
  //tail
  pushMatrix();
  translate(70, 60);
  rotate(map(b, 0, 600, 0, radians(3600)));
  strokeWeight(3);
  //triangle(70, 60, 80, 40, 80, 60);
  triangle(0, 0, 10, -20, 10, 0);
  popMatrix();
  
  //shoes
  pushMatrix();
  scale(a/60);
  stroke(255, 0, 0);
  fill(255, 0, 0);
  //rect(20, 80, 20, 10);
  rect(20, 80, 20, 10);
  rect(60, 80, 20, 10);
  popMatrix();
////////////////////////////
  
  popMatrix();
  
}


