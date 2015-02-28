

float crownWidth;
float crownHeight;
float jewelWidth;
float jewelHeight;
int lastSecond = 0;

void setup() {
  size(1024, 768);
  noFill();
}

void draw() {
  background(255);
 
 if (mousePressed == true) {
   crownWidth = map(mouseX, 200, width, 200, 400);
   crownHeight = map(mouseX, 0, width, 50, 100);
   jewelWidth = map(mouseX, 30, width, 30, 60);
   jewelHeight = map(50, mouseY, width, 50, 70);
 
 } else {
   
    int currentSecond = second();
    if (currentSecond != lastSecond) {
    
      crownWidth = random(200, 400);
      crownHeight = random(50, 100);
      jewelWidth = random(40, 60);
      jewelHeight = random(50, 70);
    
        lastSecond = currentSecond;
    }
    
  }
  println(second() + "--" + lastSecond);
  
  drawCrown(crownWidth, crownHeight);
  drawJewels(jewelWidth, jewelHeight);
}
//
//
//void drawCrown ();
//  drawJewels();
//  drawShape();
//}


void drawJewels (float jewelWidth, float jewelHeight) {
  fill(255);
  ellipseMode(CENTER);
  ellipse(512, 412, jewelWidth, jewelHeight);
  ellipse(512, 412, jewelWidth-30, jewelHeight-30);
  
  ellipse(462, 400, jewelWidth-10, jewelHeight-20);
  ellipse(462, 400, jewelWidth-15, jewelHeight-25);
  
  ellipse(562, 400, jewelWidth-10, jewelHeight-20);
  ellipse(562, 400, jewelWidth-15, jewelHeight-25);
  
  ellipse(422, 400, jewelWidth-20, jewelHeight-35);
  ellipse(602, 400, jewelWidth-20, jewelHeight-35);
}


void drawCrown (float crownWidth, float crownHeight) {

  // and width of crown
  stroke(0);
  arc(512, 412, crownWidth, 80, 0, PI);
  
  // and height of crown
  line(512-crownWidth/2, 412, 512-crownWidth/2, 212+crownHeight);
  line(512+crownWidth/2, 412, 512+crownWidth/2, 212+crownHeight);
  
  // here determine height of triangles on top of crown
  line(512-crownWidth/2, 212 + crownHeight, 512-crownWidth/2+crownWidth/4, 212+crownWidth/4 + crownHeight);
  line(512-crownWidth/2+crownWidth/4, 212+crownWidth/4 + crownHeight, 512-crownWidth/2+crownWidth/4+crownWidth/4, 212 + crownHeight);
  line(512-crownWidth/2+crownWidth/4+crownWidth/4, 212 + crownHeight, 512-crownWidth/2+crownWidth/4+crownWidth/4+crownWidth/4, 212+crownWidth/4 + crownHeight);
  line(512-crownWidth/2+crownWidth/4+crownWidth/4+crownWidth/4, 212+crownWidth/4 + crownHeight, 512-crownWidth/2+crownWidth/4+crownWidth/4+crownWidth/4+crownWidth/4, 212 + crownHeight);
 
}









