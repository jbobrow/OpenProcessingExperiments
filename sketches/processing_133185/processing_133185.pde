
float my_num = 0;
float x = 0;
float y = 0;
float z = 0;
float q = 0;

void setup() {
  size(400, 400);
  //  colorMode(HSB);
  strokeWeight(2);
}

void draw() {
  //background(noise(my_num+100)*255);
  //stroke(255);
  background(0);

  //noise always returns a value between 0 and 1
  x = noise(my_num) * width;
  stroke(0, 255, 0);
  line(x, 0, x, height);

  x = noise(my_num+2) * width;
  stroke(0, 225, 0);
  line(x, 0, x, height);

  y = noise(my_num + 40) * height;
  stroke(0, 0, 255);
  line(0, y, height, y);

  y = noise(my_num + 42) * height;
  stroke(0, 0, 225);
  line(0, y, height, y);

  z = noise(my_num + 23) * width * 2;
  if (z > width) {
    stroke(255, 0, 0);
    z = z - width;
    line(z, 0, width, width-z);
  } 
  else {
    stroke(255, 0, 0);
    line(0, height-z, z, height);
  }

  z = noise(my_num + 25) * width * 2;
  if (z > width) {
    stroke(255, 0, 0);
    z = z - width;
    line(z, 0, width, width-z);
  } 
  else {
    stroke(255, 0, 0);
    line(0, height-z, z, height);
  }

  q = noise(my_num + 15) * width * 2;
  if (q > width) {
    stroke(255, 255, 0);
    q = q - width;
    line(q, width, height, q);
  } 
  else {
    stroke(255, 255, 0);
    line(q, 0, 0, q);
  }

  q = noise(my_num + 16) * width * 2;
  if (q > width) {
    stroke(255, 255, 0);
    q = q - width;
    line(q, width, height, q);
  } 
  else {
    stroke(255, 255, 0);
    line(q, 0, 0, q);
  }


  my_num = my_num + 0.02;
}

