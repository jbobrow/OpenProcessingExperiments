
void setup() {
  size(800, 800);
  background(0, 0, 0);  // draw() will not loop
}

float y = 510;
float x = 255;
float z = 0;
float a = 0;
float c = 400;
float d = 400;
float e = 155;
float r = 155;
float s = 55;

float q = 0;
float i = 0;
float u = 0;
float l = 0;
float k = 0;
float rotation = .1;



void draw() {
  if ((keyPressed == true ) && (key == 'b')) {
    fill(0);
    rect(0, 0, 800, 800);
  }

  if ((keyPressed == true) && (key == '1')) {
    s = 155;
    e = 55;
    r = 155;
  }    
    if ((keyPressed == true) && (key == '2')) {
    s = 155;
    e = 155;
    r = 55;  
  } 
  if ((keyPressed == true) && (key == '3')) {
    s = 55;
    e = 155;
    r = 155;  
  }  
   if ((keyPressed == true) && (key == '4')) {
    s = 155;
    e = 155;
    r = 155;  
  }
  if ((keyPressed == true) && (key == 'f')) {
    x = x + .5;
    if (x > width) {
      x = 0;
    }    
    y = y + 1;
    if (y > 50) {
      y = 0;
    }
    z = z + 1 + y;
    if (z > 100) {
      z = 0;
    }

    noStroke();
    fill(random(e), random(s), random(r), (y));
    beginShape();
    vertex(mouseY, mouseX);
    vertex(mouseY, mouseX);
    vertex(mouseX, y);
    vertex(mouseX, mouseY);
    vertex(mouseY, x);
    vertex(mouseY, mouseX);
    vertex(mouseX, z);
    endShape(CLOSE);
  }
  if ((keyPressed == true) && (key == 'g')) {
    d = d - 1;
    if (d < 0 ) {
      d = 400;
    }
    c = c - 5;
    if (c < 0 ) {
      c = 500;
    }
    y = y - 1;
    if (y < 0 ) {
      y = 510;
    }
    z = z + 5;
    if (z < 0 ) {
      z = 500;
    }
    x = x - 5;
    if (x < 0 ) {
      x = 500;
    }
    stroke(random(x),random(y),random(z), random(100));
    fill(0, 0, 0, random(100));
    triangle(mouseX, mouseY - d, mouseY, mouseX, mouseX, mouseY - c);
  }

  if ((keyPressed == true) && (key == 'h')) {
    q = q + 1;
    if (q > 360 ) {
      q = 0;
    }
    i = i * 2;
    if (i < 100 ) {
      i = 0;
    }
    l = l + 1;
    if (l < 100 ) {
      l = 0;
    }
    rotate(rotation);
    rotation = rotation + .1;
    if (rotation >= 360)
    { 
      rotation = 0;
    }
    fill(0, 0, 0);
    stroke(random(255), random(255), random(255), random(75));
    line(mouseX - 825, mouseY + 825, mouseX, mouseY);

    rotate(rotation);
    rotation = rotation - .5;
    if (rotation >= 360)
    { 
      rotation = 0;
    }
    fill(0, 0, 0);
    scale(l);
    stroke(random(255), random(255), random(255), random(75));
    line(mouseX, mouseY, mouseX - 825, mouseY + 825);
  }
}


