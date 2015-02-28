
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/49977*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
void setup(){
  size(900,900);
  frameRate(30);
}


void draw(){
  background(mouseX/3,(mouseX+1)/(mouseY+1),mouseY/3);
  
  noStroke();
  smooth();
  ellipse(mouseX, mouseY, mouseX-mouseY, mouseY-mouseX);

  if(mousePressed){
    fill(random(255), random(255), random(255), random(255));
  }
  else{
    fill(255);
  }
}


