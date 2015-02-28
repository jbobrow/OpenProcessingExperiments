
//Circles of varying width and height
//positioned in a rough grid
//Those within certain distance of center are shaded


//void setup(){
  size(600, 600);
  background(255);
//}

  int i;
  int j;
  float r;
  float center_X = width / 2;
  float center_Y = height / 2;

strokeWeight(1);
fill(200, 100, 100, 10);

// top left

for (i = 0; i < width / 2; i += 20) {
  for (j = 0; j < height / 2; j += 20) {
    r = dist(i, j, center_X, center_Y);
    if (r > 150) {
      //noStroke();      //these noStrokes can be switched on for a different composition, with a neater outer rim
      fill(r, 10);
    } 
    else {
      strokeWeight(1);
      stroke(0);
      fill(r * 10, 50, 50, 10);
    }
    ellipse(i, j, r, r);
  }
}

// bottom left

for (i = 0; i < width / 2; i += 20) {
  for (j = 600; j > height / 2; j -= 20) {
    r = dist(i, j, center_X, center_Y);
    if (r > 150) {
      //noStroke();
      fill(r, 10);
    } 
    else {
      strokeWeight(1);
      stroke(0);
      fill(r * 10, 100, 100, 10);
    }
    ellipse(i, j, r, r);
  }
}


// top right

for (i = 600; i > width / 2; i -= 20) {
  for (j = 0; j < height / 2; j += 20) {
    r = dist(i, j, center_X, center_Y);
    if (r > 150) {
      //noStroke();
      fill(r, 10);
    } 
    else {
      strokeWeight(1);
      stroke(0);
      fill(r * 10, 100, 50, 10);
    }
    ellipse(i, j, r, r);
  }
}

// bottom right

for (i = 600; i > width / 2; i -= 20) {
  for (j = 600; j > height / 2; j -= 20) {
    r = dist(i, j, center_X, center_Y);
    if (r > 150) {
      //noStroke();
      fill(r, 10);
    } 
    else {
      strokeWeight(1);
      stroke(0);
      fill(r * 10, 50, 100, 10);
    }
    ellipse(i, j, r, r);
  }
}


fill(50, 250);
stroke(255);
strokeWeight(2);
ellipse(center_X, center_Y, 30, 30);

//}

