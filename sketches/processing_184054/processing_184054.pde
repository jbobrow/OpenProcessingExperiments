
int space = 1000; //at one second
int startTime, pastTime;
float h, s, b, a, pointBx, pointBy, weight;
PFont myFont;
boolean test = false;
 
void setup() {
  size (600,600,P3D); //building
  colorMode ( HSB ); //color type
   
  background(255,0,255); //dark grey. could make change on click
   
  h = random(0,255); //initializing color

  a = 255;
   
  //beginning time
  startTime = millis(); //record start time
  pastTime = startTime + space; //set up first marker
   
  //font properties
  myFont = createFont("UniversLTStd-Bold", 100, false);
  textFont(myFont);
  textAlign(CENTER, CENTER);
}
 
void draw() {
  /*should recommend clicking right next to the cursor but cannot make work. I think it is something silly i am missing
  if( millis() <= pastTime ){ //initiate recommend clicking
    fill(255,255,255);
    //test = true;
    text("click", mouseX+25, mouseY+25);
    rect(mouseX, mouseY, 50, 50);
    println("check");
     
  }
  else{
    background(0,0,50);
  }
   
  if(test) {
    fill(0,0,255);
    text("click", mouseX+25, mouseY+25);
    rect (mouseX, mouseY, 50, 50);
  }*/
   
  noFill();
     
  if (mousePressed) {
    for ( int i = 1 ; i < 6 ; i = i+1 ){ //outside loop for line repeat
      weight = random(1,4); //weight variable
      strokeWeight (weight); //change line weight every loop
      h = random (0,255); //small hue variety at random
      if (weight >= 2) { //lower opacity on the thicker lines
        a = 100; //less than 50%
      }
      stroke (h,a); //set stroke color and weight
      pointBx = random(-100,700); //point B is random and allowed outside the frame
      pointBy = random(-100,700); //point B is random and allowed outside the frame
      line( mouseX, mouseY, pointBx, pointBy ); //draw line with new color and new ending point
    }
    h = random (0, 255); //random line color
  }
  else{
    background(0,0,50); //reset background
    strokeWeight (2); //circle following the
    stroke (h, s, b); //random color
    stroke(255);
    translate(mouseX,mouseY);
    box(50); //ellipse follows mouse
  }
}


