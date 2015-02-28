
float w = 300;
  float h = 175;
  float wspeed = 4;
  float hspeed = 2.5;

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
  background(255);
    stroke(0);
line( w,height/2, width ,height/2);
line( width/2,0,width/2,h);
line( 0,height/3,w,height/3);
line( width/5,h, width/5 ,height);
line( width-100,h, width-100 ,height);
stroke(255,0,0);
line( width,h, 0 ,h);}

void move(){
h = h + hspeed;
w = w + wspeed;
}

void bounce(){
if (w>width || w<0) {
   wspeed = wspeed* -1;
  }
  if ( h>height || h<0) {
    hspeed = hspeed*-1;
  }
//saveFrame("images/export-"+"-#####.jpeg");
//if ( frameCount >= 900 ) {
    //  exit();}
}

