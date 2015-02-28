
int x, y ;
int vx ;
int vy ;

int c, d ;
int vc ;
int vd ;

int e, f ;
int ve ;
int vf ;

int chara ;

//saisyo ikkai dake  syokisettei
void setup() {
  size(800, 800);
  background(#8CD2E3);
  x = 0 ;
  y = height / 2 ;
  vx = 3 ;
  vy = 5 ;
  c = 0 ;
  d = height / 2 ;
  vc =  2;
  vd = 3 ;
  e = 0 ;
  f = height / 2 ;
  ve = 100;
  vf = 300 ;
  scale(radians(90));
}


//jikkou sitsuzukeru
void draw() {
  background(#8CD2E3);

  noStroke();
  fill(255);
  ellipse(c+30, d+50, 500, 300);
  ellipse(c+200, d+150, 200, 100);
  ellipse(c+275, d+200, 75, 50);
  ellipse(c+500, d+350, 400, 150);
  ellipse(c+400, d+400, 250, 100);
  ellipse(c+300, d+450, 100, 60);
  ellipse(c+350, d+500, 80, 50);
  ellipse(c+50, d+500, 200, 100);
  ellipse(c+70, d+650, 400, 250);
  ellipse(c+100, d+450, 125, 50);
  ellipse(c+350, d-50, 400, 250);
  ellipse(c+800, d-150, 400, 150);
  ellipse(c+700, d-100, 150, 80);
  ellipse(c+50, d-300, 120, 75);
  ellipse(c-50, d-430, 400, 270);

  c = c + vc ;
  d = d + vd ;

  if (c>width-500) {
    vc = -1 ;
  }
  if (c < 50) {
    vc = 3 ;
  }
  if (d>height-400) {
    vd = -5 ;
  }
  if (d < 50) {
    vd = 3 ;
  }


  stroke(1);
  chara(x-100, y-50) ;
  chara(x, y-50);

  x = x + vx ;
  y = y + vy ;

  if (x>width-50) {
    vx = -1 ;
  }
  if (x < 50) {
    vx = 10 ;
  }
  if (y>height-400) {
    vy = -4 ;
  }
  if (y < 50) {
    vy = 2 ;
  }
  if (mousePressed) {
    background(#14204B);
    chara2(x-100, y-25);
    chara2(x, y-50);
    if (x>width-50) {
      vx = -1 ;
    }
    if (x < 50) {
      vx = 2 ;
    }
    if (y>height-450) {
      vy = -3 ;
    }
    if (y < 50) {
      vy = 1 ;
    }
    
        fill(#FAF8C5);
        pushMatrix();
    ellipse(c+50, f+50, 20, 20) ;
    ellipse(c+70, f+20, 30, 30);
    ellipse(c+100, f+60, 10, 10);
    
    e = e + ve ;
    f = f + vf ; 

    if (e>width-10) {
      ve = -200 ;
    }

    if (e < 10) {
      ve = 300 ;
    }

    if (f>height-10) {
      vf = 500 ;
    }

    if (f < 10) {
      vf = 100 ;
    }
    popMatrix();
  }
}
/*
void mouseMoved() {
  if (mousePressed) {
    fill(255);
    noStroke();
    ellipse(c+50, d+50, 120, 120) ;
    ellipse(c+70, d+20, 30, 30);
    ellipse(c+100, d+60, 10, 10);
    
    c = c + vc * 2 ;
    d = d + vd * 2 ; 

    if (c>width-100) {
      vc = -2 ;
    }

    if (c < 100) {
      vc = 3 ;
    }

    if (d>height-100) {
      vd = 5 ;
    }

    if (d < 100) {
      vd = 1 ;
    }
  }
}
*/


void chara(int a, int b) {
  pushMatrix() ;
  translate(a,b);
  scale(map(b,a,width,1.0,1.5));
  
  fill(255);
ellipse(40,y*1.2+40,7,40);

ellipse(60,y*1.2+40,7,40);

ellipse(50,y*1.2,x*1.2,7);

ellipse(50,y*1.2,50,80);



fill(0);
triangle(50,y*1.2,45,y*1.2-5,45,y*1.2+5);

fill(0);
triangle(50,y*1.2,55,y*1.2-5,55,y*1.2+5);

fill(255,0,0);
ellipse(50,y*1.2,5,5);


fill(0);
ellipse(40,y*1.2-20,5,5);

fill(0);
ellipse(60,y*1.2-20,5,5);

fill(x,y,y);
ellipse(50,y*1.2-15,10,10);

  
  popMatrix() ;
  

}


void chara2(int a, int b) {
  pushMatrix() ;
  translate(a,b);
  noStroke();
  
  fill(255);
ellipse(40,y*1.2+40,7,40);

ellipse(60,y*1.2+40,7,40);

ellipse(50,y*1.2,x*1.2,7);

ellipse(50,y*1.2,50,80);

stroke(2);
noFill();
arc(40, y*1.2-20, 5, 5, 0, PI, OPEN);

noFill();
arc(60, y*1.2-20, 5, 5, 0, PI, OPEN);

/*
fill(0);
ellipse(40,y*1.2-20,5,5);

fill(0);
ellipse(60,y*1.2-20,5,5);
*/
noStroke();
fill(196,93,112);
ellipse(50,y*1.2-15,10,10);

  
  popMatrix() ;
  

}



