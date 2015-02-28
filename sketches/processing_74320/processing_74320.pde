
final static int NORTH = 1;
final static int EAST = 2;
final static int SOUTH = 4;
final static int WEST = 8;
int localX = 256;
int localY = 256;
int keyX;
int keyY;
int result;
int speed = 16;

Bird_bug[] the_bird_bug = new Bird_bug[3];
  
void setup() {
  size( 512, 512 );
  smooth();
  result = 0;
  keyX = width/2;
  keyY = height/2;
  for (int i = 0; i < the_bird_bug.length; i++) {
    the_bird_bug[i] = new Bird_bug(localX,localY);
  }
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

  the_bird_bug[0].checkMouse();
  the_bird_bug[0].birddraw();
  the_bird_bug[1].checkKeyboard();
  the_bird_bug[1].birddraw();
  the_bird_bug[2].checkColor();
  the_bird_bug[2].birddraw();
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

class Bird_bug {
  int[] num1 = {0,1,2,4,5,10,15,20,25,27,30,32,34};
  int[] num2 = {35,38,40,45,48,50,55,60,65,80,85,90,100};
  int[] num3 = {105,110,115,120,125,128,130,135,138,140,145,160,180};
  int[] num4 = {190,200,205,215,220,225,230,235,240,255,256,512,1024};

  float c = random(255);
  
  int birdx = localX;
  int birdy = localY;

  int[] xpos = new int[115]; 
  int[] ypos = new int[115];
  
  float r = num1[0];
  float g = num3[5];
  float b = num4[9];
  float c1dir = 1;  
  float c2dir = -1;
  
  int move = abs((pmouseX - mouseX)/num1[4]);
  
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
      the_bird_bug[0].birdpos(localX,localY);
    }
  }
  

    void checkKeyboard () {
    the_bird_bug[1].birdpos(keyX,keyY);
    }
    void checkColor () {
      if (keyPressed) {
        if (key == 'f' || key == 'F') {
          the_bird_bug[2].birdpos(128,128);
        } else if (key == 'r' || key == 'R') {
          the_bird_bug[2].birdpos(386,128);
        } else if (key == 'e' || key == 'E') {
          the_bird_bug[2].birdpos(128,386);
        } else if (key == 'q' || key == 'Q') {
          the_bird_bug[2].birdpos(386,386);
        }
      }

    }
    
  void lower_jaw() {
    fill(num4[9],num4[7],num4[6]);
    stroke(num4[9],num4[7],num4[6]);
    strokeWeight(num1[3]);
    triangle(birdx-num2[4],birdy+num2[5],birdx,birdy+num3[7],birdx-num1[7],birdy+num3[3]);
    triangle(birdx-num2[6],birdy+num2[5],birdx,birdy+num3[7],birdx+num2[6],birdy+num2[5]);
    triangle(birdx+num2[4],birdy+num2[5],birdx,birdy+num3[7],birdx+num1[7],birdy+num3[3]);
    
    stroke(num4[9],num4[1],num4[1]); //Gums
    strokeWeight(num1[3]);
    line(birdx-num2[4],birdy+num2[6],birdx-num1[7],birdy+num3[3]);
    line(birdx-num1[7],birdy+num3[3],birdx-num1[5],birdy+num3[6]);
    line(birdx-num1[5],birdy+num3[6],birdx,birdy+num3[7]);
    line(birdx,birdy+num3[7],birdx+num1[5],birdy+num3[6]);
    line(birdx+num1[5],birdy+num3[6],birdx+num1[7],birdy+num3[3]);
    line(birdx+num1[7],birdy+num3[3],birdx+num2[4],birdy+num2[6]);
  }
  
  void head() {
    stroke(num4[0]);
    strokeWeight(num1[1]);
    fill(num4[9],num4[9],num4[7]);
    ellipse(birdx,birdy+num1[5],num3[9],num3[6]); //head
  }
  
  void antennae() {
    int a = num3[5];
     r = r + c1dir;
  //  g = g + c2dir;
    b = b + c2dir;
   if (r < num1[0] || r > num4[9]) {
      r = r + c1dir;
      c1dir *= -num1[1];
    }
  //  if (g < c || g > num4[9]) {
  //    c2dir *= -1;
  //  } 
    if (b < num1[0] || b > num4[9]) {
      c2dir *= -num1[1];
    } 
    fill(r,g,b,a);
    triangle(birdx-num2[8],birdy,birdx-num2[7],birdy-num1[5],birdx-num3[11],birdy-num1[10]); //antennae
    triangle(birdx+num2[8],birdy,birdx+num2[7],birdy-num1[5],birdx+num3[11],birdy-num1[10]);
    triangle(birdx-num2[5],birdy-num1[10],birdx-num2[2],birdy-num2[0],birdx-num2[11],birdy-num3[3]);
    triangle(birdx+num2[5],birdy-num1[10],birdx+num2[2],birdy-num2[0],birdx+num2[11],birdy-num3[3]);
    triangle(birdx-num1[7],birdy-num2[2],birdx-num1[5],birdy-num2[2],birdx-num1[6],birdy-num3[9]);
    triangle(birdx+num1[5],birdy-num2[2],birdx+num1[7],birdy-num2[2],birdx+num1[6],birdy-num3[9]);
    
    stroke(num4[9],num4[9],num4[7]); // antennae line blockers
    line(birdx-num2[8],birdy,birdx-num2[7],birdy-num1[5]);
    line(birdx+num2[8],birdy,birdx+num2[7],birdy-num1[5]);
    line(birdx-num2[5],birdy-num1[10],birdx-num2[2],birdy-num2[0]);
    line(birdx+num2[5],birdy-num1[10],birdx+num2[2],birdy-num2[0]);
    line(birdx-num1[7],birdy-num2[2],birdx-num1[5],birdy-num2[2]);
    line(birdx+num1[5],birdy-num2[2],birdx+num1[7],birdy-num2[2]);
  }
  
  void teeth() {
    stroke(num4[7],num4[7],num4[3]);
    fill(num4[9],num4[9],num4[7]);
    triangle(birdx,birdy+num3[3],birdx-num1[5],birdy+num2[11],birdx+num1[5],birdy+num2[11]); // beak tip
    triangle(birdx-num1[7],birdy+num2[11],birdx-num1[7],birdy+num2[9],birdx-num1[5],birdy+num2[11]); // teeth beak 1
    triangle(birdx+num1[7],birdy+num2[11],birdx+num1[7],birdy+num2[9],birdx+num1[5],birdy+num2[11]); // 2
    triangle(birdx-num1[7],birdy+num3[3],birdx-num1[5],birdy+num3[6],birdx-num1[5],birdy+num3[3]); //teeth bottom 1
    triangle(birdx+num1[5],birdy+num3[6],birdx+num1[5],birdy+num3[3],birdx+num1[7],birdy+num3[3]); // 2
    triangle(birdx-num1[10],birdy+num2[12],birdx-num1[7],birdy+num2[12],birdx-num1[8],birdy+num3[1]); //teeth middle 1
    triangle(birdx+num1[10],birdy+num2[12],birdx+num1[7],birdy+num2[12],birdx+num1[8],birdy+num3[1]); // 2
    triangle(birdx-num2[1],birdy+num2[9],birdx-num1[8],birdy+num2[9],birdx-num1[12],birdy+num2[11]); //teeth top 1
    triangle(birdx+num1[9],birdy+num2[9],birdx+num2[1],birdy+num2[9],birdx+num1[11],birdy+num2[11]); // 2
  }
  
  void eyes() {
    stroke(num4[8]); // eyes
    fill(num4[4]);
    ellipse(birdx-num2[2],birdy-num1[7],num1[7],num1[5]);
    ellipse(birdx+num2[2],birdy-num1[7],num1[7],num1[5]);
    stroke(move); // pupils
    strokeWeight(num1[0]);
    fill(num4[7],birdx,birdy);
    ellipse(birdx-num2[2],birdy-num1[7],move+num1[4],move+num1[4]);
    ellipse(birdx+num2[2],birdy-num1[7],move+num1[4],move+num1[4]);
  }
  
  void nostrils() {
    stroke(num3[6]); // nostrils
    fill(num3[6]);
    ellipse(birdx-num1[7],birdy+num1[10],move+num1[4],move+num1[5]);
    ellipse(birdx+num1[7],birdy+num1[10],move+num1[4],move+num1[5]);
  }
  
  void beak() {
    strokeWeight(num1[2]);
    stroke(num4[9],num4[9],num4[7]);
    fill(num4[9],num4[9],num4[7]);
    triangle(birdx-num2[7],birdy+num2[2],birdx+num2[7],birdy+num2[2],birdx,birdy+num2[12]); // beak
    stroke(num4[7],num4[7],num4[3]);
    line(birdx+num1[5],birdy+num1[5],birdx+num2[7],birdy+num2[2]);
    line(birdx-num2[7],birdy+num2[2],birdx-num1[5],birdy+num1[5]);
    bezier(birdx-num1[5],birdy+num1[5],birdx-num1[4],birdy,birdx+num1[4],birdy,birdx+num1[5],birdy+num1[5]);
  }
  
  void mandible() {
    stroke(num4[5],num4[5],num4[2]); //Mandible 1
    triangle(birdx-num3[10],birdy+num2[10],birdx-num2[7],birdy+num2[2],birdx-num2[3],birdy+num2[6]);
    triangle(birdx-num3[10],birdy+num2[10],birdx-num3[0],birdy+num2[10],birdx-num2[3],birdy+num2[6]);
    triangle(birdx-num3[10],birdy+num2[10],birdx-num3[0],birdy+num2[10],birdx-num2[7],birdy+num3[4]);
    triangle(birdx-num3[0],birdy+num2[10],birdx-num2[7],birdy+num3[4],birdx-num2[0],birdy+num3[3]);
    triangle(birdx-num2[7],birdy+num3[4],birdx-num2[0],birdy+num3[3],birdx-num2[0],birdy+num3[6]);
    triangle(birdx-num2[0],birdy+num3[6],birdx-num2[0],birdy+num3[3],birdx-num1[7],birdy+num3[2]);
    triangle(birdx-num2[0],birdy+num3[6],birdx-num1[5],birdy+num3[2],birdx-num1[7],birdy+num3[2]);
    triangle(birdx-num1[7],birdy+num3[1],birdx-num1[7],birdy+num3[2],birdx-num1[5],birdy+num3[2]);
    
    stroke(num4[5],num4[5],num4[2]); // Mandible 2
    triangle(birdx+num2[3],birdy+num2[6],birdx+num2[7],birdy+num2[2],birdx+num3[10],birdy+num2[10]);
    triangle(birdx+num2[3],birdy+num2[6],birdx+num3[0],birdy+num2[10],birdx+num3[10],birdy+num2[10]);
    triangle(birdx+num3[0],birdy+num2[10],birdx+num3[10],birdy+num2[10],birdx+num2[7],birdy+num3[4]);
    triangle(birdx+num3[0],birdy+num2[10],birdx+num2[0],birdy+num3[3],birdx+num2[7],birdy+num3[4]);
    triangle(birdx+num2[0],birdy+num3[3],birdx+num2[0],birdy+num3[6],birdx+num2[7],birdy+num3[4]);
    triangle(birdx+num2[0],birdy+num3[3],birdx+num2[0],birdy+num3[6],birdx+num1[7],birdy+num3[2]);
    triangle(birdx+num1[5],birdy+num3[2],birdx+num2[0],birdy+num3[6],birdx+num1[7],birdy+num3[2]);
    triangle(birdx+num1[5],birdy+num3[2],birdx+num1[7],birdy+num3[1],birdx+num1[7],birdy+num3[2]);
    
    stroke(num4[9],num4[9],num4[7],num3[11]); // Mandible Line Blocker
    line(birdx-num2[7],birdy+num2[2],birdx-num2[3],birdy+num2[6]);
    line(birdx+num2[7],birdy+num2[2],birdx+num2[3],birdy+num2[6]);
  }
  
  void darkness() {
    int a = num4[9];
    
    while ( mousePressed  &&  a == num4[9] ) {
      a = num1[0];
      
    }
    if ( mousePressed == false &&  a == num1[0] ) {
      a = num4[9];
      
    }
    noStroke();
    fill(num1[0],num1[0],num1[0],a);
    rect(num4[9],num4[9],num4[12],num4[12]);
  }
  
  void tail() {
    for (int i = num1[0]; i < xpos.length-num1[1]; i ++ ) {
      xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1];
    }
    xpos[xpos.length-1] = birdx;
    ypos[ypos.length-1] = birdy;
    for (int i = num1[0]; i < xpos.length; i ++ ) {
      noStroke();
      fill(num1[7]+i*2,num1[7]+i*2,num1[0]+i*2);
      ellipse(xpos[i],ypos[i],i,i);
    }
  }
}
