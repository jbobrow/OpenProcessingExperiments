
// this is an example of a Pie Chart with additional encoded variable, mapped to radius
// another version of this chart is called a Polar Area Diagram, when the angles are consistent (first developed by Florence Nightingale)

// declare and initialize arrays
float[] values = new float[5];
float[] radii = new float[5];
float[] percentVal = new float[5];
float[] percentRad = new float[5];
color[] colors = new color[5];
PFont helvetica;

// misc
float chartRadius = 150;
float minRad = MAX_FLOAT;
float maxRad = MIN_FLOAT;

void setup() {
  size(640, 480);
  frameRate(30);
  smooth();
  
  helvetica = createFont("Helvetica-Bold", 13);
  textFont(helvetica);
  
  generateChart();
}

void draw() {
  background(255);

  // init start angle
  float startAngle = 0.0;
  
  // init label switch
  int labelIndex = -1;
  
  // iterate through segments
  for (int i = 0; i < values.length; i++) {
    
    // map percent to degrees
    float newVal = map(percentVal[i], 0, 1, 0, 360);
    float newRad = map(percentRad[i], 0, 1, 0, chartRadius);
    
    // set angle
    float endAngle = startAngle + radians(newVal);

    // get mouse position relative to sketch center
    float translateX = map(mouseX, 0, width, -width/2, width/2);
    float translateY = map(mouseY, 0, height, -height/2, height/2);
    
    // first, get radius and angle by converting cartesian mouse coordinates to polar coordinates
    float mouseRad = sqrt(pow(translateY, 2) + pow(translateX, 2));
    float mouseAngle = atan2(translateY, translateX);
    
    // if is necessary to translate negative into positive values to get the full circle
    if (mouseAngle < 0) {
      mouseAngle = PI + (PI + mouseAngle);
    }
    
    // set fill
    noStroke();
    
    // check if mouse in bounds of an arc segment
    if (((mouseAngle > startAngle) && (mouseAngle < endAngle)) && (mouseRad < newRad)) {
      // mouse over segment
      fill(colors[i], 100);
      labelIndex = i;  
    } else {
      // mouse not over segment
      fill(colors[i]);
    }
    
    // draw arc
    arc(width/2, height/2, newRad*2, newRad*2, startAngle, endAngle);
          
    // set start angle to end angle
    startAngle = endAngle;
  }
  
  // draw label
  if (labelIndex != -1) {
    // store letters in array
    char letterArray[] = { 'A', 'B', 'C', 'D', 'E' };
    int labelVal = round(values[labelIndex]);
            
    String txt = "Segment " + letterArray[labelIndex] + ": " + labelVal;
    float labelW = textWidth(txt);
    
    fill(0);
    rect(mouseX+5, mouseY-25, labelW+10, 22); 
    fill(255);
    text(txt, mouseX+10, mouseY-10);
  }
}

void keyPressed() {
  generateChart();
}

void generateChart() {
    // set random values, radii and colors
  for (int i = 0; i < colors.length; i++) {
    
     values[i] = (int) random(100);
     radii[i] = (int) random(100);

    // get random color
    int r = (int) random(255);
    int g = (int) random(255);
    int b = (int) random(255);
    
    colors[i] = color(r, g, b);
  }
  
  // add up all values for totals
  float totalVal = 0.0;
  for (int i = 0; i < values.length; i++) {
    totalVal += values[i];
  }
  
  // get min/max radius to scale to chart size
  for (int i = 0; i < radii.length; i++) {
    if (radii[i] < minRad) {
      minRad = radii[i];
    }
    if (radii[i] > maxRad) {
      maxRad = radii[i];
    }
  }
  
  // print min/max radii
  println("min radius: " + minRad);
  println("max radius: " + maxRad);
  
  // translate values into percent
  for (int i = 0; i < values.length; i++) {
    percentVal[i] = values[i] / totalVal;
    percentRad[i] = radii[i] / maxRad;
  }
}

