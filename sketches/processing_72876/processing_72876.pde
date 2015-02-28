
float s;  // Second
float m;  // Minute
float h;  // Hour 
float prevS = 0;  // Second on Previous Draw
int currentS;  // Current Second 
float currentHue; // Current Hue of Color
float hRadius = 720*(1/6); // Radius of Hours Circle
float mRadius = 720*(2/6); // Radius of Minutes Circle
float sRadius = 720*(3/6); // Radius of Seconds Circle

PFont f;

void setup() {
  size(720, 720);
  colorMode(HSB, 59);
  background(59);
  f = createFont("Helvetica",16,true); 
}

void draw() {

  // get current time
  currentS = second(); // Values from 0 - 59
  if ( prevS == currentS ) {
    // if the second hand is the same as last draw frame
    s += (1/frameRate);
  } else {
    // if the second hand just incremented
    s = currentS;
  }
  prevS = currentS; // Set Previous Second to Current second
  m = minute() + ( s * (1/60) ); // Values from 0 - 59
  h = hour() + ( m * (1/60) ); // Values from 0 - 23

  // println(h + " " + m + " " + s);
  
  currentHue = map(h,0,23,0,59); // Map hue from hours' 0-23 to 0-59
  
  background(currentHue,59,20);

  // center sketch
  translate(width/2, width/2);
  rotate(radians(90));


  // Seconds
  noStroke();
  fill(59,40); 
  ellipse(0,0,width,width);
  //  pushMatrix();
  //  rotate(radians(6 * s));  // 6 * 60 = 360 degrees
  //  line(0, 0, -(width*(1/2)), 0);
  //  popMatrix();
  strokeWeight(1);
  drawRG(radians(6 * s) , sRadius , currentHue, 20);
  
  // Minutes
  noStroke();
  fill(59,30); 
  ellipse(0,0,width*(2/3),width*(2/3));
  // pushMatrix();
  // rotate(radians(6 * m));  // 6 * 60 = 360 degrees
  // line(0, 0, -(width*(2/6)), 0);
  // popMatrix();
  strokeWeight(1);
  drawRG(radians(6 * m) , mRadius , currentHue, 40);
  
  // Hours
  noStroke();
  fill(59,20); 
  ellipse(0,0,width*(1/3),width*(1/3));
  // pushMatrix();
  // rotate(radians(15 * h));  // 15 * 24 = 360 degrees
  // line(0, 0, width*(1/6), 0);
  // popMatrix();
  strokeWeight(1);
  drawRG(radians(15 * h) , hRadius , currentHue, 59);  
  
  // Display Time
  String ampm; // variable to store am/pm value
  float printHours; // variable to store 12 hour value
  String printMinutes; // variable to store printable minutes and account for beginning in 0
  if ( h < 12 ) {
    ampm = "am";
    printHours = int(h);
  } else {
    ampm = "pm"; 
    printHours =  int(h - 12);
  }
  if ( m < 10 ) {
    printMinutes = "0"+str(int(m));
  } else {
    printMinutes = str(int(m));
  }
  textFont(f,20);
  if (mousePressed) {
    pushMatrix();
    rotate(radians(-90));
    fill(currentHue, 59, 30);
    rect(235,295,100,35,5,5,5,5);
    fill(currentHue, 59, 59);
    text( printHours + ":" + printMinutes + " " + ampm,250,320);
    popMatrix();
  }

}

void drawRG(float rotation, float lineWidth, float ourHue, float ourSaturation) {
 stroke(ourHue, ourSaturation, 20);
 strokeWeight(1);
 for (int i = 0; i < rotation; i+=0.0125) {
    pushMatrix(); 
    rotate(i);
    line(0, 0, lineWidth, 0);
    popMatrix();
 }
}
