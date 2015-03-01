
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 */

float x, y, u, v, s, t;      // current drawing position
float dx, dy, du, dv, ds, dt;    // change in position at each frame
float rad;       // radius for the moving hand

void setup() {
  size(700, 700);

  // initial position in the centre of the screen
  x = width/2;
  y = height/2;
  u = width/3;
  v = height/2;
  s = width/2;
  t = height/3;

  // dx and dy are the small change in position each frame
  dx = random(-1, 1);
  dy = random(-1, 1);
  du = random(-1, 1);
  dv = random(-1, 1);
  ds = random(-1, 1);
  dt = random(-1, 1);
  background(0);
}

void draw() {
  // blend the old frames into the background
  //blendMode(BLEND);
  fill(0, map(mouseX, 0, 500, 3, 50));
  rect(0, 0, width, height);
  rad = radians(frameCount);
  // calculate new position
  x += dx;
  y += dy;
  u += du;
  v += dv;
  s += ds;
  t += dt;
  float max = 1;
  float min = 0.5;
  //When the first shape hits the edge of the window, it reverses its direction and changes velocity
  if (x > width-100 || x < 100) {
    dx = dx > 0 ? -random(min, max) : random(min, max); }
  if (y > height-100 || y < 100) {
    dy = dy > 0 ? -random(min, max) : random(min, max); }  
  float bx = x + 100 * sin(rad);
  float by = y + 100 * cos(rad);
  fill(255);
  float radius = 100 * sin(rad*0.1);
  float handx = bx + radius * sin(rad*3);
  float handy = by + radius * cos(rad*3);

  
  //When the second shape hits the edge of the window, it reverses its direction and changes velocity
 if (u > width-100 || u < 100) {
    du = du > 0 ? -random(min, max) : random(min, max); }
 if (v > height-100 || v < 100) {
    dv = dv > 0 ? -random(min, max) : random(min, max); }
  float bu = u + 100 * sin(rad);
  float bv = v + 100 * cos(rad);
  
  float radius2 = 100 * sin(rad*0.1);
  float handu = bu + radius * sin(rad*3);
  float handv = bv + radius * cos(rad*3);

  
 //When the third shape hits the edge of the window, it reverses its direction and changes velocity
 if (s > width-100 || s < 100) {
    ds = ds > 0 ? -random(min, max) : random(min, max); }
 if (t > height-100 || t < 100) {
    dt = dt > 0 ? -random(min, max) : random(min, max); }
  float bs = s + 100 * sin(rad);
  float bt = t + 100 * cos(rad);
  fill(255);
  float radius3 = 100 * sin(rad*0.1);
  float hands = bs + radius * cos(rad*3);
  float handt = bt + radius * sin(rad*3);
  
  strokeWeight(5);
  fill(0, 0, 255);
  stroke(255, 0, 0, 100);
  line(bx, by, hands, handt);
  ellipse(handx, handy, map(mouseY, 0, 500, 1, 50), map(mouseY, 0, 500, 1, 50));
  
  fill(255, 0, 0);
  stroke(0, 255, 0, 100);
  line(bu, bv, handx, handy);
  ellipse(handu, handv, map(mouseY, 0, 500, 1, 50), map(mouseY, 0, 500, 1, 50)); 
 
  fill(0, 255, 0);
  stroke(0, 0, 255, 100);
  line(bs, bt, handu, handv);
  ellipse(hands, handt, map(mouseY, 0, 500, 1, 50), map(mouseY, 0, 500, 1, 50));
  
  float distA = dist(bx, by, bu, bv);
  float distB = dist(bu, bv, bs, bt);
  float distC = dist(bs, bt, bx, by);
  float prox = 200;
  
  if (distA < prox && distB < prox && distC< prox){
    fill(0, 255, 0);
    stroke(255, 0, 255, 100);
    line(hands, handt, handu, handv);
    line(handu, handv, handx, handy);
    line(handx, handy, hands, handt);
    //ellipse(hands, handt, 3, 3);
    //ellipse(hands, handt, 3, 3);
    //ellipse(hands, handt, 3, 3);   
  }
  
}



