
//here is a program that generates colors and translate rectangles.

float x=-20;
float y;
float transparent=255;
int htg = color (255);
void setup() {
  size(200, 200);
  background(htg);
  smooth();
  noStroke();
  frameRate (400);
}

void draw() {
  x = x+1;
 
  if (frameCount % 20 == 0) {
    fill(frameCount * 10 % 255, frameCount * 20 % 255, 
    frameCount * 100 % 255,transparent);
   
    //pushMatrix();
    //translate(20,20);
   // rotate(radians(frameCount * 2  % 360));
    rect(x, y, 20, 20);
    fill (0);
    println(transparent);
    //popMatrix();
  }

  if (x > width-20) {
    // transparent -=20;
     x=-19;
    y +=20;
    
  }

  if (y > height-20) {
    delay (150);
     background(htg);
    x=-19;
    y =0;
  }
}
//------SAVE------------
void keyReleased() {
  if (keyCode == CONTROL) 
    saveFrame(timestamp()+".jpg");
}
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM", now);
}
//--------------------------

