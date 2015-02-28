
/**
* Project 1 Template
* UCLA Design Media Arts, Fall 2011 
* Prof. Casey Reas
* 
* Note: Put all of your code in the "testFace" tab. Leave
* this tab and the "volume" tab as they are. You can set
* your variables at the top of "testFace".
* 
* Based on code from Lorenzo Bravi:
* http://www.lorenzobravi.com/projects/workshop-isia/
*/

float v; 
float easing = 0.2;  // Between 0 and 1
float volumeScalar = 500;
boolean mic = true;

void setup() {
  size(500, 500);
  smooth();
  setupVolume();
}

void draw() {
  background(255);

  getVolume();
  
  if (mic == false) {
    v = mouseX; 
  }
  
  testFace();
 
  //saveFrame("mask-####.png");
}


String name = "Jisun";

int x = 0;

void testFace() {
  
 v *= 2; 
  
 background(#2DA836);
 
 fill(#82CBF2);
 rect( 0, 0, 500, 322);
  
 fill(255);
 rect(49, 273.1, 71, 48.9);
 
 fill(#D81216);
 triangle( 84.5, 240, 39.7, 273.1, 129.3, 273.1);

 
 
   x=x+1;
  
  stroke(0);
  strokeWeight(3);
  //left leg
  float d1 = map(v, 0, width/2, 201.19, 190.97);
  float d2 = map(v, 0, width/2, 345.71, 418);
  float d3 = map(v, 0, width/2, 192.8, 190.97);
  float d4 = map(v, 0, width/2, 392.02, 418);
  float d5 = map(v, 0, width/2, 173.6, 171.77);
  float d6 = map(v, 0, width/2, 396.82, 422.8);
  float d7 = map(v, 0, width/2, 182.87, 181.03);
  float d8 = map(v, 0, width/2, 408.02, 434); 
  float d9 = map(v, 0, width/2, 204.8, 202.97);
  float d0 = map(v, 0, width/2, 408.02, 434);   
  
    if (v < width/2)
  {  
    beginShape(LINE);
    vertex(d1,d2);
    vertex(d3,d4);
    vertex(d3,d4);
    vertex(d5,d6);
    vertex(d3,d4);
    vertex(d7,d8);
    vertex(d3,d4);
    vertex(d9,d0);
    endShape();
  }
  
  //right leg
  
  pushMatrix();
  
  translate(width, 0);
  scale(-1, 1);
  if (v < width/2)
  {  
    beginShape(LINE);
    vertex(d1,d2);
    vertex(d3,d4);
    vertex(d3,d4);
    vertex(d5,d6);
    vertex(d3,d4);
    vertex(d7,d8);
    vertex(d3,d4);
    vertex(d9,d0);
    endShape();
  }

popMatrix();


  noStroke();
  //body
  fill(#F4E486);
  float a1 = map(v, 0, width/2, 250, 250);
  float a2 = map(v, 0, width/2, 258.42, 359.25);
  float s = map(v, 0, width/2, 200, 141.25);
  
  if (v < width/2)
  {
    ellipse(a1, a2, 200, s);
  }

  //face
  fill(#F9F092);
  float e1 = map(v, 0, width/2, 250, 250);
  float e2 = map(v, 0, width/2, 144.8, 287.14);
  float r = map(v, 0, width/2, 130, 94.53);

  if (v < width/2)
  {
    ellipse(e1, e2, 130, r);
  }

  //btm lip
  fill(#FCC341);
  float x1 = map(v, 0, width/2, 242.63, 234.99);
  float y1 = map(v, 0, width/2, 176.01, 310.69);
  float x2 = map(v, 0, width/2, 250, 250);
  float y2 = map(v, 0, width/2, 183.74, 316.98);
  float x3 = map(v, 0, width/2, 257.37, 266.28);
  float y3 = map(v, 0, width/2, 176.01, 310.69);

  if (v < width/2)
  {  
    triangle(x1, y1, x2, y2, x3, y3);
  }
  
  //top lip
  float x4 = map(v, 0, width/2, 250, 250);
  float y4 = map(v, 0, width/2, 165.8, 303.31);
  float x5 = map(v, 0, width/2, 242.63, 234.99);
  float y5 = map(v, 0, width/2, 175.74, 310.5);
  float x6 = map(v, 0, width/2, 257.37, 266.28);
  float y6 = map(v, 0, width/2, 175.74, 310.5);
  
  if (v < width/2)
  {  
    triangle(x4, y4, x5, y5, x6, y6);
  }
  
  //left eye
  fill(0);
  float q1 = map(v, 0, width/2, 12, 16.155);
  float q2 = map(v, 0, width/2, 14.399, 6.601);
  float w1 = map(v, 0, width/2, 221.6, 222.67);
  float w2 = map(v, 0, width/2, 144.8, 278.91);
  
  if (v < width/2)
  {  
    ellipse(w1, w2, q1, q2);
  }

  //right eye
  float q3 = map(v, 0, width/2, 12, 16.155); //size
  float q4 = map(v, 0, width/2, 14.399, 6.601);  //size
  float w3 = map(v, 0, width/2, 279.84, 278.67);  //location
  float w4 = map(v, 0, width/2, 144.8, 278.91);  //location

  if (v < width/2)
  {  
    ellipse(w3, w4, q3, q4);
  }
  
//-----------------------------------------------------
  
  float jitter = random(0, 4);
  
   
  stroke(0);
  strokeWeight(2);
  //left leg
  float m1 = map(v, width/2, 500, 190.97, 205.21);
  float m2 = map(v, width/2, 500, 418, 289.51);
  float m3 = map(v, width/2, 500, 190.97, 198.53);
  float m4 = map(v, width/2, 500, 418, 360.68);
  float m5 = map(v, width/2, 500, 171.77, 181.66);
  float m6 = map(v, width/2, 500, 422.8, 376.68);
  float m7 = map(v, width/2, 500, 181.03, 192.09);
  float m8 = map(v, width/2, 500, 434, 386.74); 
  float m9 = map(v, width/2, 500, 202.97, 207.66);
  float m0 = map(v, width/2, 500, 434, 383.51);   
  
    if (v > width/2)
  {  
    beginShape(LINE);
    vertex(m1,m2);
    vertex(m3,m4);
    vertex(m3,m4);
    vertex(m5,m6);
    vertex(m3,m4);
    vertex(m7,m8);
    vertex(m3,m4);
    vertex(m9,m0);
    endShape();
  }
  
  pushMatrix();
  
  translate(width, 0);
  scale(-1, 1);
  if (v > width/2)
  {  
    beginShape(LINE);
    vertex(m1,m2);
    vertex(m3,m4);
    vertex(m3,m4);
    vertex(m5,m6);
    vertex(m3,m4);
    vertex(m7,m8);
    vertex(m3,m4);
    vertex(m9,m0);
    endShape();
  }

popMatrix();
  
  noStroke();
  //body
  
  a1 = map(v, width/2, 500, 250, 250);
  a2 = map(v, width/2, 500, 359.25, 204.99);
  float f1 = map(v, width/2, 500, 200, 200);
  s = map(v, width/2, 500, 141.25, 202.58);

  //face
  
  float h1 = map(v, width/2, 500, 250, 250);
  float h2 = map(v, width/2, 500, 287.14, 78.38);
  float j1 = map(v, width/2, 500, 130, 125.79);
  float j2 = map(v, width/2, 500, 94.53, 128.93);


  //btm lip
  
  float c1 = map(v, width/2, 500, 234.99, 242.63);
  float v1 = map(v, width/2, 500, 310.69, 125+jitter);
  float c2 = map(v, width/2, 500, 250, 250);
  float v2 = map(v, width/2, 500, 316.98, 132.73+jitter);
  float c3 = map(v, width/2, 500, 266.28, 257.37);
  float v3 = map(v, width/2, 500, 310.69, 125+jitter);

  
  //top lip
  float c4 = map(v, width/2, 500, 250, 250);
  float v4 = map(v, width/2, 500, 303.31, 101.26+jitter);
  float c5 = map(v, width/2, 500, 234.99, 239.97);
  float v5 = map(v, width/2, 500, 310.5, 114.8+jitter);
  float c6 = map(v, width/2, 500, 266.28, 260.03);
  float v6 = map(v, width/2, 500, 310.5, 114.8+jitter);

  
  //left eye
  
  float b1 = map(v, width/2, 500, 16.155, 16.488);
  float b2 = map(v, width/2, 500, 6.601, 20.804);
  float n1 = map(v, width/2, 500, 222.67, 221.22);
  float n2 = map(v, width/2, 500, 278.91, 72.65);


  //right eye
  float b3 = map(v, width/2, 500, 16.155, 16.488+jitter);
  float b4 = map(v, width/2, 500, 6.601, 20.804+jitter);
  float n3 = map(v, width/2, 500, 278.67, 278.8);  //location
  float n4 = map(v, width/2, 500, 278.91, 72.65);  //location


  //rightwing

  float u1 = map(v, width/2, 500, 331, 329.14);
  float i1 = map(v, width/2, 500, 330, 148.34);
  float u2 = map(v, width/2, 500, 344, 383.62+jitter);
  float i2 = map(v, width/2, 500, 340.67, 142.85+jitter);
  float u3 = map(v, width/2, 500, 344, 349.63);
  float i3 = map(v, width/2, 500, 366, 206.56);
  

  float u4 = map(v, width/2, 500, 172, 172.86);
  float i4 = map(v, width/2, 500, 330, 144.01);
  float u5 = map(v, width/2, 500, 159, 118.38+jitter);
  float i5 = map(v, width/2, 500, 340.67, 138.51+jitter);
  float u6 = map(v, width/2, 500, 159, 152.37);
  float i6 = map(v, width/2, 500, 366, 202.23);
  
  if (v > width/2)
  {
    //body
    fill(#F4E486);
    ellipse(a1, a2, f1, s);
    //face
    fill(#F9F092);
    ellipse(h1, h2, j1, j2);
    //lips
    fill(#FCC341);
    triangle(c1, v1, c2, v2, c3, v3);
    triangle(c4, v4, c5, v5, c6, v6);
    //eyes
    fill(0);
    ellipse(n1, n2, b1, b2);
    ellipse(n3, n4, b3, b4);
    //wings
    fill(#F4E486);
    triangle(u1, i1, u2, i2, u3, i3);
    triangle(u4, i4, u5, i5, u6, i6);
  }
  
  // Credits
  fill(150);
  text(name, -240, 240);
  fill(255);
  
}


//http://code.compartmental.net/tools/minim/quickstart/


import ddf.minim.*;

Minim minim;
AudioInput in;

float s_volume;
float volume;

void setupVolume() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 512);
}

void getVolume() {

  s_volume = in.right.level() * volumeScalar;
  // println(s_volume);

  float d_volume = s_volume - volume;
  if (abs(d_volume) > 1) {
    volume += d_volume * easing;
  }
  
  v = volume;
}


void stop() {
  in.close();
  minim.stop();
  super.stop();
}



