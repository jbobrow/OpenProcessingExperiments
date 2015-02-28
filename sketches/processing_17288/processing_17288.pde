
float x = 100;
float y = 100;
float w = 150;
float h = 150;

float xspeed = 3;
float yspeed = 1;

void setup(){
  size(200,200);
}
  
void draw(){
  x = x + xspeed;
  y = y + yspeed;
  
  if ((x > width-95) || (x < 95)) {
    xspeed = xspeed * -1;
  }
  
  if (( y > height-95) || (y < 95)) {
    yspeed = yspeed * -1;
  }
  
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  smooth();
 
 //ducks hair
  stroke(255,0,0);
line(x,y,x+50,y-85);
line(x,y,x+25,y-90);
line(x,y,x,y-95);
line(x,y,x-25,y-90);
line(x,y,x-50,y-85);

//draw ducks body
stroke(255,150,0);
fill(255,150,0);
ellipse(x,y,w,h);

//draw ducks left eye
float r = random(255);
float g = random(255);
float b = random(255);

stroke(0,0,255);
fill(r,g,b);
ellipse(x-25,y-25,30,30);
ellipse(x-25,y-25,20,20);
ellipse(x-25,y-25,10,10);

//draw ducks right eye
stroke(255,0,0);
fill(r,g,b);
ellipse(x+25,y-25,30,30);
ellipse(x+25,y-25,20,20);
ellipse(x+25,y-25,10,10);

//draw ducks feet
noStroke();
fill(r,g,b);
ellipse(x+30,y+90,10,10);
ellipse(x-30,y+90,10,10);

//draw ducks wings
noStroke();
fill(255,100,0);
triangle(x-50,y,x-95,y+50,x-75,y);
triangle(x+50,y,x+95,y+50,x+75,y);

//draw ducks legs
stroke(255,0,0);
fill(255,0,0);
line(x+20,y+71,x+27,y+85);
line(x-20,y+71,x-27,y+85);

//draw ducks beak
//draw top
noStroke();
fill(255,100,0);
triangle(x-40,y+10,x,y+20,x+40,y+10);
//draw tongue
noStroke();
fill(250,50,0);
triangle(x-30,y+10,x,y+15,x+30,y+10);
//draw bottom
noStroke();
fill(255,100,0);
triangle(x-40,y+10,x,y+5,x+40,y+10);
}

