
//DIGF 6B02 - Creation & Computation
//Learning Processing: Creature Project
//by Harjot Bal

//FRAAG the Frog
//Version #4


//Toggle switch for time of day
  boolean night = false;

//Global variables
  float positionX;
  float positionY;
  float shadow;
  float cloudX;
  float cloudY;
  float bigCloudX;
  float bigCloudY;
 
 
void setup() {

  //Screen Size -- upon changing the size of the grid you will find that the sketch automatically scales itself each time for a perfect fit
    size(700,500);

  //Fraag's positioning on screen so that he always remains at the bottom center of the screen, reference coordinates for other features
    positionX = width/2;
    positionY = height-65;

  //Anti-aliasing
    smooth();

  //Smooth and fast playback
    frameRate(30);

}
 
 
void draw() {

  //Conditional: If the mouse is pressed draw a night color background, otherwise draw a default day blue background
    if(night) {
      background(40,0,70);
    }
    else {
      background(200,240,255);
    }
  
  //Declare and initialize color variables for Fraag's eyes -- each draw loop generates a new color instead of having a fixed color chosen randomly once at every run
    float r = random(255);
    float g = random(255);
    float b = random(255);

  //Note: Elements written at top are bottom layers, and vice-versa 

   //Conditional: If the mouse is pressed draw a moon, otherwise draw a sun
     if(night) {
    //Moon
      stroke(200,200,235);
      strokeWeight(12);
      fill(250,240,250);
      ellipse(mouseX,mouseY,150,150);
      //Inner glow
        noStroke();
        fill(250,240,250,50);
        ellipse(mouseX,mouseY,220,220);
      //Outer glow
        fill(250,240,250,20);
        ellipse(mouseX,mouseY,300,300);
      //Craters
        fill(175,50);
        ellipse(mouseX+35,mouseY-25,30,35);
        ellipse(mouseX-25,mouseY-20,45,50);
        ellipse(mouseX+15,mouseY+15,25,30);
      }
      else {
      //Sun
        stroke(255,200,0);
        strokeWeight(12);
        fill(255,255,0);
        ellipse(mouseX,mouseY,150,150);
        //Inner ray
          noStroke();
          fill(255,255,0,50);
          ellipse(mouseX,mouseY,220,220);
        //Outer ray
          fill(255,255,0,20);
          ellipse(mouseX,mouseY,300,300);
      }
  
  //Clouds
    //Looping small clouds
      cloudX = width/8;
      cloudY = height/8;
      while(cloudX+40 < width) {
        fill(250,200);
        ellipse(cloudX,cloudY,80,20);
        cloudX = cloudX + (width/3);
      }
    //Looping big clouds
      bigCloudX = width/3;
      bigCloudY = height/4;
      while(bigCloudX+60 < width) {
        fill(250,200);
        ellipse(bigCloudX,bigCloudY,105,30);
        bigCloudX = bigCloudX + (width/3);
      }
    
    
  //Shadow    
    fill(50,50,50,90);
    ellipse(shadow,positionY+45,190,30);
    //Conditionals for keeping shadow opposite sun
      if(mouseX<width/2) {
        shadow=positionX+45;
      }
      else {
        shadow=positionX-45;
      }

  //Fraag
    strokeWeight(5);
    stroke(0);
    fill(100,100,0);
    //Feet
      ellipse(positionX-25,positionY+45,45,17);
      ellipse(positionX+25,positionY+45,45,17);
    //Body
      ellipse(positionX,positionY,100,100);
    //Eyes (left then right)
      fill(255,255,255);
      ellipse(positionX-15,positionY-40,30,30);
      ellipse(positionX+15,positionY-40,30,30);
    //Eyebrows (left then right)
      strokeWeight(3);
      fill(0);
      rectMode(CENTER);
      rect(positionX-15,positionY-65,20,5);
      rect(positionX+15,positionY-65,20,5);
    //Mouth
      strokeWeight(2);
      fill(255,0,0,200);
      ellipse(positionX,positionY+20,40,40);
    //Pupils
      float pupilX = constrain(mouseX,positionX-20,positionX-10);
      float pupilY = constrain(mouseY,positionY-50,positionY-30);
      strokeWeight(2);
      fill(r,g,b,200);
      ellipse(pupilX,pupilY,8,8);
      ellipse(pupilX+30,pupilY,8,8);
 
}


void mousePressed() {
  
  //Pressing the mouse toggles the night state
  night = !night;
  
}

