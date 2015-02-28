
int counter;

void setup() {  //setup function called initially, only once
  size(800, 600);
  background(200,100,234);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255);
  
  if(mousePressed == true) { //add some interaction
   fill(random(255),random(255),random(255));
   rect(mouseX,mouseY,random(80,60),random(80,60));
   ellipse(mouseX, mouseY, random(100000,500000),random(10000,5000000));
  }
  else {
    ellipse(random(width), random(height), 80*sin(counter), 80*sin(counter));
  }
}
