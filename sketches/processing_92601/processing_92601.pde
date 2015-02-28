
//Ayla El-Moussa
//devided screen 


void setup() {
  size(300, 500);
  frameRate(24);
  smooth();
  background(255,0,174);
}


void draw() {
  fill(245, 167, 245);
  background();

  if (mouseY < 200) {
    ellipse(mouseX, mouseY, 50, 50);

    fill(35, 164, 166);

    if (mouseY >10) {
      line(mouseX, mouseY, 40, 30);
      
       
    if (mouseX>250);{
       
        fill(54, 6, 54);
        rect(250, 0, 250, 250);
      }
  };


      if (mouseX <70) {
        rect(mouseX, mouseY,10,10);
      }
    }
  }
