

int counter;
PImage bg;
float x=20;

void setup() {  //setup function called initially, only once
  size(700,467);
    bg = loadImage("light.jpg");
          background(bg);
          
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
    smooth();
  noStroke();
}

void draw() { 

//draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,40);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 30, 30);
  }
  }


