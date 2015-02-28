
Rain rain[]; 
float size; 
float rx; 
float ry; 
int rainCount; 


void setup() {
  size(1056, 1056);
  frameRate(26);

  rainCount = 100; 
  rain = new Rain[rainCount];
  for (int i = 0; i < rainCount; i++) {
    rx = random(-15, width); 
    ry = random(-15, -1); 
    rain[i] = new Rain(rx, ry);
  }
}

void draw() {

  background(255);
  for (int i = 0; i < rainCount; i++) {
    rain[i].make();
    rain[i].update();
  }

  stroke(255); 
  strokeWeight(8);
  line(0, height - height/4, width, height - height/4);
  line(0, height - height/8, width, height - height/8);
  
}

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
