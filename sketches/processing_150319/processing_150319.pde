
/*
* cosmosMinimal
* 2 June 2014
* by Diana T.
* Copyright (c) 2014 posthumanlive

* This program allows you to create mini universe using your mouse.
* Press 's' to save your drawing as an image to the folder.
* Press 'r' to erase your drawing and start with a clean slate.
* 
*/

float angle;
float inc;

void setup() {
  size(500, 500);
  background(255);

  ellipseMode(CENTER);  

  angle = 0;
  inc = 0;
}

void draw() {

  inc = map(mouseX, 0, width, 0.01, 0.08);

  angle = angle + inc;

  if (mousePressed) {

    noStroke(); 
    fill(random(255));

    noStroke();
    ellipse(mouseX, mouseY, 2, 2);

    line(mouseX, mouseY, pmouseX, pmouseY); 

    float radius = random(300) * abs( sin(frameCount) );

    float first_tempX  = mouseX + radius * cos( angle);
    float first_tempY  = mouseY + radius * sin( angle);
    float second_tempX = mouseX + radius * cos(-angle);
    float second_tempY = mouseY + radius * sin(-angle);


    stroke(110, 100);
    line(mouseX, mouseY, first_tempX, first_tempY);
    line(mouseX, mouseY, second_tempX, second_tempY);

    float temp_w = random(3);
    ellipse(first_tempX, first_tempY, temp_w, temp_w);
    ellipse(second_tempX, second_tempY, temp_w, temp_w);
  }


  if (keyPressed == true && key == 's') {
    saveFrame("cosmos.jpg");
  }

  if (keyPressed == true && key == 'r') {
    background(255);
  }
}


