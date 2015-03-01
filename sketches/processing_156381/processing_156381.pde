
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 50;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
 background(230, 230, 230);  //set background white
 fill (234, 250, 13);

  if(mousePressed == true) { //add some interaction
    ellipse(width/2, height/2, 400, 400);
    fill (0);
    ellipse (150, 200, 20, 20);
    ellipse (350, 200, 20, 20); 
    stroke (0);
    line (100, 350, 250, 400); 
    line (250, 400, 410, 350);
    line (100, 350, 410, 350);
  }
  else {
    ellipse(width/2, height/2, 400, 400);
        fill (0);
    ellipse (150, 200, 20, 20);
    ellipse (350, 200, 20, 20);
    stroke (0);
    line (200, 350, 300, 350);
  }
}
