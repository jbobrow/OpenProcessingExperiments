
int speed = 5;

int num = 100; // size of arrays
float a = (random(100));
float b = 400;
float c = 400;


float[] xdir = new float[num];
float[] ydir = new float[num];
float[] x = new float[num];
float[] y = new float[num];
int[] thecolors = new int[num*3];


int qdir = 1;
int rdir = 1;

int q = 0;
int r = 0;

void setup() {
  size(500, 500);
  noStroke();
  smooth();
  
  for(int i =0; i < num; i++){
    x[i] = random(width);
    y[i] = random(height);
    xdir[i] = random(1.1);
    ydir[i] = random(1.2);
  }
  for(int i = 0; i < num* 3; i +=3) {
    thecolors[i] = int(random(0, 255));
    thecolors[i + 1] = int(random(0, 255));
    thecolors[i + 2] = int(random(0, 255));
  }
  
}


void draw() {

//  background(255);



  bFade(255);

  fill(num);
  

  //  fill(#0E4BC9);
  //  ellipse(q, r, 60, 60);

  for (int i = 0; i<num; i++) {

   fill(thecolors[i], thecolors[i+1], thecolors[i+2]);
    
ellipse(x[i], y[i], random(0, 60), random(60));
ellipse(x[i], y[i], 2, 2);
    
    x[i] = x[i] + xdir[i] * speed;
    y[i] = y[i] + ydir[i] * speed;

    if (x[i] > width || x[i] < 0) {
      xdir[i] = -xdir[i];
    }

    if (y[i] > height || y[i] < 0) {
      ydir[i] = -ydir[i];
      
        a = a +3;
  if (a < 0) { 
    a = width; 
  }  
  b = b -10; 
  if (b < 0) { 
    b = width;
  } 
  c = c + 5;
  if (c < 0) { 
    c = width;
  }
  line( a, width, a, 0);  
  line(c, width, c, 0);  
  strokeWeight(random(60));
stroke( random(255), random(255), random(255), random(255));
  line( b, width, b, 0);  

//      q = q + qdir * speed;
//      r = r + rdir * speed;
//
//      if (q > width || q < 0) {
//        qdir = -qdir;
//      }
//
//      if (r > height || r < 0) {
//        rdir = -rdir;
//      }
    }
  }
}


