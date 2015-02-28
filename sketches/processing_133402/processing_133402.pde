
int colores;
int x=1;
int y=1;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(147,166,234);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  colores = 0;
 
}

void draw() {  //draw function loops 
  x= mouseX;
  y= mouseY;
  
  
  colores++;
  stroke(random(255),52,158,10);
  fill(random(255),100,255,50);
  
  if(mousePressed) { //add some interaction
    ellipse(x, y, 20, 20);
  }
  else {
    ellipse(x, y, 40, 40);
  }
}
