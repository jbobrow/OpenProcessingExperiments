
int num = 10;
int s=20;

color[] c = new color[num];
int [] x = new int [num];
int [] y = new int [num];


void setup() {
  size(400, 400);
  smooth();
  for (int i = 0; i < num; i++) {
    x [i]= int(random(width));
    y [i]= int(random(height));
    c [i]= color(random(256), random(100), random(200));
  }
}
void draw() {
  background(230);
  frameRate(120);
  for (int i = 0; i < num; i++) {
    y[i]++;
    if (y[i]> (height + s)) {
      y[i] = -s;
    }
    snowman(x[i], y[i], c[i]);
    snowballs(x[i], y[i], c[i]);
  }
}


void snowman (int x, int y, color col) {
  stroke(#6C5246);
  strokeWeight(1.5);
  //arms

  if ((random(7) < 4)) {

    line(x, y+30, x+18, y-8);
    line(x, y+30, x-18, y-8);
  }
  else {
    line(x, y+30, x+25, y-6);
    line(x, y+30, x-25, y-6); 
//    line(x+11, y+10, x+21, y+25);
 //   line(x-11, y+10, x-21, y+25);
  }

  //body
  noStroke();
  fill(255);
  ellipseMode(CENTER);
  ellipse(x, y, 20, 20);
  ellipse(x, y+20, 30, 30);
  
  //button
  stroke(0);
  strokeWeight(3);
  point(x, y + 15);
  point(x, y + 20);



/*  monocle randomized
  if ((random(10))<5) {
    //monocle
    strokeWeight(.5);
    noFill();
    ellipse(x+3, y-3, 5, 5);
    line(x+5, y-3, x+5, y+3);
    //eye
    strokeWeight(2);
    point(x-3, y-3);
  }
  else {    */
    //monocle
    strokeWeight(.5);
    noFill();
    ellipse(x-3, y-3, 5, 5);
    line(x-5, y-3, x-5, y+3);
    //eye
    strokeWeight(2);
    point(x+3, y-3);
  //}



  //hat
  noStroke();
  fill(col);
  rectMode(CENTER);
  rect(x, y-15, 10, 16);
  rect(x, y-10, 20, 5);

  //nose
  fill(#FF6117);
  triangle(x, y, x+6, y+2, x, y+3);

  //scarf
  stroke(col+80);
  strokeWeight(2);
  noFill();
  arc(x, y, 20, 20, PI/4, 3*PI/4);
  noStroke();
  fill(col+80);
  rect(x+8, y+15, 3, 15);
  
}
void snowballs (int x, int y, color col) {
  //snowballs
  fill(255);
  ellipse(x*(random(7.0)),y*(random(7.0)),random(10), random(10));
  }

