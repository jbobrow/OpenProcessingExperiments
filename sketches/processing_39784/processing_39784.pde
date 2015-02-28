
//Homework 6.1_Arrays & Images
//Created by Adrianne Blossom
//September 27, 2011

int margin = 0;
int spacing = 30;
color[] crayon = new color[3];

void setup() {
  size(300, 300);

  //array of three "crayon" colors
  crayon[0] = color(220, 80, 230); //purple
  crayon[1] = color(230, 250, 10); //yellow
  crayon[2] = color(250, 130, 10); //orange

  //number of variables is determined by margin & spacing
  int num = int((height+margin)/spacing) * int((width+margin)/spacing); 

  noStroke();
  smooth();
}

void draw() {
  background(170,220,220);

  //Below is coding to grid the circles
  for (int y=margin; y <height-margin; y+=spacing) {

    pushMatrix();
    translate(0, spacing);

    for (int x=margin; x < width-margin; x+=spacing) {
      translate(spacing, 0); 
      pushMatrix();

      fill(choice());
      ellipse(-15 , -15, 30, 30);
      popMatrix();
    }
    popMatrix();
    translate(0, spacing);
  }
  noLoop();
}



color choice() {
  int c = int(random(3)); //chooses color randomly from array
  return crayon[c]; //returns crayon variable
}

void mousePressed() {
  background(135,190,190); 
  loop();
}


