
int counter;

void setup() {  //setup function called initially, only once
  size(400, 400);
  background(600);  //set background red
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    square(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}


// Example 1-1: stroke and fill
size(200,200);
background(255);
stroke(0); 
fill(150);
rect(50,50,75,100);
