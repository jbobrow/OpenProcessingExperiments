
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  //colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter+=1;
  stroke(random(255), random(255) , random(255), 50);
  noFill();
  if (counter == 500)
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
    ellipse(250, 250, counter, counter*sin(counter)));
  ellipse (width/2 ,  height/2 , counter*sin(counter), counter);
}
