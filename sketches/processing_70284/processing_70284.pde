
float angle = 0; //initiating angle for line
color currentColor;

void setup() {
  size(800,800);
  smooth();
  colorMode(HSB, 100);
  background(100);
}

 
 
void draw() {
   
  float abstand = dist(pmouseX, pmouseY, mouseX, mouseY);
  angle += 0.2; //give the line angle a value
 
  if(mousePressed == true) {
    if (abstand > 20) {
      abstand = 20;
    }
    strokeWeight(20-abstand);
    line(pmouseX, pmouseY, mouseX, mouseY);
    translate (mouseX, mouseY); //draws line at position where mouse is pressed
    rotate (angle); //rotates line at an angle when mouse is pressed 
    line (0, 0, random(200), 50); //draws the line at random heights(min 50, max 200)
  }
 
}

//void mousePressed() {
// stroke(random(255), 100, 50, 80);
//}


// changes color of strokes to red, green and blue on key press
void keyPressed(){
  if (key == 'r'){
    stroke(200, 100, 70, 80);
  }
  else{
    if (key == 'b'){
      stroke(50, 255, 70, 80);
    }
    else{
      if(key == 'g'){
        stroke(20, 70, 80, 80);
      }
    }
  }
}




