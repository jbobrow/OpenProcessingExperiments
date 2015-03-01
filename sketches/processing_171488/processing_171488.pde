
//"Time Warp"
//by Aaron Ishibashi

//Variables
float changeGradient = 90; //modulates the ellipses
float changeS = 0; //variable for saturation
float changeB = 0; //variable for brightness
int sDir = 0; //direction of the saturation and brightness modulation
float xPos; //stagnant x position
float yPos; //stagnant y position
int globalSet = 0;
int textCounter = 0;

void setup() {
xPos = 180; //hard coded position, not sure why but 'width' does not work here
yPos = 100; //hard coded position, not sure why but 'height' does not work here
size(360,200); //canvas size
colorMode(HSB, 360, 360, 360); //Hue, Saturation, Brightness Mode
ellipseMode(RADIUS); //ellipse(x,y,radius1,radius2)
frameRate(30); //frame rate = 30 frames/sec
}

//Update every frame
void draw() {
  background(0,0,0); //set background to black
   if (changeGradient > 360) { //once modulation variable reaches max, reset
     changeGradient = 0;
     if (sDir == 1) { //change the direction of saturation and brightness
       sDir = 1;  //if sDir == 1 then variables decrease
     } else {
       sDir = 0;  //if sdir == 2 then variables increase
     }
     if (sDir == 1) { 
       changeS -= 2;
       changeB -= 2;
     } else {
       changeS += 2;
       changeB +=2;
     }
   }
   changeGradient += 1; //increase modulation variable by 1
   drawGradient(xPos, yPos, changeGradient, changeS, changeB); //call drawGradient function
   textSize(12);
   fill(360,360,360);
   if (textCounter < 90) {
     text("Press any key to change sequence", 10, 30);
     textCounter += 1;
   }

}

void keyPressed() { //change modes by pressing any key
  if (globalSet > 1) {
   globalSet = 0; 
  } else {
    globalSet += 1;
  }
}


//drawGradient custom function
void drawGradient(float x, float y, float c, float s, float b) {
  //ARGUMENTS: x position, y position, init Hue, init Saturation, init Brightness
  float radius = width*1.5; //set radius variable
  for(int r = int(radius/4); r > 0; r -= 1) { //radius divided by 4 makes it loop less to cause less slowdown
    
    fill(c, s, b);
    //here is where the magic happens. Plug different modulating variables into radius and weird stuff happens
    switch (globalSet) {
      case 0:
        ellipse(x, y, r, 360-c); 
        break;
      case 1:
         ellipse(x,y, r+c/20,c*90/360);
        break;
      case 2:
        ellipse(x,y,r*2,c*r*2/360);
        break;
    } 
    if (c > 360) { //if local modulation variable reaches limit, reset number
      c = 0;
    }
    c++; //increase local modulation variable
    s += 3; //increase local saturation variable
    b += 3; //increase local brightness variable
  }

  
  
}


