
//brad miller processing
// ex1_5

float x = 0;
float y = 0;
float xspeed = 2.2;
float yspeed = 1.5;
float r = 20;


void setup() {
  size(200,200);
  smooth();
}


void draw() {
  background(62,203,190);

  for (int c= 0; c<=width; c+=30) {
    stroke(62,126,203);
    line(0,c,width,c);
  }

  for (int d= 0; d<=height; d+=30) {
    stroke(62,126,203);
    line(d,0,d,height);
  }  

  x = x + xspeed;
  y = y + yspeed;


  if ((x > width) || (x < 0)) {


    xspeed = xspeed * -1;
    r = 40;
  }


  if ((y > height) || (y < 0)) {

    yspeed = yspeed * -1;
    r = 40;
  }


  stroke(0);
  fill(7,103,102);
  ellipse(x,y,r,r);

  r = constrain(r-2,20,40);


  //legs
  line(75,160,90,145);
  line(130,160,110,145);

  //body
  fill(200,255,0);
  rectMode(CENTER);
  rect(100,120,20,50);


  //head
  fill(252,247,162); 
  stroke(0);
  ellipse(mouseX,mouseY,60,60);


  //eyes
  fill(0);
  ellipse(115,70,20,30);
  fill(0);
  ellipse(85,70,20,30);

  println(frameRate);
}


