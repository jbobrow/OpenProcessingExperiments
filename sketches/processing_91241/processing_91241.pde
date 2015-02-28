
//HSB cycles through color value in an increment from 0-99 and back to 0.
float increment;

void setup(){
 
  size(500,450);
  smooth();
  colorMode(HSB,100); // processing supports different color modes
}                     // HSB means hue, saturation and brightness
 
void draw(){
 
fill(increment,100,100);
  ellipse(mouseY,mouseX,50,50); // the mouseY and mouseX have been swapped around
  ellipse(mouseX,mouseY,50,50); // creating a very simple symmetrical effect
 
  
  increment = increment+1; // this is adding one to the increment variable every frame
  if (increment > 100) {   // this is saying that once increment reaches 100
  increment = 0;         //  set increment back to 0
 }
 
}
 
void mousePressed() {  // this is called an "event listener" it runs when you click
 background(random(100),random(100),random(100)); // and refreshes the background to white
 
}


