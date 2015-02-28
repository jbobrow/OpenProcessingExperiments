
int c = 0;  int c1 = 1;  int c2 = 2;  int c3 = 4; //0,1,2,4
int c4 = 5;  int c5 = 10;  int c6 = 15;  int c7 = 20; //5,10,15,20
int c8 = 25;  int c9 = 27;  int c10 = 30;  int c11 = 32; //25,27,30,32
int c12 = 34;  int c13 = 35;  int c14 = 38;  int c15 = 40; //34,35,38,40
int c16 = 45;  int c17 = 48;  int c18 = 50;  int c19 = 55; //45,48,50,55
int c20 = 60;  int c21 = 65;  int c22 = 80;  int c23 = 85; //60,65,80,85
int c24 = 90;  int c25 = 100;  int c26 = 105;  int c27 = 110; //90,100,105,110
int c28 = 115;  int c29 = 120;  int c30 = 125;  int c31 = 128; //115,120,125,128
int c32 = 130;  int c33 = 135;  int c34 = 138;  int c35 = 140; //130,135,138,140
int c36 = 145;  int c37 = 160;  int c38 = 180;  int c39 = 190; //145,160,180,190
int c40 = 200;  int c41 = 205;  int c42 = 215;  int c43 = 220; //200,205,215,220
int c44 = 225;  int c45 = 230; int c46 = 235;  int c47 = 240; //225,230,235,240
int c48 = 255;  int c49 = 256;  int c50 = 512; int c51 = 1024; //255,256,512,1024


int localX = c49;
int localY = c49;

int[] xpos = new int[c28]; 
int[] ypos = new int[c28];

float r = c;
float g = c31;
float b = c48;
float c1dir = 1;  
float c2dir = -1;

int move = abs((pmouseX - mouseX)/c4);

void setup() {
  size( c50, c50 );
  smooth();

}

void draw() {
  background(c);
  rectMode(CENTER);
  ellipseMode(CENTER);

  
  if ( mousePressed ) {
    localX = mouseX;
    localY = mouseY;
  }

 
  tail();
  lower_jaw();
  head();
  antennae();
  teeth();
  eyes();
  nostrils();
  beak();
  mandible();
  darkness();
} 


//class bird_bug {
//  bird_bug (int x, int y);
//  }
    



void lower_jaw() {
  fill(c48,c46,c45);
  stroke(c48,c46,c45);
  strokeWeight(c3);
  triangle(localX-c17,localY+c18,localX,localY+c33,localX-c7,localY+c29);
  triangle(localX-c19,localY+c18,localX,localY+c33,localX+c19,localY+c18);
  triangle(localX+c17,localY+c18,localX,localY+c33,localX+c7,localY+c29);
  
  stroke(c48,c40,c40); //Gums
  strokeWeight(c3);
  line(localX-c17,localY+c19,localX-c7,localY+c29);
  //for (int f = 40; f < 80; f = f+5) {
  //  line(localX-c17,localY+c19,localX-c7,localY+c29);
  //}
  line(localX-c7,localY+c29,localX-c5,localY+c32);
  line(localX-c5,localY+c32,localX,localY+c33);
  line(localX,localY+c33,localX+c5,localY+c32);
  line(localX+c5,localY+c32,localX+c7,localY+c29);
  line(localX+c7,localY+c29,localX+c17,localY+c19);
}

void head() {
  stroke(c39);
  strokeWeight(c1);
  fill(c48,c48,c46);
  ellipse(localX,localY+c5,c35,c32); //head
}

void antennae() {
   r = r + c1dir;
//  g = g + c2dir;
  b = b + c2dir;
 if (r < c || r > c48) {
    r = r + c1dir;
    c1dir *= -c1;
  }
//  if (g < c || g > c48) {
//    c2dir *= -1;
//  } 
  if (b < c || b > c48) {
    
    c2dir *= -c1;
  } 
  fill(r,g,b,c31);
  triangle(localX-c21,localY,localX-c20,localY-c5,localX-c37,localY-c10); //antennae
  triangle(localX+c21,localY,localX+c20,localY-c5,localX+c37,localY-c10);
  triangle(localX-c18,localY-c10,localX-c15,localY-c13,localX-c24,localY-c29);
  triangle(localX+c18,localY-c10,localX+c15,localY-c13,localX+c24,localY-c29);
  triangle(localX-c7,localY-c15,localX-c5,localY-c15,localX-c6,localY-c35);
  triangle(localX+c5,localY-c15,localX+c7,localY-c15,localX+c6,localY-c35);
  
  stroke(c48,c48,c46); // antennae line blockers
  line(localX-c21,localY,localX-c20,localY-c5);
  line(localX+c21,localY,localX+c20,localY-c5);
  line(localX-c18,localY-c10,localX-c15,localY-c13);
  line(localX+c18,localY-c10,localX+c15,localY-c13);
  line(localX-c7,localY-c15,localX-c5,localY-c15);
  line(localX+c5,localY-c15,localX+c7,localY-c15);
}

void teeth() {
  stroke(c46,c46,c42);
  fill(c48,c48,c46);
  triangle(localX,localY+c29,localX-c5,localY+c24,localX+c5,localY+c24); // beak tip
  triangle(localX-c7,localY+c24,localX-c7,localY+c22,localX-c5,localY+c24); // teeth beak 1
  triangle(localX+c7,localY+c24,localX+c7,localY+c22,localX+c5,localY+c24); // 2
  triangle(localX-c7,localY+c29,localX-c5,localY+c32,localX-c5,localY+c29); //teeth bottom 1
  triangle(localX+c5,localY+c32,localX+c5,localY+c29,localX+c7,localY+c29); // 2
  triangle(localX-c10,localY+c25,localX-c7,localY+c25,localX-c8,localY+c27); //teeth middle 1
  triangle(localX+c10,localY+c25,localX+c7,localY+c25,localX+c8,localY+c27); // 2
  triangle(localX-c14,localY+c22,localX-c8,localY+c22,localX-c12,localY+c24); //teeth top 1
  triangle(localX+c9,localY+c22,localX+c14,localY+c22,localX+c11,localY+c24); // 2
}

void eyes() {
  stroke(c47); // eyes
  fill(c43);
  ellipse(localX-c15,localY-c7,c7,c5);
  ellipse(localX+c15,localY-c7,c7,c5);
  stroke(move); // pupils
  strokeWeight(c);
  fill(c46,localX,localY);
  ellipse(localX-c15,localY-c7,move+c4,move+c4);
  ellipse(localX+c15,localY-c7,move+c4,move+c4);
}

void nostrils() {
  stroke(c32); // nostrils
  fill(c32);
  ellipse(localX-c7,localY+c10,move+c4,move+c5);
  ellipse(localX+c7,localY+c10,move+c4,move+c5);
}

void beak() {
  strokeWeight(c2);
  stroke(c48,c48,c46);
  fill(c48,c48,c46);
  triangle(localX-c20,localY+c15,localX+c20,localY+c15,localX,localY+c25); // beak
  stroke(c46,c46,c42);
  line(localX+c5,localY+c5,localX+c20,localY+c15);
  line(localX-c20,localY+c15,localX-c5,localY+c5);
  bezier(localX-c5,localY+c5,localX-c4,localY,localX+c4,localY,localX+c5,localY+c5);
}

void mandible() {
  stroke(c44,c44,c41); //Mandible 1
  triangle(localX-c36,localY+c23,localX-c20,localY+c15,localX-c16,localY+c19);
  triangle(localX-c36,localY+c23,localX-c26,localY+c23,localX-c16,localY+c19);
  triangle(localX-c36,localY+c23,localX-c26,localY+c23,localX-c20,localY+c30);
  triangle(localX-c26,localY+c23,localX-c20,localY+c30,localX-c13,localY+c29);
  triangle(localX-c20,localY+c30,localX-c13,localY+c29,localX-c13,localY+c32);
  triangle(localX-c13,localY+c32,localX-c13,localY+c29,localX-c7,localY+c28);
  triangle(localX-c13,localY+c32,localX-c5,localY+c28,localX-c7,localY+c28);
  triangle(localX-c7,localY+c27,localX-c7,localY+c28,localX-c5,localY+c28);
  
  
  stroke(c44,c44,c41); // Mandible 2
  triangle(localX+c16,localY+c19,localX+c20,localY+c15,localX+c36,localY+c23);
  triangle(localX+c16,localY+c19,localX+c26,localY+c23,localX+c36,localY+c23);
  triangle(localX+c26,localY+c23,localX+c36,localY+c23,localX+c20,localY+c30);
  triangle(localX+c26,localY+c23,localX+c13,localY+c29,localX+c20,localY+c30);
  triangle(localX+c13,localY+c29,localX+c13,localY+c32,localX+c20,localY+c30);
  triangle(localX+c13,localY+c29,localX+c13,localY+c32,localX+c7,localY+c28);
  triangle(localX+c5,localY+c28,localX+c13,localY+c32,localX+c7,localY+c28);
  triangle(localX+c5,localY+c28,localX+c7,localY+c27,localX+c7,localY+c28);
  
  stroke(c48,c48,c46,c37); // Mandible Line Blocker
  line(localX-c20,localY+c15,localX-c16,localY+c19);
  line(localX+c20,localY+c15,localX+c16,localY+c19);
}

void darkness() {
  int a = c48;
  while ( mousePressed  &&  a == c48 ) {
    a = c; 
  }
  
  if ( mousePressed == false &&  a == c ) {
    a = c48; 
  }
  
  noStroke();
  fill(c,c,c,a);
  rect(localX,localY,c51,c51);
}

void tail() {
  for (int i = c; i < xpos.length-c1; i ++ ) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  xpos[xpos.length-c1] = mouseX;
  ypos[ypos.length-c1] = mouseY;
  
  for (int i = c; i < xpos.length; i ++ ) {
    noStroke();
    fill(c7+i*2,c7+i*2,c+i*2);
    ellipse(xpos[i],ypos[i],i,i);
  }
}
