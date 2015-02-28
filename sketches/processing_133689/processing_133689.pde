
int counter;
// make some circle objects
MovingCircle myCircle=newMovingCircle
MovingCircle myCircle2=newMovingCircle

void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255); 
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 20;
}

void draw() {  //draw function loops 
  counter++;
  background(100);
  Stroke(255);
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
