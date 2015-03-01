
float[] x;
float[]y;      // current drawing position
float []dx;
float[] dy;    // change in position at each frame
float[] rad;       // radius for circle
int num;        // number of circles


void setup() {  
  size(500, 500);

 // colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
    background(255);  //set background white
  num = (int)random(50,100);
  x = new float[num];
  y = new float[num];
  dx = new float[num];
  dy = new float[num];
  rad = new float[num];
  
   //initial settings for the circles
 for (int i=0; i<num; i++){
 x[i] = random(50,450);  
 y[i] = random(50,450);
 rad[i] = random(25,50);  //size
 
   // dx and dy are the small change in position each frame
  dx[i] = random(-1, 1);
  dy[i] = random(-1, 1);
 
 }
 }

void draw() {  //draw function loops 
  

 noFill();
  
  for(int i=0; i<num; i++){
    
        // calculate new positions
  x[i] += dx[i];
  y[i] += dy[i];
  
 float max = 1;
  float min = 0.5;

  //When the shape hits the edge of the window, it reverses its direction and changes velocity
  if (x[i] > width-(rad[i]/2) || x[i] < (rad[i]/2)) {
    dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
  }

  if (y[i] > height-(rad[i]/2) || y[i] < (rad[i]/2)) {
    dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
  }  
  noStroke();
  
    ellipse(x[i], y[i], rad[i], rad[i]);
    
    //check if circles intercept, if so draw a line between them
  for(int j = 0; j<num; j++){
  if(i!=j && (dist(x[i], y[i], x[j],y[j])<=(rad[i]/2+rad[j]/2))){
    if(i%2<=0){
      stroke(180,50);
    }
    else{
      stroke(60,50);
    }
    
    line(x[i],y[i],x[j], y[j]);
    
  }
  }  
    
  }
}
