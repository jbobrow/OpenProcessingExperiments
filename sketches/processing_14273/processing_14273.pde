
PImage clock;
PImage chr_b_sec, chr_sec, chr_min;

int c_counter = 0;    // cor counter(timer when starting)
int d_counter = 0;    // for counter(current timer)
int p_counter = 0;    // for pause condition(timer when pause)
int counter_b_second = 0;
int counter_second = 0;
int counter_minute = 0;
boolean c_start = false;
boolean c_pause = false;

void setup() {
  size(400, 400);
  frameRate(30);
  clock = loadImage("Roman_Clock_350.png");
  chr_b_sec = loadImage("chr_b_sec.png");
  chr_sec = loadImage("chr_sec.png");
  chr_min = loadImage("chr_min.png");
  
  ellipseMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  image(clock, width/2, height/2);
  noStroke();
  fill(0);
  smooth();
}

void draw() {
  textAlign(CENTER);
  background(255);
  image(clock, width/2, height/2);
  fill(0, 128);
  // description
  text("press mouse button to use stop watch function", width/2-15, height-15);
  fill(0, 128);
  text("P5chronosphere", width/2-5,height*1/3+20); 


  int h = hour();
  if (h>12)  h = h-12;  // cause hours() return 24h-system data.

  int m = minute();
  int s = second();

  chronosphere();  
  c_hour(h, m);
  c_minute(m);
  c_second(s);
}

void c_hour(int h, int m) {
  fill(0);

  pushMatrix();
  translate(width/2, height/2);
  rotate((h-3)*(TWO_PI/12) + m*TWO_PI/12/60);  // not digital :)

  //
  pushMatrix();
  translate(-10, -5);
  rect(0,0,100, 8);
  popMatrix();
  //

  popMatrix();
}

void c_minute(int m) {
  fill(128);

  pushMatrix();
  translate(width/2, height/2);

  rotate((m-15)*(TWO_PI/60));

  //
  pushMatrix();
  translate(-10, -2);
  rect(0,0,130, 4);
  popMatrix();
  //

  popMatrix();
}

void c_second(int s) {
  fill(255, 0, 0);

  pushMatrix();
  translate(width/2, height/2);
  rotate((s-15)*(TWO_PI/60));

  //
  pushMatrix();
  translate(-15, -1);
  rect(0,0,150, 2);
  popMatrix();
  //

  popMatrix();
//  println("start :" + c_start + "/" + "pause :" + c_pause);
}

void chronosphere() {
  if(c_start) {
    d_counter = millis();
  } 

  if(c_pause) {
    counter_b_second = (p_counter - c_counter)/6;
    counter_second = (p_counter - c_counter)/1000;
  } 
  else {
    counter_b_second = (d_counter - c_counter)/6;
    counter_second = (d_counter - c_counter)/1000;
  }

  counter_minute = counter_second/60;

  textAlign(CENTER);
  
  fill(0);
  textAlign(RIGHT);
  text(counter_minute + " : ", width/2-12, height*2/3+40);
  text(counter_second%60 + " : ", width/2+15, height*2/3+40);
  text(counter_b_second%100, width/2+30, height*2/3+40);  
  text("\"", width/2+35, height*2/3+40);
  
  image(chr_b_sec, width/2+50, height*2/3-10);
  image(chr_sec, width/2, height*2/3);
  image(chr_min, width/2-50, height*2/3-10);

  // 1/10 seconds
  pushMatrix();
  translate(width/2+50, height*2/3-10);
  rotate((counter_b_second-25)*(TWO_PI/100));
  pushMatrix();
  ellipse(0,0,3,3);
  translate(-4, -0.5);
  rect(0,0,15, 1);
  popMatrix();
  popMatrix();

  // seconds
  pushMatrix();
  translate(width/2, height*2/3);
  rotate((counter_second-15)*(TWO_PI/60));
  pushMatrix();
  ellipse(0,0,3,3);
  translate(-4, -0.5);
  rect(0,0,15,1);
  popMatrix();
  popMatrix();


  // minute
  pushMatrix();
  translate(width/2-50, height*2/3-10);
  rotate((counter_minute-15)*(TWO_PI/60));
  pushMatrix();
  ellipse(0,0,3,3);
  translate(-4, -0.5);
  rect(0,0,15,1);
  popMatrix();
  popMatrix();
}

void mousePressed() {
  if(c_start) {
    if (c_pause) {  // c_start && c_pause  -- 
      c_start = false;
      c_pause = false;
      c_counter = millis();
      d_counter = millis();
    } 
    else { // c_start && !c_pause
      //c_start = true;
      c_pause = true;
      p_counter = millis();


    }
  } 
  else {  // not_start
    c_start = true;
    c_counter = millis();
  }
}



//void mousePressed() {
//  // c_start
//  // c_pause
//  
//  if(c_start){
//    c_start = false;
//    c_counter = millis();
//    d_counter = millis();
//  }  else {  // not_start
//    c_start = true;
//    c_counter = millis();
//  }
//}


