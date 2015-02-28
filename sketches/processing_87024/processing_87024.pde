
/*

 */

////////////////////// GLOBALS //////////////////////


////////////////////// SETUP //////////////////////

void setup() {
  size(400, 567);
  //background(255);
  smooth();
}

////////////////////// DRAW //////////////////////

void draw() {
  colorMode(RGB,100);
  float back_sec1 = map( second(), 0, 60, 0, 255);
  float back_sec2 = map( second(), 0, 60, 255, 0);
  
  pushMatrix();
  if( second() < 30) {
    fill(back_sec2);
  }
    else if( second() >= 30) {
    fill(back_sec1);
    }
    popMatrix();
  
  pushMatrix();
  if( second() < 30) {
  for (int m=0; m<height; m=m+30) {
    for (int n=0; n<height; n=n+20) {
      stroke(back_sec1, 255, 255,50);
      leftCrossBar(n,m);
      rightCrossBar(n,m);
    }
  }
  }
  else if( second() >= 30) {
    for (int m=0; m<height; m=m+30) {
    for (int n=0; n<height; n=n+20) {
      stroke(back_sec2, 255, 255,50);
      leftCrossBar(n,m);
      rightCrossBar(n,m);
    }
  }
  }
  popMatrix();
  
  pushMatrix();
  if( second() < 30) {
  for (int p=5; p<height; p=p+30) {
    for (int q=5; q<height; q=q+20) {
      stroke(255,back_sec1,255,50);
      leftCrossBar(q,p);
      rightCrossBar(q,p);
    }
  }
  }
  else if( second() >= 30) {
    for (int p=5; p<height; p=p+30) {
    for (int q=5; q<height; q=q+20) {
      stroke(255,back_sec2,255,50);
      leftCrossBar(q,p);
      rightCrossBar(q,p);
    }
  }
  }
  popMatrix();
  
  pushMatrix();
  if( second() < 30) {
  for (int a=10; a<height; a=a+30) {
    for (int b=10; b<height; b=b+20) {
      stroke(255,255,back_sec1,50);
      leftCrossBar(b,a);
      rightCrossBar(b,a);
    }
  }
  }
  else if( second() >= 30) {
    for (int a=10; a<height; a=a+30) {
    for (int b=10; b<height; b=b+20) {
      stroke(255,255,back_sec2,50);
      leftCrossBar(b,a);
      rightCrossBar(b,a);
    }
  }
  }
  popMatrix();
}


////////////////////// FUNCTIONS //////////////////////

void leftCrossBar(int x, int y) {
  strokeWeight(2);
  line(x,y,x-20,y+20);
}

void rightCrossBar(int x, int y) {
  strokeWeight(2);
  line(x-20,y,x,y+20);
} 



