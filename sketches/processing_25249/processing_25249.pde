
float x = 0;
float y = 0;
float xspeed = 100; 
float yspeed = -100;

void setup(){
  size (500,500);
  background(0);
  x = 0;
  y = 0;
}

void draw(){
  background(0);
  noStroke();
  x = x + xspeed;
  y = y + yspeed;
  fill(x,255,0);
  rect(x,y,40,40);
  fill(x,130,250,60);
  rect(x+20, y+20, 30,30);
  fill(y,20,150,50);
  rect(x-20,y-20,50,50);
  fill(y,30,250,80);
  rect(x-50,y-40,60,60);
  fill(x,60,200,80);
  rect(x-40,y+30,60,20);
  fill(x,0,255,40);
  triangle (x, y, 40,x,x,40);
  fill(y,255,0,50);
  triangle (x + 40, y, 150, y, y, 150);
  fill(y,0,30,40);
  triangle(x, y+40,300,y,y, 300);
  fill(x, 80,170, 50);
  triangle (x+40, y+40, 150,x, x, 150);
  
  if (x >=500-40){
    xspeed=-5;
  }
  if (x <=0){
    xspeed = xspeed + 1;
  }
  if (y >= 500-40){
    yspeed = -5 ;
  }
  if (y <=0){
    yspeed = 5;

  }
  }
 

