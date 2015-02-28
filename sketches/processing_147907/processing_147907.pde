
//EnergyBug

PImage pic;
int c = 1;
float a=225;

float n = 75;
float x;
float y = .05;
float noiseY;
float r = 150;
float g = 100;
float b = 125;
float m = 1;

float close;

float p = 1200;
float q = 575;
float d;
float j;


void setup() {
  size(1300, 700);
  background(25);
  frameRate(12);
}

void draw() {

fill(25,75);
rect(-20,-20,1400,750);
noFill();

close = random(160,200);

  j = random(-.5, .495);
  for (float i = 1; i < n; i= i+1.1) {
    m = m + random(.1, .2);
    y += .02;
    x = i;
    noiseY = noise(y) * height/2;
    
    float w = (noiseY/7)+i;
    float z = i - noiseY/5;
   
       strokeWeight( noiseY/500);
    
    r = r + random(-1, 1);
    g = g + random(-2, 2);
    b = b + random(-3, 3);

    fill(b, r, g, a);
    ellipse(mouseX, mouseY, 15-noiseY/20, 10-noiseY/30);

    if (r>255) {
      r=r/3;
    }
    if (r<25) {
      r = r*2;
    }
    if (g>255) {
      g=g/3;
    }
    if (g<25) {
      g = g*2;
    }
    if (b>255) {
      b=b/3;
    }   
    if (b<25) {
      b = b*2;
    }


    d = dist(p, q, mouseX, mouseY);
    if (d>175) {
      if (d>width*.60) {
        p=p+j*2;
        q=q+j*2;
      }

      a = a+.001;

if((q-mouseY<10)||(mouseY -q>10)){
  q=q+(j*1.5);
}

if(q == mouseY) {
 q=q+(j*1.5); 
}
  
      if (p<mouseX) {
        p=p+(d/2500);
        q=q+j+(d/5000);
      }
      if (p>mouseX) {
        p=p-(d/2500); 
        q=q+j+(d/5000);
      }
      if (q<mouseY) {
        q=q+(d/2500); 
        p=p+j+(d/5000);
      }
      if (q>mouseY) {
        q = q - (d/2500);
        p=p+j+(d/5000);
      }
    }

close = close + random(-2.5,2.5);

if(close<125){
 close = close + 2; 
}

if(close>250) {
 close = close -2; 
}

    if (d<close) {
      w = w*1.3;
      z = z*1.1;

      if (p<mouseX) {
        p=p-(d*j)/15;
        q=q+j;
      }
      if (p>mouseX) {
        p=p+(d*j)/12;
        q=q+j;
      }
      if (q<mouseY) {
        q=q-(d*j)/12;
        p=p-j;
      }
      if (q>mouseY) {
        q = q + (d*j)/12;
        p=p-j;
      }
      if (d<10) {
        p=p+j*1.01;
        q=q-j*1.2; 
        a=1;
      w = w*1.95;
      z = z*1.65;
      }
    }

    if (p>width-75) {
      p=p*.88;
    }
    if (p<width-(width-75)) {
      p=p*1.25;
    }
    if (q>height-75) {
      q=q*.88;
    }
    if (q<50) {
      q=q*1.5;
    }

    fill(200, 15, 75, 5);
    stroke(r, g, b, 225);
    ellipse(p, q, w, z);

  }
}

void mousePressed() {
  p= mouseX;
  q = mouseY; 
  r =r/4;
  g=g/3;
  b=b/2;
}
