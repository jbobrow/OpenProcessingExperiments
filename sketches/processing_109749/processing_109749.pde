
int x, y ;
int vx ;
int vy ;

void setup() {
  size(600, 600);

  x = 0 ;
  y = height / 2 ;
  vx = 5 ;
  vy  = 5 ;
}


void draw() {
  background(255, 166, 49);





  //translate(x-50, y-50);   << chara ni umekonda

  chara(x-50, y-50) ;
  // chara(x+222, y*3) ;
  //chara(x-150, y/2) ;

  x = x + vx ;
  y = y + vy ;


  if (x > width-40) {
    vx = -8 ;
    if (mousePressed) {
      vx = -789 ;
    }
  }


  if ( x < 36 ) {
    vx = 3;
    if (mousePressed) {
      vx = 122 ;
    }
  }



  if ( y > width-50) {
    vy =-6 ;
    if (mousePressed) {
      vy = - 155 ;
    }
  } 

  if ( y < 36) {
    vy= 7 ;
    if (mousePressed) {
      vy = 77 ;
    }

    if (mousePressed) {
      if ((mouseX > x - 40) && (mouseX < x + 60) && (mouseY > y - 50) && (mouseY < y + 50)) {
        x = mouseX ;
        y = mouseY ;
      }
    }
  }
  if (mousePressed) {

    strokeWeight(12);
    line(100, 20, 100, 150 );
    line(170, 40, 150, 150 );
    line(30, 40, 50, 150 );

    line(500, 20, 500, 150 );
    line(570, 40, 550, 150 );
    line(430, 40, 450, 150 );

    ellipse(100, 250, 333, 333);
    ellipse(500, 250, 333, 333);

    pushMatrix();
    translate(122, 333);
    rotate(map(x, y, 600, 0, 222));
    //ellipse(60,38,20,20);
    ellipse(2, -5, 20, 20);

    //hitomi
    fill(250, 3, 23);
    ellipse(0, 0, 5, 5);
    popMatrix();


    fill(250);
    pushMatrix();
    translate(388, 322);
    rotate(map(x, y, 600, 0, -22));
    //ellipse(20,38,20,20);
    ellipse(-3, -4, 20, 20);

    //hitomi
    fill(250, 3, 23);
    ellipse(0, 0, 5, 5);
    popMatrix();
  }
}

void chara(int a, int b) {
  pushMatrix() ;

  translate(a, b) ; 

  fill(0);

  triangle(30, 85, 40, 60, 86, 85);

  ellipse(40, 50, 50, 50);
  //kutibasi
  fill(251, 255, 59);
  ellipse(40, 55, 10, 20);

 if (mousePressed) {
    background(x, 50, y);
  }
  //me
  fill(250);
  ellipse(60, 35, x/22, y/22);
  ellipse(20, 35, x/22, y/22) ;


  fill(250, 3, 23);
  ellipse(17, 34, 2, 2);
  ellipse(62, 33, 2, 2);


  strokeWeight(5);
  line(30, 40, 40, 10);
  line(50, 40, 40, 10);

  strokeWeight(2);
  fill(250);
  line(28, 58, 52, 58);
  line(65, 83, 84, 70);

  ellipse(84, 70, x/30, x/30);

  line(40, 85, 40, 95);
  if (mousePressed) {
    line(40, 85, 40, x);
    line(50, 85, 50, x);
    line(60, 85, 60, x);
    line(70, 85, 70, x);
  }
  line(50, 85, 50, 95);
  line(60, 85, 60, 95);
  line(70, 85, 70, 95);



  //asi saki
  line(37, 95, 40, 95);
  line(47, 95, 50, 95);
  line(57, 95, 60, 95);
  line(67, 95, 70, 95);



  popMatrix() ;
}



