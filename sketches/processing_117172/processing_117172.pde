
PFont font1; 
PImage sky, hand, star;

String p0 = "Summer Stars / Carl Sandburg"; 
String p1 = "Bend low again, night of summer stars."; 
String p2 = "So near you are, sky of summer stars,"; 
String p3 = "So near, a long-arm man can pick off stars,"; 
String p4 = "Pick off what he wants in the sky bowl,"; 
String p5 = "So near you are, summer stars,"; 
String p6 = "So near, strumming, strumming,"; 
String p7 = "So lazy and hum-strumming."; 

int page = 0;

float a;


void setup() {
  size(600, 400); 
  font1 = loadFont("ACaslonPro-Italic-48.vlw");

sky = loadImage("sky.jpg");
hand = loadImage("hand.png");
star = loadImage("star.png");
 
}




void draw() {
  textAlign(CENTER);

  if (page ==0) {
    tint(255);
    image(sky,0,0);
    fill(255);
    textFont(font1, 20); 
    text(p0, width/2, height/2);
  }
  else if (page ==1) {
    pushMatrix();
    image(sky,0,0);
    imageMode(CENTER);
    rotate(a);
    a+=0.005;
    imageMode(CORNER);
    image(sky,0,0);
    popMatrix();
    fill(0,180,180);
    textFont(font1, 20); 
    text(p1, width/2, height/2);
  }  
  else if (page ==2) {
    image(sky,0,0,1024+a,1024+a);
    a+=2;
    textFont(font1, 20); 
    text(p2, width/2, height/2);
  }
  else if (page ==3) {
    imageMode(CORNER);
    image(sky,0,0,1040+a,1040+a);
    a+=2;
    pushMatrix();
    imageMode(CENTER);
    image(hand,mouseX,mouseY,100,85);
    popMatrix();
    textFont(font1, 20); 
    text(p3, width/2, height/2);
  }
    else if (page ==4) {
    fill(255,0,180);
    imageMode(CORNER);
    image(sky,0,0);
    textFont(font1, 20); 
    text(p4, width/2, height/2);
    image(star,random(0,width),random(0,height),20,20);
    image(star,random(0,width),random(0,height),10,10);
  }
    else if (page ==5) {
      fill(255);
    image(sky,0,0,1024+a,1024+a);
    a+=2;
    textFont(font1, 20); 
    text(p5, width/2, height/2);
  }    
    else if (page ==6) {
      pushMatrix();
      tint(100,100,100+a);
      a=0;
      a+=10;
    image(sky,0,0);
    popMatrix();
    textFont(font1, 20); 
    text(p6, width/2, height/2);
  }
  else if (page ==7) {
    tint(255);
    image(sky,0,-400);
    textFont(font1, 20); 
    fill(160,190,255);
    text(p7, width/2, a+height/2);
    a+=0.5;
  }
}


void mousePressed() {
  if ( page  == 0) {
    page  = 1;
  }
   else if ( page  == 1) {
    page  = int(random(2,7));
  }
   else if ( page  == 2) {
    page  = 3;
  }
   else if ( page  == 3) {
    page  = 4;
  }
   else if ( page  == 4) {
    page  = 5;
  }
   else if ( page  == 5) {
    page  = int(random(2,7));
  }
   else if ( page  == 6) {
    page  = 7;
  }
  else if ( page  == 7) {
    page  = 0;
  }
//  else if ( page  == 1) {
//    page  = int(random(2, 4));
//  }

  //....
  println(page);
} 



