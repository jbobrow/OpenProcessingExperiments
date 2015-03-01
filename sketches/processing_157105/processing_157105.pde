
int counter;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(121, 5, 5);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;

  
  if(mousePressed == true) { //add some interaction
noStroke ();
fill (238, 74, 24);
triangle (250, 470, 0, 275, 200, 300);
triangle (250, 470, 200, 300, 250, 0);
triangle (250, 0, 300, 300, 250, 470);
triangle (250, 470, 500, 275, 300, 300);
triangle (70, 70, 170, 350, 230, 250);
triangle (430, 70, 330, 350, 270, 250);
stroke (216, 70, 25);
line (width/2, 0, width/2, width);
line (250, 400, 0, 275);
line (250, 400, 500, 275);
line (250, 360, 70, 70);
line (250, 360, 430, 70);
  }
  else {
  noStroke ();
fill (5, 121, 55);
triangle (250, 470, 0, 275, 200, 300);
triangle (250, 470, 200, 300, 250, 0);
triangle (250, 0, 300, 300, 250, 470);
triangle (250, 470, 500, 275, 300, 300);
triangle (70, 70, 170, 350, 230, 250);
triangle (430, 70, 330, 350, 270, 250);
stroke (10, 130, 60);
line (width/2, 0, width/2, width);
line (250, 400, 0, 275);
line (250, 400, 500, 275);
line (250, 360, 70, 70);
line (250, 360, 430, 70);

  }
}
