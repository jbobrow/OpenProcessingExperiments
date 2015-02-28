
float x, y ;
float vx, vy;
float ay;
float a;
float hue;

void setup() {
  size(600, 550);
  x=width/2;
  y=height/2 ;
  vx = 0 ;
  vy = 0 ;
  ay = 0.98 ;
}
void draw() {


  fill(#0D0F5D);
  rect(0, 0, 600, 40);
  fill(#0D0F5D);
  rect(0, 0, 40, 550);
  fill(#0D0F5D);
  rect(40, 400, 600, 600);
  fill(#0D0F5D);
  rect(560, 0, 600, 600);

  //TV sotogawa



  // background(#0D0F5D);

  {
    pushMatrix();

    background(hue, 100, 180);
    hue += 3;

    if (hue > 360) {
      hue = 2;
    }
    // rect(50, 25, 500, 450);


    //gusyagusha


    // translate(x, y);
    popMatrix();
  }





  if (mousePressed == true) {
    if ((mouseX > 300) && (mouseX < 300) && (mouseY > 400) && (mouseY < 600)) {

      // fill(255);
      //rect(50, 25, 500, 450);
    }
    else {
      noStroke();
      fill(255);
      rect(58, 25, 130, 450);
      fill(#FFFC8E);
      rect(130, 25, 80, 450);
      fill(#1AFFFD);
      rect(200, 25, 80, 450);
      fill(#51FC2B);
      rect(270, 25, 70, 450);
      fill(#FF43FC);
      rect(340, 25, 60, 450);
      fill(#FF0000);
      rect(400, 25, 70, 459);
      fill(#0D1AFF);
      rect(470, 25, 70, 450);
      fill(#0D1AFF);
      rect(58, 360, 72, 40);
      fill(0);
      rect(130, 360, 80, 40);
      fill(#FF43FC);
      rect(200, 360, 70, 40);
      fill(0);
      rect(270, 360, 80, 40);
      fill(#1AFFFD);
      rect(340, 360, 80, 40);
      fill(0);
      rect(400, 360, 80, 40);
      fill(255);
      rect(470, 360, 70, 40);
      fill(#3437B7);
      rect(58, 400, 120, 80);
      fill(#470789);
      rect(177, 400, 100, 80);
      
  }


      rect(368, 545, 25, 25);

    //fill(#D61A5C);

    // ellipse(500, 540, 90, 90);


    noStroke();
    fill(mouseX, 150, #FFEB0D);
    triangle(200, 40, 450, 380, 200, 350);
    noStroke();
    fill(mouseX, 150, #FFEB0D);
    triangle(80, 110, 550, 300, 300, 300);
    noStroke();
    fill(mouseX, 150, #FFEB0D);
    triangle(260, 200, 450, 110, 280, 440);
    noStroke();
    fill(mouseX, 150, #FFEB0D);
    triangle(80, 270, 200, 200, 300, 300);


    fill(#0D0F5D);
    rect(0, 0, 600, 40);
    fill(#0D0F5D);
    rect(0, 0, 40, 650);
    fill(#0D0F5D);
    rect(40, 460, 600, 600);
    fill(#0D0F5D);
    rect(560, 0, 600, 600);

    rect(368, 545, 25, 25);

    fill(#D61A5C);
    ellipse(500, 510, 60, 60);

    //rect(50, 25, 500, 450);
  }
  noFill();
  noStroke();
  rect(40, 40, 210, 420);

  noStroke();
  fill(#0D0F5D);
  rect(0, 0, 600, 40);
  noStroke();
  fill(#0D0F5D);
  rect(0, 0, 40, 650);
  noStroke();
  fill(#0D0F5D);
  rect(40, 460, 600, 600);
  noStroke();
  fill(#0D0F5D);
  rect(560, 0, 600, 600);
  noStroke();
  rect(368, 545, 25, 25);

  noStroke();
  fill(#D61A5C);
  ellipse(500, 510, 60, 60);
  
  fill(#0D0F5D);
  stroke(#D61A5C);
  rect(420,510,15,15);
  fill(#0D0F5D);
  stroke(#D61A5C);
  rect(390,510,15,15);
  
  

  stroke(#1C620D);
  chara(int (x), int (y)) ;


  x=x+vx;
  y=y+vy;

  if (x>470) {
    vx=-vx;
    x=470;
  }
  if (x<85) {
    vx=-vx;
    x=850;
  }
  if (y > 423) {     
    vy = -vy ;
    y = 423 ;
    vy = vy * 0.9 ; 
    vx = vx * 0.9 ;
  }
  if (y < 85) {      
    vy = -vy ;
    y = 85 ;
  }
  vy = vy + ay ;




  if (mousePressed) { 
    if ((mouseX > x-50) && (mouseX < x+50) && (mouseY > y-50) && (mouseY <y+50)) { // マウスの座標がキャラのエリア内にある？
fill(#FFFEDB);
rect(40,40,520,420);
fill(#FA0000);
noStroke();
ellipse(285,259,200,200);
fill(0, 102, 153);
text("JAPAN!", 60, 250);
textSize(150);
      x = mouseX ;
      y = mouseY ;

      vx = 0 ;
      vy = 0 ;
    }
  }
  // popMatrix();
}
void mouseReleased() {
  
  vx = mouseX - pmouseX ;  
  vy = mouseY - pmouseY ;
  
  vx = vx * 0.5 ;
  vy = vy * 0.5 ;



  // if ((mouseX > 300) && (mouseX < 300) && (mouseY > 400) && (mouseY < 600)) {
}

void chara(int a, int b) {

  pushMatrix() ;
  translate(a-50, b-50) ;

  //body
  fill(#31C4B9);
  strokeWeight(1);
  triangle(50, 10, 10, 75, 70, 75);

  //eyes 
  fill(#ffffff);
  triangle(33, 33, 50, 33, 42, 47);
  triangle(50, 30, 70, 30, 60, 50);

  //blackeye
  fill(#000000);
  ellipse(45, 38, 8, 9);
  ellipse(64, 35, 9, 10);

  // foot nand

  line(27, 50, b/10, b/55);
  line(64, 57, 78, 45);
  line(35, 75, 25, 85);
  line(55, 75, 65, 85);

  line(25, 85, 40, 85);
  line(65, 85, 75, 80);
  // the sence of touch


  fill( map(a, 0, 600, 0, 255), map(b, 0, 600, 0, 255), 0);
  pushMatrix();
  translate(86, 20);
   scale(map(a/75, 2, 10, 0, 5));
  rotate(map(b, 0, 600, 0, radians(3000)));
  ellipse(-3, -10, 13, 13);
  ellipse(-10, 1, 13, 13);
  ellipse(-1, 10, 12, 12);
  ellipse(9, 4, 12, 12);
  ellipse(9, -8, 12, 12);
  fill(#FFF412);
  ellipse(0, 0, 10, 10);

  popMatrix();
  // nose


  curve(45, 45, 47, 45, 55, 42, 60, 57);
  curve(50, 45, 55, 42, 50, 50, 40, 50);

  //mouse

  fill(#FFF412);
  triangle(31, 48, 51, 53, 40, 57);
  stroke(#1C620D);
  noFill();
  bezier(50, 10, 60, 2, 80, 5, 77, 8);

  size(600, 600);

//void draw() {

  
//translate(a=50, b=50);
//strokeWeight(1);
//fill(255);

//stroke(0);




 popMatrix() ;
}


