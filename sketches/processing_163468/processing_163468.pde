

color c1 = color (100); 
color c2 = color (240, 240, 255);
color c3 = color (70, 70, 85);
int   states = 0; 
int time=0; 
void setup() {
  size (600, 400); 
  time=millis();
}
void draw() { 
  smooth(2);
  strokeWeight(1);
  states=0;  
  if ((time+1000)>millis()) {
    states=1;
  }
  else if ((time +2000)<millis() ) {
    time =millis() ;
  } 
  fill (c1);
  rect (10, 10, width-20, height-20, 20);
  led1();
  led2();
}
//////////////////////
void led1() { 
  translate (200, 200); 
  noStroke();
  fill (c2);
  ellipse (0, 0, 127, 125);
  for (int i=0; i<20; i++) { 
    fill(c3, 15 );
    arc(0, 0, 127, 127, radians(40-5*i), radians(140+5*i));
  }
  strokeWeight(1); 
  fill (c2);
  ellipse (0, 0, 100, 100); 
  for (int i=0; i<23; i++) {
    if (states==1) {
      fill(c3, 7);
    }
    else {
      fill(c3, 25-i);
    } 
    arc(0, 0, 97, 97, radians(190-3*i), radians(350+3*i));
  }  
  if (states==1) {
    fill (100, 0, 0);
  }
  else {
    fill (100, 0, 0) ;
  } 
  ellipse (0, 0, 50, 50);
  for (int i=0; i<8; i++) {
    if (states==1) { 
      fill (255, 100, 100, 57-i) ; 
      ellipse (0, -4, 8+5*i, 8+5*i);
      fill ( 70, 41, 41, 8-i ) ; 
      arc(0, 19, 42+2*i, 37+2*i, radians(-10), radians(190));
    }
    else { 
      fill (170, 141, 141, 21-i) ;
      arc(0, -4+i, 46, 33+i, PI, TWO_PI);
      ellipse (0, -12, 7+i, 3+i);
      fill ( 70, 41, 41, 13-i ) ; 
      arc(0, 19, 42+2*i, 37+2*i, radians(-10), radians(190));
    }
  }
  noFill(); 
  strokeWeight(5);
  stroke (0);
  ellipse (0, 0, 53, 53); 
  strokeWeight(1);
  for (int i=0; i<19;i++) { 
    if (states==1) {
      stroke (255, 0, 0, +3*i) ;
    } 
    else {
      stroke (255, 0, 0, 10) ;
    }
    ellipse (0, 0, 60+2*i, 60+2*i);
  }
}
void led2() { 
  translate (200, 0); 
  noStroke();
  fill (c2);
  ellipse (0, 0, 127, 125);
  for (int i=0; i<20; i++) { 
    fill(c3, 15 );
    arc(0, 0, 127, 127, radians(40-5*i), radians(140+5*i));
  }
  strokeWeight(1); 
  fill (c2);
  ellipse (0, 0, 100, 100); 
  for (int i=0; i<23; i++) {
    if (states==0) {
      fill(c3, 7);
    }
    else {
      fill(c3, 25-i);
    } 
    arc(0, 0, 97, 97, radians(190-3*i), radians(350+3*i));
  }  
  if (states==0) {
    fill (100, 0, 0);
  }
  else {
    fill (100, 0, 0) ;
  } 
  ellipse (0, 0, 50, 50);
  for (int i=0; i<8; i++) {
    if (states==0) { 
      fill (255, 100, 100, 57-i) ; 
      ellipse (0, -4, 8+5*i, 8+5*i);
      fill ( 70, 41, 41, 8-i ) ; 
      arc(0, 19, 42+2*i, 37+2*i, radians(-10), radians(190));
    }
    else { 
      fill (170, 141, 141, 21-i) ;
      arc(0, -4+i, 46, 33+i, PI, TWO_PI);
      ellipse (0, -12, 7+i, 3+i);
      fill ( 70, 41, 41, 13-i ) ; 
      arc(0, 19, 42+2*i, 37+2*i, radians(-10), radians(190));
    }
  }
  noFill(); 
  strokeWeight(5);
  stroke (0);
  ellipse (0, 0, 53, 53); 
  strokeWeight(1);
  for (int i=0; i<19;i++) { 
    if (states==0) {
      stroke (255, 0, 0, +3*i) ;
    } 
    else {
      stroke (255, 0, 0, 10) ;
    }
    ellipse (0, 0, 60+2*i, 60+2*i);
  }
}
