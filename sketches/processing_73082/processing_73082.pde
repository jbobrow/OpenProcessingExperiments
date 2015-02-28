
final static int NORTH = 1;
final static int EAST = 2;
final static int SOUTH = 4;
final static int WEST = 8;
int localX = 256;
int localY = 256;
int keyX;
int keyY;
int result;
int speed = 10;

Bird_bug the_bird_bug = new Bird_bug(localX,localY);
Bird_bug son_bird_bug = new Bird_bug(localX,localY);
  
void setup() {
  size( 512, 512 );
  smooth();
  result = 0;
  keyX = width/2;
  keyY = height/2;
}

void draw() {
  background(0);
  rectMode(CENTER);
  ellipseMode(CENTER);
  switch(result) {
    case NORTH: keyY=keyY-speed; break;
    case EAST: keyX=keyX+speed; break;
    case SOUTH: keyY=keyY+speed; break;
    case WEST: keyX=keyX-speed; break;
    case NORTH|EAST: keyY=keyY-speed; keyX=keyX+speed; break;
    case NORTH|WEST: keyY=keyY-speed; keyX=keyX-speed; break;
    case SOUTH|EAST: keyY=keyY+speed; keyX=keyX+speed; break;
    case SOUTH|WEST: keyY=keyY+speed; keyX=keyX-speed; break;
  }
  son_bird_bug.birdpos(localX,localY);
//  if ( mousePressed ) {
//    localX = mouseX;
//    localY = mouseY;
//    the_bird_bug.birdpos(localX,localY);
//  }
  the_bird_bug.checkMouse();
  the_bird_bug.tail();
  the_bird_bug.lower_jaw();
  the_bird_bug.head();
  the_bird_bug.antennae();
  the_bird_bug.teeth();
  the_bird_bug.eyes();
  the_bird_bug.nostrils();
  the_bird_bug.beak();
  the_bird_bug.mandible();
  the_bird_bug.darkness();
  //Second bird
  son_bird_bug.checkKeyboard();
  son_bird_bug.tail();
  son_bird_bug.lower_jaw();
  son_bird_bug.head();
  son_bird_bug.antennae();
  son_bird_bug.teeth();
  son_bird_bug.eyes();
  son_bird_bug.nostrils();
  son_bird_bug.beak();
  son_bird_bug.mandible();
  son_bird_bug.darkness();
}

void keyPressed(){
  switch(key) {
    case('w'):case('W'):result |=NORTH;break;
    case('d'):case('D'):result |=EAST;break;
    case('s'):case('S'):result |=SOUTH;break;
    case('a'):case('A'):result |=WEST;break;
  }
}
 
void keyReleased(){  
  switch(key) {
    case('w'):case('W'):result ^=NORTH;break;
    case('d'):case('D'):result ^=EAST;break;
    case('s'):case('S'):result ^=SOUTH;break;
    case('a'):case('A'):result ^=WEST;break;
  }

}
//void keyPressed(){
//  switch(key) {
//    case('w'):case('W'):result |=NORTH;break;
//    case('d'):case('D'):result |=EAST;break;
//    case('s'):case('S'):result |=SOUTH;break;
//    case('a'):case('A'):result |=WEST;break;
//  }
//}
// 
//void keyReleased(){  
//  switch(key) {
//    case('w'):case('W'):result ^=NORTH;break;
//    case('d'):case('D'):result ^=EAST;break;
//    case('s'):case('S'):result ^=SOUTH;break;
//    case('a'):case('A'):result ^=WEST;break;
//  }
//
//}

//void keyPressed() {
//  if(key=='w'||key=='W') {
//    keyY -= speed;
//  }
//  if(key=='a'||key=='A') {
//    keyX -= speed;
//  }
//  if(key=='s'||key=='S') {
//    keyY += speed;
//  }
//  if(key=='d'||key=='D') {
//    keyX += speed;
//  }
//  if(keyX < 0) {
//    keyX = 0;
//  }
//  if(keyX > 512) {
//    keyX = 512;
//  }
//  if(keyY < 0) {
//    keyY = 0;
//  }
//  if(keyY > 512) {
//    keyY = 512;
//  }
//  son_bird_bug.birdpos(keyX,keyY);
//}

//class bird_bug {
//  bird_bug (int x, int y);
//  }
    


class Bird_bug {
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

  int birdx = localX;
  int birdy = localY;

  int[] xpos = new int[c28]; 
  int[] ypos = new int[c28];
  
  float r = c;
  float g = c31;
  float b = c48;
  float c1dir = 1;  
  float c2dir = -1;
  
  int move = abs((pmouseX - mouseX)/c4);
  
     Bird_bug(int birdX, int birdY) {
      birdx = birdX;
      birdy = birdY;
     }
     void birdpos(int birdX, int birdY) {
      birdx = birdX;
      birdy = birdY;
     }
      void birddraw () {
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
  void checkMouse () {
    if ( mousePressed ) {
      localX = mouseX;
      localY = mouseY;
      the_bird_bug.birdpos(localX,localY);
    }
  }
  

      void checkKeyboard () {
      son_bird_bug.birdpos(keyX,keyY);
      }
    
  void lower_jaw() {
  fill(c48,c46,c45);
  stroke(c48,c46,c45);
  strokeWeight(c3);
  triangle(birdx-c17,birdy+c18,birdx,birdy+c33,birdx-c7,birdy+c29);
  triangle(birdx-c19,birdy+c18,birdx,birdy+c33,birdx+c19,birdy+c18);
  triangle(birdx+c17,birdy+c18,birdx,birdy+c33,birdx+c7,birdy+c29);
  
  stroke(c48,c40,c40); //Gums
  strokeWeight(c3);
  line(birdx-c17,birdy+c19,birdx-c7,birdy+c29);
  //for (int f = 40; f < 80; f = f+5) {
  //  line(birdx-c17,birdy+c19,birdx-c7,birdy+c29);
  //}
  line(birdx-c7,birdy+c29,birdx-c5,birdy+c32);
  line(birdx-c5,birdy+c32,birdx,birdy+c33);
  line(birdx,birdy+c33,birdx+c5,birdy+c32);
  line(birdx+c5,birdy+c32,birdx+c7,birdy+c29);
  line(birdx+c7,birdy+c29,birdx+c17,birdy+c19);
  }
  
  void head() {
    stroke(c39);
    strokeWeight(c1);
    fill(c48,c48,c46);
    ellipse(birdx,birdy+c5,c35,c32); //head
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
    triangle(birdx-c21,birdy,birdx-c20,birdy-c5,birdx-c37,birdy-c10); //antennae
    triangle(birdx+c21,birdy,birdx+c20,birdy-c5,birdx+c37,birdy-c10);
    triangle(birdx-c18,birdy-c10,birdx-c15,birdy-c13,birdx-c24,birdy-c29);
    triangle(birdx+c18,birdy-c10,birdx+c15,birdy-c13,birdx+c24,birdy-c29);
    triangle(birdx-c7,birdy-c15,birdx-c5,birdy-c15,birdx-c6,birdy-c35);
    triangle(birdx+c5,birdy-c15,birdx+c7,birdy-c15,birdx+c6,birdy-c35);
    
    stroke(c48,c48,c46); // antennae line blockers
    line(birdx-c21,birdy,birdx-c20,birdy-c5);
    line(birdx+c21,birdy,birdx+c20,birdy-c5);
    line(birdx-c18,birdy-c10,birdx-c15,birdy-c13);
    line(birdx+c18,birdy-c10,birdx+c15,birdy-c13);
    line(birdx-c7,birdy-c15,birdx-c5,birdy-c15);
    line(birdx+c5,birdy-c15,birdx+c7,birdy-c15);
  }
  
  void teeth() {
    stroke(c46,c46,c42);
    fill(c48,c48,c46);
    triangle(birdx,birdy+c29,birdx-c5,birdy+c24,birdx+c5,birdy+c24); // beak tip
    triangle(birdx-c7,birdy+c24,birdx-c7,birdy+c22,birdx-c5,birdy+c24); // teeth beak 1
    triangle(birdx+c7,birdy+c24,birdx+c7,birdy+c22,birdx+c5,birdy+c24); // 2
    triangle(birdx-c7,birdy+c29,birdx-c5,birdy+c32,birdx-c5,birdy+c29); //teeth bottom 1
    triangle(birdx+c5,birdy+c32,birdx+c5,birdy+c29,birdx+c7,birdy+c29); // 2
    triangle(birdx-c10,birdy+c25,birdx-c7,birdy+c25,birdx-c8,birdy+c27); //teeth middle 1
    triangle(birdx+c10,birdy+c25,birdx+c7,birdy+c25,birdx+c8,birdy+c27); // 2
    triangle(birdx-c14,birdy+c22,birdx-c8,birdy+c22,birdx-c12,birdy+c24); //teeth top 1
    triangle(birdx+c9,birdy+c22,birdx+c14,birdy+c22,birdx+c11,birdy+c24); // 2
  }
  
  void eyes() {
    stroke(c47); // eyes
    fill(c43);
    ellipse(birdx-c15,birdy-c7,c7,c5);
    ellipse(birdx+c15,birdy-c7,c7,c5);
    stroke(move); // pupils
    strokeWeight(c);
    fill(c46,birdx,birdy);
    ellipse(birdx-c15,birdy-c7,move+c4,move+c4);
    ellipse(birdx+c15,birdy-c7,move+c4,move+c4);
  }
  
  void nostrils() {
    stroke(c32); // nostrils
    fill(c32);
    ellipse(birdx-c7,birdy+c10,move+c4,move+c5);
    ellipse(birdx+c7,birdy+c10,move+c4,move+c5);
  }
  
  void beak() {
    strokeWeight(c2);
    stroke(c48,c48,c46);
    fill(c48,c48,c46);
    triangle(birdx-c20,birdy+c15,birdx+c20,birdy+c15,birdx,birdy+c25); // beak
    stroke(c46,c46,c42);
    line(birdx+c5,birdy+c5,birdx+c20,birdy+c15);
    line(birdx-c20,birdy+c15,birdx-c5,birdy+c5);
    bezier(birdx-c5,birdy+c5,birdx-c4,birdy,birdx+c4,birdy,birdx+c5,birdy+c5);
  }
  
  void mandible() {
    stroke(c44,c44,c41); //Mandible 1
    triangle(birdx-c36,birdy+c23,birdx-c20,birdy+c15,birdx-c16,birdy+c19);
    triangle(birdx-c36,birdy+c23,birdx-c26,birdy+c23,birdx-c16,birdy+c19);
    triangle(birdx-c36,birdy+c23,birdx-c26,birdy+c23,birdx-c20,birdy+c30);
    triangle(birdx-c26,birdy+c23,birdx-c20,birdy+c30,birdx-c13,birdy+c29);
    triangle(birdx-c20,birdy+c30,birdx-c13,birdy+c29,birdx-c13,birdy+c32);
    triangle(birdx-c13,birdy+c32,birdx-c13,birdy+c29,birdx-c7,birdy+c28);
    triangle(birdx-c13,birdy+c32,birdx-c5,birdy+c28,birdx-c7,birdy+c28);
    triangle(birdx-c7,birdy+c27,birdx-c7,birdy+c28,birdx-c5,birdy+c28);
    
    stroke(c44,c44,c41); // Mandible 2
    triangle(birdx+c16,birdy+c19,birdx+c20,birdy+c15,birdx+c36,birdy+c23);
    triangle(birdx+c16,birdy+c19,birdx+c26,birdy+c23,birdx+c36,birdy+c23);
    triangle(birdx+c26,birdy+c23,birdx+c36,birdy+c23,birdx+c20,birdy+c30);
    triangle(birdx+c26,birdy+c23,birdx+c13,birdy+c29,birdx+c20,birdy+c30);
    triangle(birdx+c13,birdy+c29,birdx+c13,birdy+c32,birdx+c20,birdy+c30);
    triangle(birdx+c13,birdy+c29,birdx+c13,birdy+c32,birdx+c7,birdy+c28);
    triangle(birdx+c5,birdy+c28,birdx+c13,birdy+c32,birdx+c7,birdy+c28);
    triangle(birdx+c5,birdy+c28,birdx+c7,birdy+c27,birdx+c7,birdy+c28);
    
    stroke(c48,c48,c46,c37); // Mandible Line Blocker
    line(birdx-c20,birdy+c15,birdx-c16,birdy+c19);
    line(birdx+c20,birdy+c15,birdx+c16,birdy+c19);
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
    rect(c48,c48,c51,c51);
  }
  
  void tail() {
    for (int i = c; i < xpos.length-c1; i ++ ) {
      // Shift all elements down one spot. 
      // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
      xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1];
    }
    xpos[xpos.length-c1] = birdx; // Update the last spot in the array with the mouse location.
    ypos[ypos.length-c1] = birdy;
    for (int i = c; i < xpos.length; i ++ ) {
       // Draw an ellipse for each element in the arrays. 
       // Color and size are tied to the loop's counter: i.
      noStroke();
      fill(c7+i*2,c7+i*2,c+i*2);
      ellipse(xpos[i],ypos[i],i,i);
    }
  }
}
