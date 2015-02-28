
import netscape.javascript.*;

float dir=-1;
float tinto=255;
int r = 255;
int b = 0;
int temp;
int z = 0;
int i;
int black = 0;
int any;
int m;


void setup(){
  size(600,500);
  background(85);
  frameRate(15);
  fill(255, 255, 0);

}

void draw(){
  z = (z + 5)%20;
  m = m-2;
  
  background(64);
  ellipse(100, 100, 100+z, 100+z);    //Sun
  
  fill(50, (100+b), 72); 
  rect(0, 430, 600, 200);
  fill(0);
  rect(0, 440, 600, 30);
  fill(255);
  street(0,0);
  
  fill((137+r)+b, 137+b, 137);  //building
  rect(450+z, 250, 55, 200);
  window2(0+z,0);
  fill((137+r)+b, 137+b, 137);
  rect(500+z, 350, 80, 100);
  rect(350+z, 200, 100, 250);
  windows(0+z,0);
  fill((137+r)+b, 137+b, 137);
  rect(400+z, 300, 70, 150);
  rect(300+z, 350, 50, 100);
  window1(0+z,0);
  
  fill(pick());
  cloud((400+z)+m,0);  
  
  tinto = tinto+dir*5;  //sun change color
  if (tinto < 100){
  }
  if (tinto >255){
  }
  fill(tinto,0,0);

}

void mousePressed(){
  z = (z + 5)%20;
  dir = 0 - dir;
  temp = r;
  r = b;
  b = temp;
  
  any = black;
  black = pick();

}

color pick(){
   return color(random(255), random(255), random(255));
}

void street(int x, int y){
  for(i=0; i<15; i=i +1){
    rect(0+50*i, 450, 30, 10);
  }

}

void windows(int x, int y){
  fill(black);
  for(i=0; i<5; i=i +1){
    rect(370+x, 220+50*i, 20, 30);
  }
  for(i=0; i<5; i=i +1){
    rect(410+x, 220+50*i, 20, 30);
  }

}

void window1(int x, int y){
  fill(black);
  for(i=0; i<2; i=i +1){
    rect(310+x , 360+25*i, 10, 15);
  }
  
  for(i=0; i<2; i=i +1){
    rect(330+x , 360+25*i, 10, 15);
  }
}

void window2(int x, int y){
  fill(black);
  for(i=0; i<4; i=i +1){
    rect(465+x , 260+50*i, 20, 25);
  }

}

void cloud(int x, int y){
  for(i=0; i<5; i=i +1){
    ellipse(((200+x)+190*i), 100, 40, 20);
    ellipse(((170+x)+190*i), 90, 60, 20);
    ellipse(((180+x)+190*i), 70, 50, 30);
    ellipse(((240+x)+190*i), 70, 35, 10);
    ellipse(((215+x)+190*i), 80, 80, 30);
    ellipse(((240+x)+190*i), 90, 30, 10);
  }
  

}

