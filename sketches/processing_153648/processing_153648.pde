
int     num;     // the number of items in the array
float[] x;       // x-position of point
float[] y;       // y-position
float[] speed;   // speed 
float[] phase;   // phase


float[] red;
float[] green;
float[] blue;
int thegrey;
float[] dx;
float[] dy; 


void setup() {

  //Fullscreen: to make fullscreen run this sketch with presentation mode ( sketch menu > Present )
  //size(displayWidth, displayHeight);

  size(500, 500);
background(255,255,0);

  // change each value below for different visual
  num = 70;
   
  thegrey=0;

 

  // allocate size of arrays
  x = new float[num];
  y = new float[num];
  dx=new float[num];
  dy=new float[num];
  speed = new float[num];
  phase = new float[num]; 


  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    x[i] = random(width); 
    y[i] = random(height);
    
    dx[i] = random(-1, 1);
    dy[i] = random(-1, 1);
  
    speed[i] = random(1); // returns a random float bewteen 0 and 1
    phase[i] = random(TWO_PI);
    
   
    
  }

  //red = 0;
 // blue = 0;
 // green = 0;
  
}


void draw() {
  // don't clear the screen each frame by calling background()
    //background(256);
    
     for (int i=0; i<num; i++) {
       x[i] += dx[i];
  y [i]+= dy[i];
  noFill();
  stroke(0,255,0,20);
  ellipse(x[i],y[i],20,20);
       
  
     
     
      for(int j=0;j<num;j++){
      if (dist(x[i],y[i],x[j],y[j])<40){
       if (j%2==0){ stroke(256,0,0,j);
       }else{stroke(0,0,256,j);}
        line(x[i],y[i],x[j],y[j]);
      }
    }
       }
}

