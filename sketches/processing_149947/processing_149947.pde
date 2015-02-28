
int counter;
int x;
int y;
int v_x;
int v_y;
int t;
int offsetX;
int offsetY;

void setup() {  //setup function called initially, only once
  size(600, 500);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  x = 0;
  y = 0;
  t = 0;
  v_x = random(10);
  v_y = random(10);
  offsetX = width/2;
  offsetY = height/2;
}

void draw() {  //draw function loops 
  //background(255);
   
  t++;

  //update position
  x = v_x * t + offsetX;
  y = v_y * t + offsetY;
  
  //check for collision
  //reverse if collided
  buffer  = 0;
  vLoss = .5;
  if(x > width - buffer || x < buffer){
      if(v_x > 0)
        vLoss = -vLoss;
        
      v_x = -v_x + vLoss;
      offsetX = x;
      offsetY = y;
      t = 0;
      fill(random(255),255,255);
  }
  if(y > height - buffer || y < buffer){
      if(v_y > 0)
          vLoss = -vLoss;
       v_y = -v_y + vLoss;
       offsetX = x;
       offsetY = y;
       t = 0;
       fill(random(255),255,255);
  }
  ellipse(x,y,10,10);     
}
