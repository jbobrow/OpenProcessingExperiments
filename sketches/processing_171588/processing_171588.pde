
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  //colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter+=1;
  stroke(random(255), random(255) , random(255), 50);
  noFill();
  if (counter == 250)
  {
  while (counter >0)
  {
  counter--;
  background(255);
  }
  }
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, counter, counter*sin(counter)));
 
}
