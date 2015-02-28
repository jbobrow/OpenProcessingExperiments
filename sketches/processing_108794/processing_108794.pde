
float w = 300;
  float h = 175;
  float wspeed = 4;
  float hspeed = 2.5;
  float w2 = 150;
  float h2 = 25;
  float h3 =225;
  float wspeed2 = 8;
  float hspeed2 = 5;
  float hspeed3 = 2;

void setup(){
size(600,350);
strokeWeight(50);
strokeCap(SQUARE);

}

void draw(){
 display();
  move();
  bounce();
  }
  
 void display(){
  background(175);
  stroke(0);
line( w,height/2, w +400 ,height/2);
  stroke(255,0,0);
line( width,h, 0 ,h);
    stroke(255,170);

line( width/2,h2-200,width/2,h2);
line( 0,height/3,w2,height/3);
line( width/5,h3, width/5 ,h3-300);
line( width-100,h2, width-100 ,h2+200);
}

void move(){
h = h + hspeed;
w = w + wspeed;
h2 = h2 + hspeed2;
w2 = w2 + wspeed2;
h3 = h3 +hspeed3
}

void bounce(){
if (w>width || w<0) {
   wspeed = wspeed* -1;
  }
  if ( h>height || h<0) {
    hspeed = hspeed*-1;
  }
  if (w2>width || w2<0) {
   wspeed2 = wspeed2* -1;
  }
  if ( h2>height || h2<0) {
    hspeed2 = hspeed2*-1;
  }
   if (h3>height || h3<0) {
    hspeed3 = hspeed3*-1;
  }
  
//saveFrame("images/export-"+"-#####.jpeg");
//if ( frameCount >= 900 ) {
    //  exit();}
}

