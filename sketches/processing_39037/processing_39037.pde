
int speed = 3;

int num = 300; // size of arrays

int colorIndex = 100;


float[] xdir = new float[num];
float[] ydir = new float[num];
float[] x = new float[num];
float[] y = new float[num];
float[] k = new float[num];
float[] p = new float[num];
int[] thecolors = new int[num]; //if rgb use *3, coz HSB we're using 1)




void setup() {
  colorMode(HSB, colorIndex, 100, 100);
  size(500, 500);
noStroke(); 
smooth();
  frameRate(200);
    colorMode(RGB);

  background(0);
  colorMode(HSB, colorIndex, 100, 100);

  for (int i =0; i < num; i++) {
    x[i] = random(width);
    y[i] = random(height);
    k[i]= random(width);
    p[i] = random(height);
    xdir[i] = random(1.1);
    ydir[i] = random(1.2);
    thecolors[i] = i;
  }
}


void draw() {
//  background(0);

  bFade(100);


  if (colorIndex < 100) {
    colorIndex++;
  }
  else {
    colorIndex = 0;
  }


  for (int i = 0; i<num; i++) {

    fill(colorIndex, 100, 100);

//    ellipse(x[i], y[i], 10, 10);
     fill(80, 100, 100);
        ellipse(k[i], p[i], 3, 3);
        
           fill(70, 100, 100);
        ellipse(p[i], y[i], 2, 2);
        
        
          fill(colorIndex, 100, 100);
    ellipse(x[i], y[i], 2, 2);
       


    x[i] = x[i] + xdir[i] * speed;
    y[i] = y[i] + ydir[i] * speed;
    
   
     k[i] = k[i] + xdir[i] * speed;
   
    
    

    if (x[i] > width || x[i] < 0) {
      xdir[i] = -xdir[i];
    }

    if (y[i] > height || y[i] < 0) {
      ydir[i] = -ydir[i];            
    }
  }
}


