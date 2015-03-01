
void setup() {
  size(700, 700);
}
  
void draw() {
  background(51,9,7);
  fill(156,61,56);
   ellipse(320,275,400,400);
  fill(7,51,7);
  ellipse(240, 225, 130, 90); //left eye
  fill(15,7,242);
  ellipse(400, 225, 130, 90); //right eye
  fill(242,7,31);
  //rect(210,300,220,100);   // Mouth
  rect(mouseX,mouseY,220,100);
  noStroke();
  float pupilX = map(mouseX, 0, width, 215, 265);
  float pupilY = map(mouseY, 0, height, 205, 240);
  float pupilA = map(mouseX, 0, width, 375, 400);
  fill(242,228,29);
  if(mousePressed)                   // Makes pupil turn black when pressed
  fill(0);
  ellipse(pupilX, pupilY, 30, 60); //left pupil
  ellipse(pupilA, pupilY, 20, 40); //right pupil
    
 
       
 
  }

