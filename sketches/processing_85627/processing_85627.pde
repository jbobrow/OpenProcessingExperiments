
//Hans Nelson
//Project 001
//The warm summer night sky, laying on your back in the cool grass,
//you see the stars and the moon with the light
//of the city glowing beneath, and you try so hard
//to make out the constellations you thought you knew.

//setup, random floats
size (400, 400);
smooth();
background(0);
float g = random(130, 175);
float h = random(100, 135);
float p = random(90, 225);

//white stars layer 01
for(int i = 0; i < width; i++) {
  float t = random(2, 4);
  strokeWeight(t);
  float r = random(255);
  float x = random(0, width);
  stroke(r, g);
  point(i, x);
}

//yellow stars layer 01
for(int i = 0; i < width; i++) {
  float s = random(1, 3);
  strokeWeight(s);
  float x = random(0, width);
  stroke(255, 240, 0, h);
  point(i, x);
}

//moon
noStroke();
//noSmooth();
fill(255, 250, 190, p);
ellipse(322, 143, 24, 24);
fill(0);
ellipse(317, 139, 16, 16);

//large stars
for (int l = 1; l <= 10; l +=1) {
  float u = random(0, width);
  float j = random(0, height);
  float m = random(3, 6);
  strokeWeight(m);
  stroke(200);
  point(u, j);
}

//larger stars
for (int z = 1; z < 16; z += 1) {
  float d = random(20, 300);
  float w = random(20, 300);
  float q = random(90, 200);
  //noSmooth();
  strokeWeight(2);
  stroke(255, q);
  float v = random(7, 15);
  float a = random(5, 9);
  line(d, w, d, w + v);
  line(d, w, d, w - v);
  line(d, w, d + a, w);
  line(d, w, d - a, w);
  strokeWeight(v/2);
  stroke(255, q);
  point(d, w);
}

//backdrop, 'gradient'
noStroke();
 fill(95, 72, 115, 140);
 rect(0, 350, width, 400);
 
 fill(95, 72, 115, 100);
 rect(0, 300, width, 350);
 
 fill(95, 72, 115, 80);
 rect(0, 250, width, 300);
 
 fill(95, 72, 115, 50);
 rect(0, 200, width, 250);
 
 fill(95, 72, 115, 30);
 rect(0, 150, width, 200);



