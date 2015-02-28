

int n_width  = 640;
int n_height = 480;
float n_x = 0, n_y = 0;

void setup(){
  size(n_width, n_height);
  frameRate(30);
  
  colorMode(HSB, 360, 255, 255, 255);
  
  background(0);
  noStroke();
  smooth();
}

void draw(){
  float n_rectW = width / 6;
  float n_rectH = height / 4;
  
  pushMatrix();
    fill(0, 50);
    rect(0, 0, width, height);
  popMatrix();
  
  if( n_x < width){
    n_x += n_rectW;
  }else if(n_x > width){
    n_x = 0;
    n_y = n_y + n_rectH;
    if(n_y > n_height)  n_y = 0;
  }
  
  float f_hue = frameCount%360;
  
  fill(f_hue, 255, 255);
  rect(n_x, n_y, n_rectW, n_rectH);
  print(n_x+"  ");
  
}

