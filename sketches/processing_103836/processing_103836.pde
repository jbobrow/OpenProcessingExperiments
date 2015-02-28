
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(0);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  stroke(random(155)+100,100,255,50);
  fill(0,random(155)+100,0,70);
  
  if(mousePressed == true) { //add some interaction
    line(mouseX, mouseY, 20, 20);
  }
  else {
    fill(255,255,51);
    if (counterI == 0)
        triangle(100,0, 50,50, 150,50);
    else if (counter
