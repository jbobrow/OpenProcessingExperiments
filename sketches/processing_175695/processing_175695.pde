

import ddf.minim.*;

Minim minim;
AudioInput in;


//implementation of leap motion
import de.voidplus.leapmotion.*;

LeapMotion leap;


float xoff = 0.0;
float xincrement = 0.01;


float draw_x, draw_y; 
boolean drawing;
color pickColor;
int[] colorBank;
boolean onOption;
int optionColor;
float upperLeft_x; 
float upperLeft_y;
float buttonSize; 
float spaceInBetween;
int oldNo;


//create a timer 
int startTime;
int pauseTime;


void setup() {
  size(displayWidth, displayHeight, P3D);
 smooth();
 
 noiseSeed(0);
 oldNo = 20; 
 minim = new Minim(this);
  
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn(); 
 
leap = new LeapMotion(this);


  draw_x = 0;
  draw_y = 0;
  drawing = false;
  pickColor = color(0, 255, 0, 100);
  
 //timer
  startTime = 0;
  pauseTime = 2000;

  background(0);
  //all the colors in the color bank
  stroke(255);
  colorBank = new int[10];
  colorBank[0] = color(53, 219, 211, 100);
  colorBank[1] = color(255, 25, 255, 100);
  colorBank[2] = color(89, 45 , 41, 100);
  colorBank[3] = color(251, 3, 7, 100);
  colorBank[4] = color(251, 242, 7, 100);
  colorBank[5] = color(243, 197,50, 100);
  colorBank[6] = color(50, 117, 159, 255);
  colorBank[7] = color(70, 100, 48, 100);
  colorBank[8] = color(0, 70, 200, 130);
  colorBank[9] = color(30, 210, 40, 220);
  

}

void draw() {
 
  draw_x = mouseX;
  draw_y = mouseY;
  
  int fps = leap.getFrameRate();
  
  
   //fill(0, 10);
  //rect(0,0,width,height);
  //float n = noise(xoff)*width;
   //xoff += xincrement;
    
  
  noStroke();
  for (int i =0; i<colorBank.length; i++) {
       float r =80;
  stroke(255);
    fill(colorBank[i]);
    ellipse(50+((displayWidth-100)/colorBank.length)*i, 100, 50, 50);


}
  
//creates and rotates the box when drawing
  if (drawing) {
    fill(pickColor);
lights();
directionalLight(204, 204, 204, .5, 0, -1);
emissive(0, 26, 51);
pushMatrix();
translate(mouseX, mouseY);
rotateX(mouseX*0.03);
rotateY(mouseY*0.03);

noStroke();
box(20);
popMatrix();
          
    ellipse(draw_x, draw_y, 20, 20);
  } else {
    //code to detect if draw_x and draw_y is hitting any of the color
    for (int i =0; i<colorBank.length; i++) {
     
      if (dist(50+((displayWidth-100)/colorBank.length)*i, 100, draw_x, draw_y)<25) {
        pickColor = colorBank[i];

 //cleans the screen by generating a random rectangle
 fill(random(0,255), random(0,255) ,random(0,255));
  rect(0,0,displayWidth,displayHeight);
  float n = noise(xoff)*width;
   xoff += xincrement;
      }
    }
  }
  // to recognize hand motion
  for (Hand hand : leap.getHands ()) {

    
    
    // recognize finger motion
    for (Finger finger : hand.getFingers ()) { 
 for (int i =0; i<colorBank.length; i++) {
  
      // ----- SPECIFIC FINGER ----
      //see if left index id available
      if (hand.isLeft() && finger.getType()==1) {
        println("index");
        PVector tempf = finger.getPosition();
        if (drawing) {
          fill(pickColor);
        } else {
  upperLeft_x = displayWidth/3; 
  upperLeft_y = (displayHeight-displayWidth/3)/2;
  buttonSize = ((displayWidth/3)/3)*.90; 
  spaceInBetween = ((displayWidth/3)/3)*.10;
       noStroke();
        }
     
// draws using the leap motion, lights and emissive adds depth
        lights();        
directionalLight(204, 204, 204, .5, 0, -1);
emissive(0, 26, 51);
pushMatrix();
translate(tempf.x,tempf.y);
rotateX(tempf.x*0.03);
rotateY(tempf.y*0.03);
box(20,in.left.get(i+1)*50,20);   // <---- adds the sound reactive portion
popMatrix();
     
        //test if it is holding on 1 options;
        boolean onAnything = false;
        for (int k=0; k<3; k++) {
          for (int j=0; j<3; j++) {
            fill(pickColor);
          
            
            ellipse(50+((displayWidth-100)/colorBank.length)*i, 100, 30,30);
   fill(255);
            //use distance between the center of the option circle and finger position to determine it is on the circle
            if (dist(upperLeft_x+(buttonSize+spaceInBetween)*(k+0.5), upperLeft_y+(buttonSize+spaceInBetween)*(j+0.5), tempf.x, tempf.y)<buttonSize/2) {
            
              onAnything = true;
              //if the old number we remembered is not this number = a new option 
              if (oldNo != j*3+k) {
                startTime = millis();
                oldNo = j*3+k;
              } else {
                if (millis()-startTime>pauseTime) {
                  //choices made switch to the next stage
                  optionColor = color(random(0,255), random(0,255), random(0,255));
                  background(random(0,255), random(0,255), random(0,255));
                  oldNo = 20;
                } else {
                  stroke(255, 0, 0);
                  noFill();
                  ellipse(50+((displayWidth-100)/colorBank.length)*i, 100, 50,50);
                  noStroke();
                  fill(pickColor);
                  float ratio = (millis()-startTime)*1.0/pauseTime;
                  ellipse(50+((displayWidth-100)/colorBank.length)*i, 100, ratio*50, ratio*50);
                }
              }
            }
          }
        }

        if (onAnything) {
          onOption = true;
        } else {
          onOption = false;
          oldNo = 10;
        }
      }
    }
  }
}
}



//draws when mouse is pressed

void mousePressed() {

  drawing = true;
}

void mouseReleased() {

  drawing = false;
}
