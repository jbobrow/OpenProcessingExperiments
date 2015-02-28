

void setup() {
  size(600, 600);
}
 
void draw() {
  background(250); 
  fill(289,18,109);
   ellipse(320,275,350,350);
  fill(255);
  ellipse(240, 225, 120, 80); //left eye
  ellipse(400, 225, 120, 130); //right eye
  fill(50);
  ellipse(320,350,80,100);   // Mouth
  noStroke();
  float pupilX = map(mouseX, 0, width, 215, 265);
  float pupilY = map(mouseY, 0, height, 205, 240);
  float pupilA = map(mouseX, 0, width, 375, 425);
  fill(225, 13, 13);
  if(mousePressed)                   
  fill(0);
  ellipse(pupilX, pupilY, 20, 40); 
  ellipse(pupilA, pupilY, 20, 40); 
   

      

  }


