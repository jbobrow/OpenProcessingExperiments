
//create arrays to store values for all the lines
float[] rValues = new float[25];
float[] gValues = new float[25];
float[] bValues = new float[25];
float[] yValues1 = new float[25];
float[] yValues2 = new float[25];

void setup() {
  size(800, 450);
  smooth();

  //create values for all the lines
  for (int i=0; i<25; i++) {
    rValues[i] = random(0, 256);
    gValues[i] = random(0, 256);
    bValues[i] = random(0, 256);
    yValues1[i] = random(10, height-10);
    yValues2[i] = random(10, height-10);
  }
}

void draw() {
  background(0);
  noFill();
  strokeWeight(5);

  float x1;
  float x2;
  float y1;
  float y2;
  float spacing = 10;

  for (int i=0; i<25; i++) {
    //set the stroke color to the color of the ith line
    stroke(rValues[i], gValues[i], bValues[i]);
    //if the mouse is on the left, chaos for the left lines
    if (mouseX < width/2) {
      x1 = map(mouseX, width/2, 0, i*spacing, width/2-90);
      x2 = width-i*10;
      if (yValues1[i] < height/2){
        y1 = yValues1[i] + map(mouseY, 0, height, 0, 200);
      }
      else{
        y1 = yValues1[i] - map(mouseY, 0, height, 0, 200);
      }
      y2 = yValues2[i];
    }
    //if the mouse is on the right, chaos for the right lines
    else {
      x1 = i*10;
      x2 = map(mouseX, width/2, width, width-i*spacing, 
      width/2+90);
      y1 = yValues1[i]; 
       if (yValues2[i] < height/2){
        y2 = yValues2[i] + map(mouseY, 0, height, 0, 200);
      }
      else{
        y2 = yValues2[i] - map(mouseY, 0, height, 0, 200);
      }
    }

    //draw ith left line
    beginShape();
    vertex(i*spacing, 0);
    vertex(x1, y1);
    vertex(i*spacing, height);
    endShape();

    //draw ith right lines
    beginShape();
    vertex(width-i*spacing, 0);
    vertex(x2, y2);
    vertex(width-i*spacing, height);
    endShape();
  }
}

