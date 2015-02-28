
int height = 250, width = 250;
int counter;
int xone, xtwo;

void setup() {  //setup function called initially, only once
  size(width, height);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  xone = width, xtwo = height;
  counter++;
  noStroke();
  fill(random(255),250,255,50);
  
  if(mousePressed == true) { //add some interaction
    fill(random(255),counter%0,255,50); // fill with a transparency based on counter modulo 250
    
    ellipse(xtwo - mouseY, xone - mouseX, 20, 20); // create new eclipse based on mouse position
    
    ellipse((height * sin(counter) / 2.5) + (width / 2), (width * cos(counter) / 2.5) + (height / 2), 5 + (counter % 50), 5); // create a circle of ellipses
    
    rect(width/2, height/2, -80*sin(counter), 80*sin(counter));
  }
  else {
    fill(random(255),250,255,50);
    
    if (counter % 2 == 0) {
      ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
    }
    else
    {
      rect(width/2, height/2, 80*sin(counter), 80*sin(counter));
    }
  }
}
