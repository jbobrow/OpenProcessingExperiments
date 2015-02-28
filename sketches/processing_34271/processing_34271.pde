
int counter;
int moveval;

void setup() {  //setup function called initially, only once
  size(500, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  moveval = 0;
}

void draw() {  //draw function loops 
  counter ++;
  moveval = sin(PI/180*counter)*width/2;
  translate(width/2,0);
  stroke(10);
  line(moveval,0,moveval,height);
  
  noStroke();
  fill(random(255),100,255,50);
  ellipse(moveval, height/2, 80*sin(counter), 80*sin(counter));
}                     
