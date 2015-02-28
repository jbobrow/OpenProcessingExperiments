
//center points
int cx;
int cy;
//colors
int purple;
int orange;
//legs
int spokeLength;
int howMany;
//center eyeball
float outsideW;
float insideW;
//outside eyeballs
float orangeOutsideW;
float orangeInsideW;

void setup() {
  size(800, 800);
  background(250);
}

void draw() {
}

void mouseClicked() {  
  cx= mouseX;
  cy= mouseY;
  
 //LEGS:
  howMany = int(6);
  //orange= color(random(200, 225), random(50, 100), 50, 150);
  for (int i = 0; i < howMany; i++) {
    spokeLength = int(random(40, 80));
      float orangeOutsideW= random(15, 25);
      float orangeInsideW= random(4, 10);
      float legX = cx + cos(radians(60*i)) * spokeLength;
      float legY = cy+ sin(radians(60* i))* spokeLength;
      //lines
      stroke(100, 200);
      strokeWeight(random(3));
      line(cx, cy, legX, legY);  
      //eyeballs
      orange= color(random(140, 240), random(50, 80), 50, 150);  
      fill(250);
      stroke(orange);
      strokeWeight(random(1,3));
      ellipse(legX, legY, orangeOutsideW, orangeOutsideW);
      fill(orange);
      noStroke();
      ellipse(legX, legY, orangeInsideW, orangeInsideW);
  }

   
  //CENTER EYEBALL:
    purple= color(random(100), 0, random(50, 100), 150);
    //outside circle:
      outsideW= random(30, 40); 
      fill(250);
      stroke(purple);
      ellipse(cx, cy, outsideW, outsideW);
    //inside circle:
      insideW= random(20, 25);  
      noStroke();
      fill(purple);
      ellipse(cx, cy, insideW, insideW);
     
}


