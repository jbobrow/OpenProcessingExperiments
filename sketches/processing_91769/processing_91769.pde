
PShape e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, 
e11, e12, e13, e14, e15, e16, e17 , e18, e19, e20,
e21, e22, e23, e24, e25;
int seconds = 0, changeInt = 0;
int c1 = 0, c2 = 0, c3 = 0, c4 = 0, c5 = 0;

void setup(){
  size(160, 160, OPENGL);
  
  //setup a 5 x 5 array of circles 
  e1 = createShape(ELLIPSE, 16, 16, 32, 32);
  e2 = createShape(ELLIPSE, 48, 16, 32, 32); 
  e3 = createShape(ELLIPSE, 80, 16, 32, 32);  
  e4 = createShape(ELLIPSE, 112, 16, 32, 32);
  e5 = createShape(ELLIPSE, 144, 16, 32, 32); 
 
  e6 = createShape(ELLIPSE, 16, 48, 32, 32); 
  e7 = createShape(ELLIPSE, 48, 48, 32, 32);
  e8 = createShape(ELLIPSE, 80, 48, 32, 32); 
  e9 = createShape(ELLIPSE, 112, 48, 32, 32);
  e10 = createShape(ELLIPSE, 144, 48, 32, 32); 
 
  e11 = createShape(ELLIPSE, 16, 80, 32, 32); 
  e12 = createShape(ELLIPSE, 48, 80, 32, 32);
  e13 = createShape(ELLIPSE, 80, 80, 32, 32); 
  e14 = createShape(ELLIPSE, 112, 80, 32, 32);
  e15 = createShape(ELLIPSE, 144, 80, 32, 32); 
 
  e16 = createShape(ELLIPSE, 16, 112, 32, 32); 
  e17 = createShape(ELLIPSE, 48, 112, 32, 32);
  e18 = createShape(ELLIPSE, 80, 112, 32, 32); 
  e19 = createShape(ELLIPSE, 112, 112, 32, 32);
  e20 = createShape(ELLIPSE, 144, 112, 32, 32); 
 
  e21 = createShape(ELLIPSE, 16, 144, 32, 32); 
  e22 = createShape(ELLIPSE, 48, 144, 32, 32);
  e23 = createShape(ELLIPSE, 80, 144, 32, 32); 
  e24 = createShape(ELLIPSE, 112, 144, 32, 32);
  e25 = createShape(ELLIPSE, 144, 144, 32, 32);
}

void draw(){
 
 shape(e1);
 e1.setStroke(color(c1, c2, c3));
 e1.setFill(color(c1, c2, c3)); 
 shape(e2);
 e2.setStroke(color(c1, c3, c4));
 e2.setFill(color(c1, c3, c4));  
 shape(e3);
 e3.setStroke(color(c1, c4, c5));
 e3.setFill(color(c1, c4, c5));  
 shape(e4);
 e4.setStroke(color(c1, c5, c1));
 e4.setFill(color(c1, c5, c1));  
 shape(e5);
 e5.setStroke(color(c1, c1, c2));
 e5.setFill(color(c1, c1, c2));  
 
 shape(e6);
 e6.setStroke(color(c2, c3, c3));
 e6.setFill(color(c2, c3, c3));  
 shape(e7);
 e7.setStroke(color(c2, c4, c5));
 e7.setFill(color(c2, c4, c5));  
 shape(e8);
 e8.setStroke(color(c2, c5, c4));
 e8.setFill(color(c2, c5, c4));  
 shape(e9);
 e9.setStroke(color(c2, c1, c1));
 e9.setFill(color(c2, c1, c1));  
 shape(e10);
 e10.setStroke(color(c2, c2, c1));
 e10.setFill(color(c2, c2, c1));  
 
  
 shape(e11);
 e11.setStroke(color(c3, c2, c5));
 e11.setFill(color(c3, c2, c5));  
 shape(e12);
 e12.setStroke(color(c3, c3, c3));
 e12.setFill(color(c3, c3, c3));  
 shape(e13);
 e13.setStroke(color(c3, c4, c4));
 e13.setFill(color(c3, c4, c4));  
 shape(e14);
 e14.setStroke(color(c3, c5, c1));
 e14.setFill(color(c3, c5, c1));  
 shape(e15);
 e15.setStroke(color(c3, c1, c2));
 e15.setFill(color(c3, c1, c2));  
  
 shape(e16);
 e16.setStroke(color(c4, c5, c1));
 e16.setFill(color(c4, c5, c1));  
 shape(e17);
 e17.setStroke(color(c4, c1, c2));
 e17.setFill(color(c4, c1, c2));  
 shape(e18);
 e18.setStroke(color(c4, c2, c3));
 e18.setFill(color(c4, c2, c3));  
 shape(e19);
 e19.setStroke(color(c4, c3, c4));
 e19.setFill(color(c4, c3, c4));  
 shape(e20);
 e20.setStroke(color(c4, c1, c5));
 e20.setFill(color(c4, c1, c5));  
 
 shape(e21);
 e21.setStroke(color(c5, c2, c3));
 e21.setFill(color(c5, c2, c3));  
 shape(e22);
 e22.setStroke(color(c5, c3, c4));
 e22.setFill(color(c5, c3, c4));  
 shape(e23);
 e23.setStroke(color(c5, c4, c5));
 e23.setFill(color(c5, c4, c5));  
 shape(e24);
 e24.setStroke(color(c5, c5, c1));
 e24.setFill(color(c5, c5, c1));  
 shape(e25);
 e25.setStroke(color(c5, c1, c2));
 e25.setFill(color(c5, c1, c2));  
 
 seconds = millis()/1000;
 
 if(seconds % 1 == 0 && changeInt != seconds){
  changeInt = seconds;
  changeColor(); 
 }
}

void changeColor(){

  //have 25 circles r,g,b values equal 27 different combinations
  int rand = int(random(256));
  c1 = rand;
  
  rand = int(random(256));
  c2 = rand;
  
  rand = int(random(256));
  c3 = rand;
  
  rand = int(random(256));
  c4 = rand;
  
  rand = int(random(256));
  c5 = rand;
  
}



