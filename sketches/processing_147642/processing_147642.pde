
float theta = 0;
float r1 = 0;
float sz1 = 30;
float r2 = 100;  // 120 for 600x600
float r3 = r2*.715;
float r4 = r2 *.523;
float r5 = r2*.214;

float c2 = 76;
float c3 = 25;
float c4 = 153;
float c5 = 124;

int alph = 150;
int alph2 = 170;

float strkwt = 1.5;

void setup() {
  size(500, 500);
  colorMode(HSB);
  background(0, 0, 255);
  strokeWeight(1.5);
}

void draw() {
  background(0, 0, 0);
  strokeWeight(strkwt);

  translate(width/2, height/2);
  fill(175, 255, 255, alph);
  ellipse(0, 0, sz1, sz1);

  for (float x = 0; x < TWO_PI; x+=HALF_PI) {
    rotate(x);
    pushMatrix();
    rotate(radians(theta));
    stroke(c2, 255, 255, alph2);
    line(r2, 0, 0, r2);   // square
    stroke(0);
    translate(r2, 0);

    for (float y = 0; y < TWO_PI; y+=HALF_PI) {
      rotate(y);
      pushMatrix();
      rotate(radians(theta));
      stroke(c3, 255, 255, alph2);
      line(r3, 0, 0, r3);   // square
      stroke(0);
      translate(r3, 0);

      for (float z = 0; z < TWO_PI; z+=HALF_PI) {
        rotate(z);
        pushMatrix();
        rotate(radians(theta));
        stroke(c4, 255, 255, alph2);
        line(r4, 0, 0, r4);   // square
        stroke(0);
        translate(r4, 0);

        for (float k = 0; k < TWO_PI; k+=HALF_PI) {
          rotate(k);
          pushMatrix();
          rotate(radians(theta));
          stroke(c5, 255, 255, alph2);
          line(r5, 0, 0, r5);   // square
          stroke(0);
          translate(r5, 0);

          popMatrix();
        }
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }

   theta+=.5;
}

void keyPressed() {
if (key == '1'){
   r1 = 0;
   sz1 = 30;
   r2 = 100;
   r3 = r2*.715;
   r4 = r2 *.523;
   r5 = r2*.214;
}

  if (key == '2') {
    r1 = 0;
    r2 = 80;
    r3 = r2 * .7;
    r4 = r2 * .5;
    r5 = r2 * .5;
  }
  if (key == '3') {
    r1 = 0;
    r2 = 100;
    r3 = r2 * .75;
    r4 = r2 * .423;
    r5 = r2 * .214;
  }
  if (key == '4') {
    r1 = 0;
    r2 = 90;
    r3 = r2 * .5;
    r4 = r2 * .5;
    r5 = r2 * .5;
  }
  if (key == '5') {
    r1 = 0;
    r2 = 100;
    r3 = r2 * .3;
    r4 = r2 * .6;
    r5 = r2 * .4;
  }
  
    if (key == '8') {
    c2 = 76;
    c3 = 25;
    c4 = 153;
    c5 = 124;
  }

  if (key == '9') {
    c2 = random(255);
    c3 = random(255);
    c4 = random(255);
    c5 = random(255);
  }

  
   if (key == '0'){
   r1 = 0;
   sz1 = 30;
   r2 = 100 + random(-20,10);
   r3 = r2 * (.7 + random(-.1,.1));
   r4 = r2 * (.523 + random(-.1,.1));
   r5 = r2 * (.214 + random(-.5,.5));
}

 if (key == '-'){
   alph2 = random(255); 
  }
  if (key == '='){
   alph2 = 150; 
  }

  
  if (key == '['){
   strkwt-=.1; 
  }
  if (key == ']'){
   strkwt+=.1; 
  }


}


