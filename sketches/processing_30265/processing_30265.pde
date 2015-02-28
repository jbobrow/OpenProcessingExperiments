
/**
 * Frame Differencing 
 * by Golan Levin. 
 * 
 * Quantify the amount of movement in the video frame using frame-differencing.
 */


import processing.video.*;

int numPixels;
int[] previousFrame;


float x, y;
float size = 300.0;

PFont font;
float fontSize = 150;



//for the clock
int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
//end for the clock

float capheight, capwidth;

float userRadius;
float userpos;
float userangle;
int movementSum;
PImage dorobou, dorobou2;

int count;

PImage keisatsu, keisatsu2, roundroad;

PImage black, white;


void setup() {

  font = loadFont("LucidaFax-48.vlw"); 
count=0;

  size(900, 900);
  noStroke();
  //frameRate(30);

  dorobou=loadImage("dorobou2.png");
  keisatsu=loadImage("keisatsu.png");

  dorobou2=loadImage("dorobou2_2.png");
  keisatsu2=loadImage("keisatsu_2.png");

  black=loadImage("black.jpg");
  white=loadImage("white.jpg");

  roundroad=loadImage("roundroad.png");


  size(900, 900); // Change size to 320 x 240 if too slow at 640 x 480
  // Uses the default video input, see the reference if this causes an error
  // Create an array to store the previously captured frame

  //for the clock
  stroke(255);
  smooth();
  int radius = min(width, height) / 3;
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.75;
  hoursRadius = radius * 0.40;
  clockDiameter = radius * 2.7;

  userRadius = radius * 1.08;

  cx = width / 2;
  cy = height / 2;

  //end for the clock
  x=-1950;
}

void keyPressed() {
if(key==32){
      movementSum=1000000;
}
}

void draw() {


      // Render the difference image to the scree

    // To prevent flicker from frames that are all black (no movement),
    // only update the screen if the image has changed.

    //kokode susumiguai wo kanrisuru
    if (movementSum > 0) {

      if (movementSum>10000) {

        userangle=(userangle+(movementSum/700000))%360;
      }
      println(movementSum);
      // Print the total amount of movement to the console
    }
movementSum=0;
    //for the clock


    // Draw the clock background
    background(0);
    fill(98, 65, 0);
    noStroke();
    ellipse(cx, cy, clockDiameter, clockDiameter);

    // Angles for sin() and cos() start at 3 o'clock;
    // subtract HALF_PI to make them start at the top
    float s = (map(millis(), 0, 60000, 0, TWO_PI) - HALF_PI);
    float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
    float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;





    // Draw the hands of the clock

    image(roundroad, (width/2)-370, (height/2)-370, 740, 760);

    textFont(font, 40);

      fill(255, 255, 255);
      text("Arrest Count:"+count,width/2-150,height/2+75);

    strokeWeight(10);
    stroke(140, 12, 12);
    line(cx, cy, cx + cos(userpos) * hoursRadius*(movementSum/2000000)*1.5, cy + sin(userpos) * hoursRadius*(movementSum/2000000)*1.5);


    stroke(0);
    strokeWeight(8);
    line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
    stroke(255);
    strokeWeight(18);
    line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
    stroke(255);
    strokeWeight(24);
    line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);

    // Draw the minute ticks
    strokeWeight(2);
    // beginShape(POINTS);
    for (int a = 0; a < 360; a+=6) {
      float x = cx + cos(radians(a)) * secondsRadius;
      float y = cy + sin(radians(a)) * secondsRadius;
      vertex(x, y);
    }

    if (degrees(s)%360>180) {
      image(keisatsu2, cx + cos(s) * userRadius*0.7-37, cy + sin(s) * userRadius*0.7-37, 75, 75);
    }
    else {
      image(keisatsu, cx + cos(s) * userRadius*0.7-37, cy + sin(s) * userRadius*0.7-37, 75, 75);
    }

    userpos=radians(userangle);

    if (degrees(userpos)<180) {
      image(dorobou, cx + cos(userpos) * userRadius*0.7-45, cy + sin(userpos) * userRadius*0.7-45, 90, 90);
    }
    else {
      image(dorobou2, cx + cos(userpos) * userRadius*0.7-45, cy + sin(userpos) * userRadius*0.7-45, 90, 90);
    }

    // int i=0;
    // for(i=0;i<2;i+=0.1){set(int(cx + cos(s) * secondsRadius), int(cy + sin(s) * secondsRadius), video);}

    endShape();


    //end for the clock    

    x = x - 29;

    if (x<-2000) {

      x=-2000;
    }

if(x==width+size-58){
  
  count++;
  
}




    if ((abs(userangle-degrees(s))%360)<1) {

      x = width+size;
    }
    
    
    // translate(x, height/2);
    fill(255);


    //  textFont(font, fontSize);

    //  stroke(100,100,100);

    textFont(font, fontSize);

    int ho = hour();  // Values from 1 - 12
    int mi = minute();   // 2003, 2004, 2005, etc.
    String htime, mtime;


    if (hour()<10) {
      htime = "0"+String.valueOf(hour());
    }
    else {
      htime = String.valueOf(hour());
    }
    if (minute()<10) {
      mtime = "0"+String.valueOf(minute());
    }
    else {
      mtime = String.valueOf(minute());
    }
    if ((10000-x)%1000<500) {

      image(white, x, height/4, 2000, 400);
      fill(0, 0, 0);
      text(htime+":"+mtime, x, 50+height/2);
    }
    else {
      image(black, x, height/4, 2000, 400);
      fill(255, 255, 255);
      text(htime+":"+mtime, x, 50+height/2);
    }
    // Transforms accumulate.
    // Notice how this rect moves twice
    // as fast as the other, but it has
    // the same parameter for the x-axis value
  
}


