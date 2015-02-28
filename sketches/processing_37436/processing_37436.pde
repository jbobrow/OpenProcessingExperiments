
float increment;

void setup() {
  size(screen.width, screen.height);
  background(0);
  smooth();
  colorMode(HSB,100); // processing supports different color modes
                   // HSB means hue, saturation and brightness
  
}

void draw(){
 
fill(increment,100,100,20);
  ellipse(mouseX,mouseY,50,50); // the mouseY and mouseX have been swapped around
  ellipse(mouseX,mouseY,10,10); // the mouseY and mouseX have been swapped around
  noStroke();
 
  increment = increment + 1; // this is adding one to the increment variable every frame
  if (increment > 100) {   // this is saying that once increment reaches 100
   increment = 0;         //  set increment back to 0
  }
 
}

void mousePressed() {

background(127, 0, 99);

}


void keyPressed() {
background(0);  
}

                
