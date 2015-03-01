
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
float beginX = 300.0;
float beginY = 0.0;
float endX = 0.0;
float endY = 300.0;
float distX;
float distY;
float exponent = 0.6;
float x = 0.0;
float y = 0.0;
float step = 0.003;
float pct = 0.0;
int direction = 2;
 
void setup (){
  size (300, 300);
  noStroke ();
  smooth ();
  distX = endX - beginX;
  distY = endY - beginY;
   
}
 
void draw (){
  fill (0, 2);
  rect (0, 0, width, height);
  pct += step * direction;
  if ((pct > 1.0) || (pct < 0.0)) {
    direction = direction * -1;
  }
   
  if (direction == 1) {
    x = beginX + (pct * distX);
    float e = pow (pct, exponent);
    y = beginY + (e * distY);
  }else {
    x = beginX + (pct * distX);
    float e = pow (1.0-pct, exponent*2);
    y = beginY + (e * -distY) + distY;
     
  }
exponent += 1;
  fill (148, 5, 252, 10);
  ellipse (x, y, 300, 300);
   
 
  fill (252, 104, 5, 10);
  ellipse (y, x, 300, 300);
   
 
  fill (91, 252, 5, 10);
  ellipse (x/2, y/2, 250, 250);
  fill (5, 184, 252, 10);
  ellipse (y/2, x/2, 250, 250);
  }

