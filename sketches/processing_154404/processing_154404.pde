
void setup() {
  size(500, 500);
  frameRate(3000);
  stroke(255);
  background(255, 154, 25);
}


//definitions
color pencolor = #0C48F5;
color blue = #0C48F5;
color green = #17FF30;
color pink = #EF17FF;
color yellow = #FAFF17;
color eraser = #FF9A19;

int thick = 5;
int thicker = 70;


void draw() {
  noStroke();
  rect(10, 10, 20, 20);
  fill(255);
   
  stroke(pencolor);
  
    if(keyPressed) {
      if(key == 'p' || key == 'P') {
        pencolor = pink;
        strokeWeight(thick);
      }
      else if(key == 'y' || key == 'Y') {
        pencolor = yellow;
        strokeWeight(thick);
      }
      else if(key == 'g' || key == 'G') {
        pencolor = green;
        strokeWeight(thick);
      }
      else if(key == 'b' || key == 'B') {
        pencolor = blue;
        strokeWeight(thick);
      }
      else if(key == 'e' || key == 'E') {
        pencolor = eraser;
        strokeWeight(thicker);
      }
    }
    if(mousePressed) {
      if(mouseX < 30 && mouseX > 10 && mouseY <30 && mouseY > 10) {
        background(255, 154, 25);
        
      }
    
    line(mouseX, mouseY, pmouseX, pmouseY);
    fill(pencolor);
    
  
  }
}





