
int card;//card 0
int r=80;int s=470; int t=80; int u=50;
float x = 100.0;
float y = 50.0;
float targetX = 400.0; 
float targetY = 300.0;
float easing = 0.05;
//card 1
float beginX = 0.0;
float beginY = 0.0; 
float endX = 400.0;
float endY = 400.0;
float distX;
float distY;
float exponent = 7; 
float A = 100.0; 
float B = 50.0; 
float step = 0.1;
float pct = 0.0;
PImage a;
int m = 300;
int n = 200;
//card 2
PImage b;
//card 3
PImage c;
PImage o;
PImage p;
PImage q;
//card 4
int endZ;
int d=100;
int e=0;
//card 5
float diam;
float J;
float Q;

//card 6

String[] headlines1 = {
  "GAME OVER",
};

PFont f;
float l;
int index = 0;


void setup() {
  size(600, 600);
  noStroke();
  smooth();
  distX = endX - beginX;
  distY = endY - beginY;
 
  endZ = 0;

  f = createFont( "Arial",300,true); 
  l =600;
}
void draw() {
  if (card == 0) {     
    fill(255);
    rect(0, 0, width, height);
    float d = dist(x, y, targetX, targetY);
    if (d > 1.0) {
      x += (targetX -x) * easing;
      y += (targetY -y) * easing;
    }
    fill(0);
    ellipse(x, y, 50, 20);
    ellipse(x+60, y+20, 50, 20 );
    ellipse(x+120, y+40, 50, 20 );

    triangle(x-10, y, x+10, y, x, y+100);
    triangle(x+50, y+30, x+70, y+20, x+60, y+140);
    triangle(x+110, y+40, x+130, y+40, x+115, y+170);
  }
  else if (card == 1) {  
    fill(0);
    ellipse(m, n, 50, 20 );
    ellipse(m+60, n+20, 50, 20 );
    ellipse(m+120, n+40, 50, 20 );

    triangle(290, 200, 310, 200, 300, 300);
    triangle(290+60, 200+30, 310+60, 200+20, 300+60, 300+40);
    triangle(290+120, 200+40, 310+120, 200+40, 300+115, 300+70);

    fill(255);
    rect(0, 0, width/3, height/3);
    pct += step;
    if (pct < 1) {
      A = beginX + (pct * distX);
      B = beginY + (pow(pct, exponent) * distY);
    }
    fill(0);
    translate(A-290,B-140);
    rotate(-PI/6);
    rect(A-250, B-80, 60, 120);
    rect(A-350,B-40,120,30);
  }
  else if (card == 2) {                  //card 2
    b= loadImage("4.jpg");
    image(b,0,0,600,600) ;
    fill(0);
    rect(r,s,t,u);
     rect(r+320,s,t,u);
  }
  else if (card == 3) {           // card 3
    c= loadImage("5.png");        
    image(c,0,0,600,600) ;
  }

  else if (card == 4) {            //card  4
    background(255);
    fill(0);
    for (int e = 0; e < endZ; e+=100) {
      smooth();
     
      //ellipse(1)
      ellipse(d, e+100, 50, 20);
      ellipse(d, e+100, 50, 20 );
      ellipse(d, e+100, 50, 20 );
      //ellipse(2)
      ellipse(d+100, e+100, 50, 20);
      ellipse(d+100, e+100, 50, 20);
      ellipse(d+100, e+100, 50, 20);
      //ellipse(3)
      ellipse(d+200, e+100, 50, 20);
      ellipse(d+200, e+100, 50, 20);
      ellipse(d+200, e+100, 50, 20);
      //ellipse(4)
      ellipse(d+300, e+100, 50, 20);
      ellipse(d+300, e+100, 50, 20);
      ellipse(d+300, e+100, 50, 20);
      //triangle(1)
      triangle(d-10,e+100, d+10, e+100, d-5, e+200);
      triangle(d-10, e+100, d+10,e+100, d-5, e+200);
      triangle(d-10,e+100, d+10,e+100, d-5, e+200);
      //triangle(2)
      triangle(d+90,e+100, d+110, e+100, d+95, e+200);
      triangle(d+90,e+100, d+110, e+100, d+95, e+200);
      triangle(d+90,e+100, d+110, e+100, d+95, e+200);
      //triangle(3)
      triangle(d+190,e+100, d+210, e+100, d+195, e+200);
      triangle(d+190,e+100, d+210, e+100, d+195, e+100);
      triangle(d+190,e+100, d+210, e+100, d+195, e+200);
      //triangle(4)
      triangle(d+290,e+100, d+310, e+100, d+295, e+200);
      triangle(d+290,e+100, d+310, e+100, d+295, e+200);
      triangle(d+290,e+100, d+310, e+100, d+295, e+200);
    }
    endZ += 200;
    if (endZ > 250) {
      endZ = 250;
    }
  }
  else if (card == 5) {                //card 5
    fill(0);

    rect(150,180,320,160);

    fill(0);
    noStroke();
    diam = random(100);
    J = random(width);
    Q = random(height);

    ellipse(J,Q,diam,diam);
  } 
  else if (card == 6) {               //card 6
    pSix();
  }
  else if (card == 7) { 
  o= loadImage("1.png");        
    image(o,0,0,600,600) ;
  }
  
 else if (card == 8) { 
  p= loadImage("2.png");        
    image(p,0,0,600,600) ;
  }   
 else if (card == 9) { 
  q= loadImage("1.png");        
    image(q,0,0,600,600) ;
  } 
}
void mousePressed() { 

  if (card == 0) { 

    card = 1;
  } 

  else if (card == 1) { 

    card = 2;
  } 
  else if (card == 2) { 

    card = 3;
  } 
  else if (card == 3) { 
    //zuo
   if((mouseX >r ) && (mouseX < r +t ) && (mouseY > s) && (mouseY < s
    +u)) {
      card = 4;
    } 
    //you
     else if((mouseX > r) && (mouseX < r +320+t ) && (mouseY >s )
     && (mouseY < s
 +u)) {
      card = 7;
  } 
  else if (card == 3) { 

    card = 4;
  } 

  else if (card == 4) { 

    card = 5;
  } 
  else if (card == 5) {
    card = 6;
  } 
  else if (card == 6) {
    card = 3;
  }  
   else if (card == 7) {
    card = 8;
  } 
  else if (card == 8) {
    card = 9;
  } 
 else if (card == 9) {
    card = 6; 
}

  }
}

void pSix() {

  background(0);
  fill(255);
  

  textFont(f,200);
  textAlign (LEFT);

  text(headlines1[index],l,380); 
  l = l - 30;


  float w = textWidth(headlines1[index]); 
  if (l < -w) {
    l = 300;
    index = (index + 1) % headlines1.length;
  }
}



