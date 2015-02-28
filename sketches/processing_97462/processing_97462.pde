
int x, y;
int bg = 0;
float a;
float s;
float d;
float f;
int q = 0;
int w = 0;
float e = 0;
int r = 0;
int blink = 0;

//initiallise setting
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  smooth();
  noStroke();
  //default background
  if (r == 0) { 
    background(255);
  }
  //fill background
  if (r >0) {
    background(90);
  }

  //create a circle when key is pressed
  if (e > 0) {
    fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
    q+=3;       
    ellipse(width/2, height/2, q, q);
    //println(e);
  }
  else if (e < 0) {
    fill(a, s, d, f);
    w+=3;       
    ellipse(width/2, height/2, w, w);
    //println("hello");
  }




  //int x,y;
  x = width/2-10;
  y = height/2-15;
  //x original value is 60
  //y original value is 60

  //create rect(body)
  fill(60);
  rect(x, y, 20, 60);

  //create circle(head)
  fill(10, 200, 30);
  ellipse(x+10, y-5, 50, 50);

  //create oval(eyes)
  //fill(mouseX,mouseY,mouseY);
  //ellipse(x,y-5,10,25);
  //ellipse(x+20,y-5,10,25);

  //create curve (smile)
  noFill();
  stroke(0);
  curve(x+20, y-20, x, y+10, x+20, y+10, x, y-20);
  //curve(80,40,60,70,80,70,60,40);

  //create legs
  stroke(0);
  line(x+1, y+58, x-10, y+70);
  line(x+18, y+58, x+30, y+70);

  //create hands
  line(x, y+35, x-15, y+20);
  line(x+19, y+35, x+30, y+20);

  //create a tail
  //fill(255,0,0);
  //line(x+20,y+50,pmouseX+30,pmouseY+60);
  //noFill();
  //arc(x+10,y+60,pmouseX,pmouseY,HALF_PI,PI);

  eyes();
}

void mousePressed() {
  println("OUCH!!! PLS DO NOT CLICK ME!!");
  blink = 1;
  println(blink);
}

void mouseReleased() {
  blink = 0;
  println(blink);
}

void keyPressed() {
  e = random(-1, 1);
  q = 0;
  w = 0;
  println(r); 
  a = random(0, 255);
  s = random(0, 255);
  d = random(0, 255);
  f = random(0, 255);
  blink = 1;
  r++;
  if (r == 31) {
    r = 1;
  }
}

void keyReleased() {
blink = 0;  
}

//eyes taken from source: http://www.openprocessing.org/sketch/48315
// and is edited to fit this sketch
void eyes() {
  if (blink == 0) {
    //white part of eye
    fill(255);
    ellipse (235, 225, 30, 30);
    ellipse (265, 225, 30, 30); 
    //black p art of eye
    float ax = map (mouseX, 0, width, 229, 241);
    float ay = map (mouseY, 0, height, 219, 231);

    fill(0);
    ellipse (ax, ay, 15, 15);

    float bx = map (mouseX, 0, width, 259, 271);
    float by = map (mouseY, 0, height, 219, 231);

    ellipse (bx, by, 15, 15);
  } 
  else if (blink ==1) {
    //if click the zoog blink
    //white part of eye
    fill(255);
    ellipse(235, 225, 20, 2);
    ellipse(265, 225, 20, 2);
    //black part of eye
    fill(0);
    ellipse(235, 225, 10, 2);
    ellipse(265, 225, 10, 2);
  }
}



