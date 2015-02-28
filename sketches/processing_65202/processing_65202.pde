
int speed = 10;

int num = 40; // size of arrays

int w = 0;
int dir = +1;

float[] xdir = new float[num];
float[] ydir = new float[num];
float[] x = new float[num];
float[] y = new float[num];
int[] thecolors = new int[num*3];






void setup() {
  size(1280, 720);
  noStroke();
  smooth();
  
  w = w + dir;
  if (w > 30 || w < 0) 
  dir = -dir;
  
  
  for(int i =0; i < num; i++){
    x[i] = 0;
    y[i] = 0;
//    xdir[i] = random(1.1);
    ydir[i] = random(1.2);
  }
  for(int i = 0; i < num * 3; i +=3) {
    thecolors[i] = int(random(0, 255));
    thecolors[i + 1] = int(random(0, 255));
    thecolors[i + 2] = int(random(0, 255));
  }
  
}


void draw() {





  bFade(255);

  fill(num);

  for (int i = 0; i<num; i++) {


    

stroke(thecolors[i], thecolors[i+1], thecolors[i+2], 10);
//strokeWeight(random(100));
strokeWeight(20);
strokeCap(PROJECT);
line(x[i], y[i], x[i]+width, y[i]);
strokeWeight(50);
line(x[i], y[i], x[i]+width, y[i]);

    
    x[i] = x[i] + xdir[i] * speed;
    y[i] = y[i] + ydir[i] * speed;

    if (x[i] > width || x[i] < 0) {
      xdir[i] = -xdir[i];
    }

    if (y[i] > height || y[i] < 0) {
      ydir[i] = -ydir[i];


    }
  }
}


