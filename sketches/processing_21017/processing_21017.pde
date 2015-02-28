
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Using Example 16-1: Display video


//// import processing.video.*;


//// Capture video;


int hours;
int minutes;
int seconds;


void setup() {
  size(300, 300);
  colorMode(RGB);
  background(255);
  smooth();
  ////video = new Capture(this,300,300,15);
}

void draw() {
 
   // get system variables
 hours = hour();
 minutes = minute();
 seconds = second();
 
 println("The current time is: " + hours + " hours " + minutes + " minutes" + " and " + seconds + " sec");
    
    // fix for 24 hour clock
  if(hours > 12) {
   hours -= 12; 
  }
 
   if (hours > 7 && hours < 13) {   
     background(55,100,100); // blue morning
  }
  else if (hours > 13 || hours < 18) {
      background(12,100,100); //orange afternoon
  }
  else {
      background(30); //black night
  }

 ////if (video.available()) {
    // If so, Step 4. Read the image from the camera.
    ////video.read();
  ////}
  
   // Step 5. Display the video image.
 ////image(video,0,0);

 
    // center sketch
  translate(150,150);
  rotate(radians(180));

      // hour hand outside
  pushMatrix();
  rotate(radians(30 * hours));
  fill(255);
  rect(-15,0,30,300);
  popMatrix();

      // minute hand outside
  pushMatrix();
  rotate(radians(6 * minutes));
  fill(200);
  rect(-10,0,20,300);
  popMatrix();

      // second hand outside
  pushMatrix();
  rotate(radians(6 * seconds));
  fill(0);
  rect(-5,0,10,300);
  popMatrix();

    noStroke();
    noFill();
  

      //pinpoint center
  pushMatrix();
  fill(255, 200);
  ellipse(0,0,200,200);
  fill(200,200);
  rotate(radians(45));
  rect(-70,-70,140,140);
  fill(255);
  rect(-12.5,-12.5,25,25);
  popMatrix();
  
  noStroke();
  fill(0);
  
  
      // hour hand
  pushMatrix();
  rotate(radians(30 * hours));  // 30 * 12 = 360 degrees
  fill(random(0,100),random(0,100),random(0,100));
  ellipse(0, 30, 15, 15);
  popMatrix();
  
        // minute hand
  pushMatrix();
  rotate(radians(6 * minutes));
  fill(random(0,50),random(0,50),random(0,50));
  ellipse(0, 60,10,10);
  popMatrix();

      // second hand
  pushMatrix();
  rotate(radians(6 * seconds));
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(0, 90, 5, 5);
  popMatrix();
  
  


}               
