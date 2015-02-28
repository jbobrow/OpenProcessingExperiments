
int counter;
int x;
int y;
int v_x;
int v_y;
int t;
int offsetX;
int offsetY;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  x = 0;
  y = 0;
  t = 0;
  v_x = 8;
  v_y = 5;
  offsetX = width/2;
  offsetY = height/2;
}

void draw() {  //draw function loops 
  t++;

  //update position
  x = v_x * t + offsetX;
  y = v_y * t + offsetY;
  
  //check for collision
  //reverse if collided
  buffer  = 5;
  if(x > width - buffer || x < buffer){
      v_x = -v_x;
      offsetX = x;
      offsetY = y;
      t = 0;
      fill(random(255),random(255),random(255),random(255));
  }
  if(y > height - buffer || y < buffer){
       v_y = -v_y;
       offsetX = x;
       offsetY = y;
       t = 0;
       fill(random(255),random(255),random(255),random(255));
  }
  ellipse(x,y,10,10);    
}
