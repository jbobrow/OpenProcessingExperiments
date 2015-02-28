
int d;
PFont font;
PImage A1;
PImage A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16;

void setup () {
  size(640,480);
  background(0);
  colorMode(HSB, 360, 100, 100);
  smooth();
  font= loadFont("font.vlw");
  A1= loadImage("1.png");
  A2= loadImage("2.png");
  A3= loadImage("3.png");
  A4= loadImage("4.png");
  A5= loadImage("5.png");
  A6= loadImage("6.png");
  A7= loadImage("7.png");
  A8= loadImage("8.png");
  A9= loadImage("9.png");
  A10= loadImage("10.png");
  A11= loadImage("11.png");
  A12= loadImage("12.png");
  A13= loadImage("13.png");
  A14= loadImage("14.png");
  A15= loadImage("15.png");
  A16= loadImage("16.png");
  
}

void draw() {
  //background
  float h= random(0,360);
  float s=80;
  float b=100;
  fill(h,s,b);
  rect(-10,-40,700,800);

  //I <3
  pushMatrix();  
  smooth();
  textFont(font);
  textSize(65);
  float h1= random(100,360);
  float s1=50;
  float b1=100;
  fill(h1,s1,b1);
  text("I   <3          ." ,width/2-150,height/2);
  popMatrix();

  //animal
  float d = 1+ int(random(16));
  if(d==1) {
    println(d);
    image(A1,width/2+35,height/2-70);
  }
    else if(d==2) {
    println(d);
    image(A2,width/2+35,height/2-70);
  }
    else if(d==3) {
    println(d);
    image(A3,width/2+35,height/2-70);
  }
    else if(d==4) {
    println(d);
    image(A4,width/2+35,height/2-70);
  }
    else if(d==5) {
    println(d);
    image(A5,width/2+35,height/2-70);
  }    
    else if(d==6) {
    println(d);
    image(A6,width/2+35,height/2-70);
  }
    else if(d==7) {
    println(d);
    image(A7,width/2+35,height/2-70);
  }   
    else if(d==8) {
    println(d);
    image(A8,width/2+35,height/2-80);
  }  
    else if(d==9) {
    println(d);
    image(A9,width/2+35,height/2-70);
  } 
    else if(d==10) {
    println(d);
    image(A10,width/2+35,height/2-70);
  }  
    else if(d==11) {
    println(d);
    image(A11,width/2+35,height/2-70);
  }  
    else if(d==12) {
    println(d);
    image(A12,width/2+35,height/2-70);
  }  
    else if(d==13) {
    println(d);
    image(A13,width/2+35,height/2-70);
  }  
    else if(d==14) {
    println(d);
    image(A14,width/2+35,height/2-80);
  }  
    else if(d==15) {
    println(d);
    image(A15,width/2+35,height/2-70);
  }  
      else {
      println(d);
      image(A16,width/2+35,height/2-70);
    }



}


void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}


