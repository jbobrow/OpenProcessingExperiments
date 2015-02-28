
/**********************************************************************
 *
 *          Title:  gradientShapes
 *         Author:  Matt Richard, matthewrichard.net
 *
 *    Description:  This example shows how to use nested for loops to 
 *                  create patterns in both the x and y axis. I have
 *                  also included a function that will draw equalateral
 *                  triangles. There are several render modes displaying
 *                  different patterns each of which can be accessed by
 *                  pressing the number keys. This is accomplished by using
 *                  the keyPressed() function native to Processing.
 *
 *           Date:  9/22/2011
 *
 **********************************************************************/
int renderMode = 1;

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(0);
  noStroke();

  if ( renderMode == 1 ) {
    // rectangles
    float rectWidth = 25.0;
    for (float y = 0.0; y < height; y += rectWidth * 0.8) {

      for (float x = 0.0; x < width; x +=  rectWidth * 0.8) {

        float bColor = map(x * y, 0, width * height, 0, 255);       

        fill(0, 0, bColor, 128);
        rect(x, y, rectWidth, rectWidth);
        rectWidth *= 1.001;
      }
    }
  } 
  else if ( renderMode == 2 ) {
    // circles
    float circWidth = 100.0;
    for (float y = 0.0; y < height; y +=  circWidth * 0.7 ) {

      for (float x = 0.0; x < width; x +=  circWidth * 0.7 ) {

        float gColor = map((width - x) * y, 0, width * height, 0, 255);       

        fill(0, gColor, 0, 128);
        ellipse(x, y, circWidth, circWidth);
        circWidth *= 0.995;
      }
    }
  } 
  else if ( renderMode == 3 ) {
    // triangles
    float triRadius = 50.0;
    int count = 0;
    for (float y = 0.0; y < height; y += triRadius * 0.9 ) {

      for (float x = 0.0; x < width; x += triRadius * 0.9 ) {

        count++;

        float rgbColor = map(x * (height - y), 0, width * height, 0, 255);

        if (count % 3 == 0) {
          fill(rgbColor, 255, 255, 128);
        }
        else if (count % 3 == 1) {
          fill(255, rgbColor, 255, 128);
        }
        else if (count % 3 == 2) {
          fill(255, 255, rgbColor, 128);
        }

        renderTriangle(x, y, triRadius, (int(x) % 2) * 60.0);
      }
    }
  }
  else if ( renderMode == 4 ) {
    // lines
    float lineSpace = 10.0;
    int count = 0;
    strokeWeight(10);
    for (float y = 0.0; y < height; y += lineSpace * 0.8 ) {

      count ++;
      for (float x = 0.0; x < width; x += lineSpace * 0.7 ) {

        count ++;

        if (count % 3 == 0) {
          stroke(255, 0, 0, 65);
        }
        else if (count % 3 == 1) {
          stroke(0, 255, 0, 65);
        }
        else if (count % 3 == 2) {
          stroke(0, 0, 255, 65);
        }

        line(x, y, width/2, height/2);
      }
    }
  }
  else if ( renderMode == 5 ) {
    // triangles, circles, and rectangles
    float triRadius = 50.0;
    int count = 0;
    for (float y = 0.0; y < height; y += triRadius * 0.9 ) {

      for (float x = 0.0; x < width; x += triRadius * 0.9 ) {

        count++;

        float rgbColor = map(y, 0, height, 0, 255);

        if (count % 3 == 0) {
          fill(rgbColor, 0, 255, 128);
          ellipse(x, y, 30, 30);
        }
        else if (count % 3 == 1) {
          fill(255, rgbColor, 255, 128);
          rect(x, y, 90, 90);
        }
        else if (count % 3 == 2) {
          fill(255, 0, rgbColor, 128);
          renderTriangle(x, y, triRadius, (int(x) % 2) * 60.0);
        }
      }
    }
  }
  else if ( renderMode == 6 ) {
    // lines 2
    float lineSpace = 50.0;
    float distance = 0.0;// variable to determine distance, in turn used for sw
    float sw = 0.0; // variable for strokeWeight
    int count = 0;

    for (float y = 0.0; y <= height; y += lineSpace ) {

      count ++;
      for (float x = 0.0; x <= width; x += lineSpace ) {

        count ++;

        if (count % 6 == 0) {
          stroke(255, 0, 0, 65);
        }
        else if (count % 6 == 1) {
          stroke(255, 255, 0, 65);
        }
        else if (count % 6 == 2) {
          stroke(0, 255, 0, 65);
        }
        else if (count % 6 == 3) {
          stroke(0, 255, 255, 65);
        }
        else if (count % 6 == 4) {
          stroke(0, 0, 255, 65);
        }
        else if (count % 6 == 5) {
          stroke(255, 0, 255, 65);
        }



        if ( y == 0.0 ) {
          //stroke(128);
          distance = dist(x, y, y, x);
          sw = map(distance, 0, 850, 1, 100);
          strokeWeight(sw);
          line(x, y, y, x);

          distance = dist(x, y, width, height - x);
          sw = map(distance, 0, 850, 1, 100);
          strokeWeight(sw);
          line(x, y, width, height - x);
        }
        if ( y == height ) {
          //stroke(255);

          distance = dist(x, y, y, x);
          sw = map(distance, 0, 850, 1, 100);
          strokeWeight(sw);
          line(x, y, y, x);

          distance = dist(0, x, width - x, y);
          sw = map(distance, 0, 850, 1, 100);
          strokeWeight(sw);
          line(0, x, width - x, y);
        }
      }
    }
  }
  else if ( renderMode == 7 ) {
    // lines 3
    float lineSpace = 20.0;
    float distance = 0.0;// variable to determine distance, in turn used for sw
    float sw = 0.0; // variable for strokeWeight
    float swMax = 50.0;
    int count = 0;

    for (float x = 0.0; x <= width; x += lineSpace ) {

      count ++;

      if (count % 6 == 0) {
        stroke(255, 0, 0, 65);
      }
      else if (count % 6 == 1) {
        stroke(255, 255, 0, 65);
      }
      else if (count % 6 == 2) {
        stroke(0, 255, 0, 65);
      }
      else if (count % 6 == 3) {
        stroke(0, 255, 255, 65);
      }
      else if (count % 6 == 4) {
        stroke(0, 0, 255, 65);
      }
      else if (count % 6 == 5) {
        stroke(255, 0, 255, 65);
      }



      distance = dist(x, 0, mouseX, mouseY);
      sw = map(distance, 0, 850, 1, swMax);
      strokeWeight(sw);
      line(x, 0, mouseX, mouseY);

      distance = dist(width, height - x, mouseX,  mouseY);
      sw = map(distance, 0, 850, 1, swMax);
      strokeWeight(sw);
      line(width, height - x, mouseX,  mouseY);

      distance = dist(x, height, mouseX,  mouseY);
      sw = map(distance, 0, 850, 1, swMax);
      strokeWeight(sw);
      line(x, height, mouseX,  mouseY);

      distance = dist(0, x, mouseX,  mouseY);
      sw = map(distance, 0, 850, 1, swMax);
      strokeWeight(sw);
      line(0, x, mouseX,  mouseY);
    }
  }
}


/**********************************************************************
 *
 *      Function Name:  renderTriangle
 *             Author:  Matt Richard, matthewrichard.net
 *
 *         Parameters:  (float _xCenter, float _yCenter, float _radius, float _angle)
 *        Description:  Calculates the position for the vertices of an
 *                      eqaulateral triangle when given the x and y value
 *                      of the center of the triangle, along with the
 *                      radius from the center to one of the vertices
 *                      and the angle of the triangle. It then draws the
 *                      triangle to the display window.
 *
 *           Date:  9/22/2011
 *
 **********************************************************************/
void renderTriangle(float _xCenter, float _yCenter, float _radius, float _angle) {
  float x1, y1, x2, y2, x3, y3;
  x1 = (sin(TWO_PI * 0.33 + radians(_angle)) * _radius) + _xCenter;
  y1 = (cos(TWO_PI * 0.33 + radians(_angle)) * _radius) + _yCenter;
  x2 = (sin(TWO_PI * 0.67 + radians(_angle)) * _radius) + _xCenter;
  y2 = (cos(TWO_PI * 0.67 + radians(_angle)) * _radius) + _yCenter;
  x3 = (sin(TWO_PI * 1.00 + radians(_angle)) * _radius) + _xCenter;
  y3 = (cos(TWO_PI * 1.00 + radians(_angle)) * _radius) + _yCenter;

  triangle(x1, y1, x2, y2, x3, y3);
}

void keyPressed() {
  if ( key == '1') {
    renderMode = 1;
  } 
  else if ( key == '2') {
    renderMode = 2;
  }
  else if ( key == '3') {
    renderMode = 3;
  }
  else if ( key == '4') {
    renderMode = 4;
  }
  else if ( key == '5') {
    renderMode = 5;
  }
  else if ( key == '6') {
    renderMode = 6;
  }
  else if ( key == '7') {
    renderMode = 7;
  }
}


