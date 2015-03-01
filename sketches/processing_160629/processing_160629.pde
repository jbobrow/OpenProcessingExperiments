
int x = 100;
int dx = 1;

void setup() {  //setup function called initially, only once
  size(400,350);
  background(17,16,199);  //set background blue
  colorMode(HSB)(111,2,114);   //set colors to Hue, Saturation, Brightness mode
 }
void draw() {  //draw function loops 
  counter++;
  noStroke(29);
  fill(random(55),84,25,20);
  ellipse(x,150,50);
  x = x+dx;
  
  if (x > width);{
   dx= -1
  }
  if (x<0){
   dx=1;
   }
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 8,20);
  }
  else {
    ellipse(mouseX, mouseY, 80*sin(counter), 80*sin(counter));
  }
} 
