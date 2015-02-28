
float sizer = 0.0;
float points = 0;
int count = 50;
int stroke_val = 0;
int justChanged = 0;
int changeRad = 250;


int val = 0;

float[] xpos;
float[] ypos;

void setup() {
  strokeWeight(0.6);
  size(1200, 300);
  background(245);
  smooth();
  frameRate(10);
  xpos = new float[count];
  ypos = new float[count];
}

void draw() {

  
  fill(245,2);
  rect(0,0,width,height); 
 
  starting();

  if (sizer>600) {
    stroke(255);
  }

  if (sizer>600) {
    background(245);
    stroke(0);
  }
}



void starting() {

  int i = 0; 

  if (mousePressed == true) {

    points = random(3,5);

    while (i < count) {

      sizer =  random((sizer - 2), (sizer + 2)); 
      float angle = (360/points)*i;
      float rad = radians(angle);

      xpos[i]= mouseX+ cos(rad)*sizer;
      ypos[i]= mouseY+ sin(rad)*sizer;

      i=i+1;
    }


    if (sizer > changeRad && justChanged == 0) {
      justChanged = 1;

      if (val == 0)
      {
        stroke_val = 1;
      }
      else {
        stroke_val = 0;
      }

      val = 255*stroke_val;
    }



    int u = 0;

    while ( u < count-1) {

      stroke(val);

      line(xpos[u], ypos[u], xpos[u+1], ypos[u+1]);

      u = u+1;
    }
    sizer = sizer + 7;
  }

  else {
    sizer = 0;
  }
}


void mousePressed() {

  justChanged = 0;
}
