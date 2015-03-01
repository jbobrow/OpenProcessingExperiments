
/* @pjs preload="Canberra.jpg"; */
/*
 * Creative Coding
 * Week 6, Canberra postcard
 * by Gerard Holden
 * 
 */

ArrayList<Head> heads; // An arraylist for the talking heads
PImage myImage;        // a picture of parliament house from the air
float STEP_LENGTH;     // the length a head moves each frame
float ORIGIN_X;        // where the heads are vreated  
float ORIGIN_Y;
float TALK_SPEED;      // defines speed of mouth opening and closing
float HEAD_LIMIT;      // upper limit on heads
float attractLX;       // a moving attractor for left facing heads
float attractLY;
float attractRX;       // a moving attractor for right facing heads
float attractRY;
float ptrL, ptrR;      // defines speed of the two attractors

void setup() {
  
  STEP_LENGTH = 0.2;   // set value of constants
  ORIGIN_X = 315;
  ORIGIN_Y = 200;
  TALK_SPEED = 0.05;
  HEAD_LIMIT = 999;
  
  myImage = loadImage("Canberra.jpg");
//  size(myImage.width, myImage.height);
  size(640,400);
  heads = new ArrayList<Head>();
  heads.add(new Head());
  
  ptrL = random(0, TWO_PI);
  ptrR = random(0, TWO_PI);
}

void draw() {
  
  image(myImage, 0, 0);
  
  // Create a head at the origin if there's room
  boolean isRoom = false;
  if (heads.size() < HEAD_LIMIT) {
    isRoom = true;
    for (int i = heads.size() - 1; i >= 0; i--) {
      Head head = heads.get(i);
      if (dist(ORIGIN_X, ORIGIN_Y, head.x, head.y) < head.diameter + 5) {
        isRoom = false;
      }
    }
  }
  if (isRoom) {
    heads.add(new Head());
  }
    
  // Move the two attractors
  
  ptrL += 0.0015;
  ptrR -= 0.002;
  if (ptrL < 0) {
    ptrL = TWO_PI;
  }
  if (ptrR > TWO_PI) {
    ptrR = 0;
  }
  attractLX = width/2 + 300 * cos(ptrL);
  attractLY = height/2 + 150 * sin(ptrL);
  attractRX = width/2 + 300 * cos(ptrR);
  attractRY = height/2 + 150 * sin(ptrR);

  // For each head, move towards the attractor (except heads that are arguing)
  for (int i = heads.size() - 1; i >= 0; i--) {
    Head head = heads.get(i);
    head.moveHead();
  }   
  
  // Process the heads that are arguing
  for (int i = heads.size() - 1; i >= 0; i--) {
    Head head = heads.get(i);
    if (head.isArguing) {
      head.escalation += 0.1;
    }
    if (head.escalation > 25) {
      heads.remove(i);
    }
  }
  
  // For each head, check for collisions
  if (heads.size() > 1) {
    boolean isCollision = true;
    while (isCollision) {
      isCollision = false;
      for (int i = heads.size() - 1; i >= 0; i--) {
        Head headi = heads.get(i);
        for (int j = i-1; j >=0; j--){
          Head headj = heads.get(j);
          if (dist(headi.x, headi.y, headj.x, headj.y) < headi.diameter/2 + headj.diameter/2) {
//            println("headi.x " + headi.x + " headi.y " + headi.y + " headj.x " + headj.x + " headj.y " + headj.y + " LC " + loopCounter);
//            float theta = atan2(headi.y - headj.y, headi.x - headj.x);
//            float iota  = atan2(headj.y - headi.y, headj.x - headi.x);
//            float midX = (headi.x + headj.x)/2;
//            float midY = (headi.y + headj.y)/2;
//            headi.x = midX + headi.diameter/2 * cos(theta);
//            headj.x = midX - headj.diameter/2 * cos(theta);
//            headi.y = midY + headi.diameter/2 * sin(theta);
//            headj.y = midY - headj.diameter/2 * sin(theta);            
//            isCollision = true;
              if ((headi.isLeft != headj.isLeft) && (!headi.isArguing) && (!headj.isArguing)) {
                if ((headi.isLeft && headi.x > headj.x) || (!headi.isLeft && headi.x < headj.x)) {
                  if (abs(headi.y - headj.y) < 10) {
                    headi.isArguing = true;
                    headj.isArguing = true;
                  }
                }
              }
              headi.x = headi.x1;
              headi.y = headi.y1;
              headj.x = headj.x1;
              headj.y = headj.y1;
          }
        }
      }
    }
  } 
  
 // Display the heads
 
  textSize(24);
  text("Greeting from Canberra, the nation's capital", 50, height-25);
 
  for (int i = heads.size() - 1; i >= 0; i--) {
    Head head = heads.get(i);
    head.drawHead();
  } 
}
/*
 * Class Head - the talking heads
 */

class Head {
  
  float x, y;        // coordinates of the head
  float x1, y1;      // previous coordinates
  boolean isLeft;    // indicates direction head is facing (left or right)
  boolean isArguing; // indicates if the head is arguing with another
  float diameter;    // diameter of the head
  color colour;      // colour of the head
  float talkOffset;  // a random offset for the mouth opening/closing
  float talkSpeed;   // talking speed
  float escalation;  // level of heated argument
  float pulse;       // length of rays emanating from head 
  
  // Constructor
  Head() {
    
    x = ORIGIN_X;
    y = ORIGIN_Y;
    
    isLeft = true;
    colour = #FAAFBE;
    if (random(1) > 0.5) {
      isLeft = false;
      colour = #ADDFFF;
    }
    
    isArguing = false;
    diameter = 15;
    talkOffset = random(0, HALF_PI/2);
    talkSpeed = TALK_SPEED;
    escalation = 0;
    pulse = 0;
  }
  
  void drawHead() {
    
    color tmpColour = colour;
    
    if (isArguing) {
      if (isLeft) {
        tmpColour = lerpColor(colour, #FF0000, escalation/25);
      } else {
        tmpColour = lerpColor(colour, #0000FF, escalation/25);
      }
    }
    
    fill(tmpColour);
    noStroke();
    talkOffset += talkSpeed;
    if (talkOffset > HALF_PI/2 || talkOffset < 0) {
      talkSpeed = -talkSpeed;
    }
    if (isLeft) {
      arc(x, y, diameter, diameter, PI, TWO_PI, PIE); 
      arc(x, y, diameter, diameter, 0, PI - talkOffset, PIE);
    } else {
      arc(x, y, diameter, diameter, 0 + talkOffset, TWO_PI, PIE);
    }
  }
  
  void moveHead() {
    x1 = x;
    y1 = y;
    if (!isArguing) {
      if (isLeft) {
        float theta = atan2(attractLY - y, attractLX - x);
        x += STEP_LENGTH * cos(theta) + random(-STEP_LENGTH*1.5, STEP_LENGTH*1.5);
        y += STEP_LENGTH * sin(theta) + random(-STEP_LENGTH*1.5, STEP_LENGTH*1.5);
      } else {
        float theta = atan2(attractRY - y, attractRX - x);
        x += STEP_LENGTH * cos(theta) + random(-STEP_LENGTH*1.5, STEP_LENGTH*1.5);
        y += STEP_LENGTH * sin(theta) + random(-STEP_LENGTH*1.5, STEP_LENGTH*1.5);        
      }
    }
  }
}


