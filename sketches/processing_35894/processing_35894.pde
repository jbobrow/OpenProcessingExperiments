
void setup() {
  size(300, 300);
  background(255);
}


//int for the percipitation when mouse is pressed
int y=0;


void draw() {

  //this controls the left sky
  noStroke();
  fill(0, 170, 250);
  rect(0, 0, 150, 250);

  //this controls the right sky
  fill(20, 25, 60);
  rect(150, 0, 150, 250);

  //this controls the sun and moon
  if (mouseX<width/2) { //the mouse is divided between two sides
    fill(225, 255, 0);
    ellipse(75, mouseY, 50, 50); //sun with Y axis movement
  }
  else { //if the mouse is not on the left then the right will do this
    fill(255);
    ellipse(225, mouseY, 50, 50); //moon with Y axis movement
  }

  //right side of the dark grass
  fill(25, 50, 20);
  rect(150, 250, 150, 50);

  //left side green grass
  fill(0, 255, 0);
  rect(0, 250, 150, 50);



  //this is what occurs once the mouse is pressed
  if (mousePressed) {

    //this controls the snow on the right side
    stroke(255);
    strokeWeight(6);
    point(160, y);
    point(180, y+10);
    point(200, y+5);
    point(230, y+15);
    point(240, y);
    point(250, y+5);
    point(280, y+15);

    //this controls the rain on the left side
    stroke(0, 0, 255);
    strokeWeight(2);
    point(20, y);
    point(30, y+10);
    point(50, y+5);
    point(60, y+15);
    point(70, y);
    point(90, y+5);
    point(110, y);
    point(120, y+10);
    point(140, y+5);
    y++;  //this makes the percipitation fall

    //resets the percipitation to start over once touches the ground
    if (y>height-25) {
      y=0;
    }
  }

  //this controls the clouds
  noStroke();
  fill(100);
  ellipse(25, 25, 100, 100);
  ellipse(120, 50, 150, 150);
  ellipse(200, 25, 70, 70);
  ellipse(270, 25, 100, 100);
}


