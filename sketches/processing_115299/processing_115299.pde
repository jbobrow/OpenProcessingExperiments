
/**
 * Array 2D. 
 * 
 * Demonstrates the syntax for creating a two-dimensional (2D) array.
 * Values in a 2D array are accessed through two index values.  
 * 2D arrays are useful for storing images. In this example, each dot 
 * is colored in relation to its distance from the center of the image. 
 */

float[] samples;
float[] guess;
float maxDistance;
float w;
int spacer;
int guess_idx;
float[] z={0};
int do_algo_time;

void setup() {
  size(640, 360);
  maxDistance = dist(width/2, height/2, width, height);
  samples = new float[width];
  guess = new float[width];
   
  z = new float[width];

  for (int x = 0; x < width; x++) {      
    z[x] = random(-100,100);      
    samples[x] = 0.5*x+10+z[x];
  }

  spacer = 10;
  w=1;
  guess_idx = 0;
  do_algo_time = 0;
  //noLoop();  // Run once and stop
}

void draw() {
  background(0);
  // This embedded loop skips over values in the arrays based on
  // the spacer variable, so there are more values in the array
  // than are drawn here. Change the value of the spacer variable
  // to change the density of the points
  
  if (do_algo_time > 1000)
     noLoop();
      
     if ((samples[guess_idx]-guess[guess_idx]) > 0) {
       w += 0.01*abs(samples[guess_idx]-guess[guess_idx]); 
     } else if ((samples[guess_idx]-guess[guess_idx]) < 0) {
       w -= 0.01*abs(samples[guess_idx]-guess[guess_idx]);
     } else {
       //do not thing
     } 
     
     guess_idx += spacer;
     
     do_algo_time++;
   

    for (int x = 0; x < width; x += spacer) {
      if(z[x] < 0)
      stroke(x,555,100);
      else
      stroke(x,20,200);
      ellipse(x + spacer/2, samples[x],10,10);
      
    }
    
    for (int x = 0; x < width; x++) {      
      guess[x] = 0.01*w*x;    
    }
    
    for (int x = 0; x < width; x++) {      
      stroke(0,255,255);   
      ellipse(x, guess[x],1,1);
      
    }
 
}





