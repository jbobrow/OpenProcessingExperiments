
int counter;

void setup() {  //setup function called initially, only once
  size(500, 250);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  s = width/20;
  h = height/20;
  fillc = 0
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fillc = 20+100*sin(counter*.100);
  fill(fillc,30,30,150);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    //plasma
    loadPixels();
        for (int i = 0; i < width*height; i++) {
            pixels[i] = color(abs(50*sin(counter *.00004*i)), abs(90*cos(tan(.01*i+sin(i-counter)))), 10*sin(.5*i^2)+counter % 40, 140);
        }
    updatePixels();
 
  
  
  
    // M
    rect(s, h, s*2, h*18);
    rect(s*4, h, s*2, h*12);
    rect(s*7, h, s*2, h*18);
    // I
    rect(s*10, h, s*2, h*4);
    fill(100,100,100,150);
    rect(s*10, h*6, s*2, h*13);
    // T
    fill(fillc,30,30,150);
    rect(s*13, h, s*6, h*4);
    rect(s*13, h*6, s*2, h*13);

  }
}
