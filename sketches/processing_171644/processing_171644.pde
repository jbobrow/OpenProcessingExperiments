
int counter , x , y;

void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  x = 200;
  y = 200;
}

void draw() {  //draw function loops 
  counter++;
  stroke(10);
  line (x, y, x+1, y+1);
  //while (y< 400)
  y ++;
  //while (x<400)
  x++;
  
 } 


