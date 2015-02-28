
int p1Lives=3;
int p2Lives=3;
int u=350;
int d=350;  //platform 2 location
int x = 450;  //starting ball location
int y = 400;  //starting ball location
//int e = 30; //ball size
//int f = 30; //ball size
boolean w = false; //use for w key
boolean s = false; 
boolean n = false;
boolean i = false;
boolean k = false;
boolean r = false;
int panelwide=20;
int panellength1=130;
int panellength2=130;
//int ballspeed = 5;
//int xspeed = -2; ///ball speed for x
//int yspeed = 5; ///ball speed for y

void setup() {
  size(900, 800);
  background(100);
  text(""+ p1Lives, 200, 20);
  text(""+ p2Lives, 700, 20);
  strokeWeight(4);
  line(450, 0, 450, 900);
  //platform1();
  // platform2();
  //ball();
}
void draw() {
  background(100);
  text(""+ p1Lives, 200, 20);
  text(""+ p2Lives, 700, 20);
  strokeWeight(4);
  line(450, 0, 450, 900);
  ball();
  platform1();
  platform2();
  GameCheck();
  GameReset();
   
}
void GameCheck() {
  if (p1Lives <= 0) {
    text("Player 2 wins", 415, 450);
     n=false;
    //x=450;
    //y=400;
    }
  
  if (p2Lives <= 0) {
    text("Player 1 wins", 415, 450);
     n=false;
    //x=450;
    //y=400;
    }
  
}

int xspeed = 5; ///ball speed for x
int yspeed = 5; ///ball speed for y
int leftside1= x-15;
int leftside2= y-15;
int rightside1= x+15;
int rightside2= y-15;
void ball() {
  //int xspeed = 5; ///ball speed for x
  //int yspeed = 5; ///ball speed for y
  int e = 30;
  int f = 30;
  ellipse(x, y, e, f);
  if (n==true) {
    x = x - xspeed;
    y = y + yspeed;
  }
  if (x<=0) {
    p1Lives--;
    x=450;
    y=400;
    xspeed = xspeed * -1;
  }
  if (x>=900) {
    p2Lives--;
    x=450;
    y=400;
    xspeed = xspeed * -1;
    }
  
  if (y <= 0) {
    yspeed = yspeed* -1;
    //if(yspeed <= 5){
   // yspeed= yspeed+1; //increase speed each time hit wall
    //}
   // print(yspeed);
  }
  if (y >= 800) {
    yspeed = yspeed*-1;
    //if(yspeed <= 1){
   // yspeed = yspeed-1; // increase speed each time hit wall
    //}
  }
  if ((x >= 850)  && ( x <= 860) && (y >= u) && (y <= u+130)) {
    xspeed = xspeed * -1;
    
    //yspeed = yspeed + 1;
    //panellength2= panellength2-5;
    }
  if ((x <= 70 ) && (x > 60) && (y >= d) && (y <= d+130)) {
    xspeed = xspeed * -1;
    
    //yspeed = yspeed + 1;
    //panellength1= panellength1 -5;
  }

  
  
}  
//int platTOP =
//int platBOT =u + 130;
void platform1() {
  rect(850, u, panelwide, panellength2);
  if (u <= 0) {
    u=0;
  }
  if (u>= 670) {
    u=670;
  }
  if ( i==true) {
    u=u-10;
  }
  if ( k==true) {
    u=u+10;
  }
}

void platform2() {
  //int d = 350;
  rect(50, d, panelwide, panellength1);
  if (d <= 0) {
    d=0;
  }
  if (d>= 670) {
    d=670;
  }
  if ( w==true) {
    d=d-10;
  }
  if ( s==true) {
    d=d+10;
  }
}
void GameReset(){
  if( r == true){
  p1Lives=3;
  p2Lives=3;
  n=false;
  x = 450;
  y = 400;
  }
}
  
void keyPressed() {
  if (key == 'W' || key == 'w') {
    w=true;
    //d=d+50;
  }
  if (key == 'S' || key == 's') {
    s=true;
    // d=d+50;
  }
  if (key == 'N' || key == 'n') {
    n=true;
  }
  if (key == 'I' || key == 'i'){
    i=true;
  }
  if(key=='K' || key == 'k'){
    k=true;
  }
  if(key== 'R' || key == 'r'){
    r=true;
  }
}
void keyReleased() {
  if (key == 'w' || key == 'W') {
    w=false;
  }
  if (key == 's' || key == 'S') {
    s=false;
  }
  if (key == 'N' || key == 'n') {
    //n=false;
  }
  if(key == 'I' || key == 'i'){
    i=false;
  }
  if(key == 'K' || key == 'k'){
    k=false;
  }
  if(key == 'R' || key == 'r'){
    r=false;
  }
}







