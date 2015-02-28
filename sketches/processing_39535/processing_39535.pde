

int num = 100;
float[] sizer = new float [num];
float[] y = new float [num];
float[] speed = new float [num];
float[] C = new float [num];
color[] myColors = new color [5];
int[] sqcol = new int [num];

void setup(){
  size(300,300);
  
  //set up theme colors with Adobe Kulor. Middle tiffany box blue color
  //stays opaque while the rest have a translucency factor.
  myColors [0] = color(54, 203, 232, 50);
  myColors [1] = color (60, 172, 255, 50);
  myColors [2] = color (72, 255, 235);
  myColors [3] = color (54, 232, 163, 50);
  myColors [4] = color (60, 255, 124, 50);
  
  //seed the array/loop using the different variables for y-position, speed, square color, size and color
  for (int i=num-1; i>=0; i--) {
    y[i] = random (width, 0);
    speed[i] = random (-5,5);
    sqcol[i] = floor(random(0,4));
    sizer[i] = random (-50,50);
    C[i] = random (10);
  }
  noStroke();
  smooth();
}

void draw() {
  background(0);
  
  for(int i=0; i<num-1; i++) {
    
    if (height/num > 1){
      //fill squares with myColors index
      fill(myColors [sqcol[i]]);
      //draw rectangle from the y position and vary it by height
      rect(height/num * i + height/num, y[i], sizer[i], sizer[i]);
      //speed is determined by y coordinate position
      y[i] = y[i] + speed [i];
    }else{
      
      //moves rectangles in random locations along the screen so they overlap
      fill(myColors [sqcol[i]]);
      rect(height/num * i+ i * .1 + height/num, y[i], sizer[i], sizer[i]);
      y[i] = y[i] + speed [i];
    }
      
      //this resets the rectangles as they go off the page to reset and keep drawing.
      if(y[i] > width + abs(sizer[i]/2)) y[i] = abs(-sizer[i])/2;
      if(y[i] < -abs(sizer[i]/2)) y[i] = width - +abs(sizer[i]/2);
    }
  }

