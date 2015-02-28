
import processing.xml.*;
import processing.candy.*;

color SelectedColor = color(16,93,193);
PImage b;
int Counter;
void setup() {
  size(400,600);
  background(SelectedColor);
  //frameRate(10);  // Animate slowly
  b = loadImage("16mil.jpg");
  smooth();
  Counter = 0;
  randomSeed(7);
}


void draw() {
  if(Counter <20)
  {
   color c = color(red(SelectedColor)-5,
                  green(SelectedColor)-5,
                  blue(SelectedColor)-5);
  
  fill(SelectedColor); 
  stroke(255);
  rect(random(-20,400), random(-50,800), random(50,100), random(100,150));
  
  c = color(red(SelectedColor)+30,
                  green(SelectedColor)+30,
                  blue(SelectedColor)+30);
  fill(c); 
  rect(random(-20,400), random(-10,800), random(100,200), random(50,150)); 
  c = color(red(SelectedColor)-30,
                  green(SelectedColor)-30,
                  blue(SelectedColor)-30);
  fill(c); 
  rect(random(-20,400), random(0,800), random(50,100), random(100,150)); 
  
  c = color(red(SelectedColor)-10,
                  green(SelectedColor)-10,
                  blue(SelectedColor)-10);
  fill(c); 
  rect(random(-20,400), random(0,800), random(50,100), random(100,150)); 
  
  c = color(red(SelectedColor)+10,
                  green(SelectedColor)+10,
                  blue(SelectedColor)+10);
  fill(c); 
  rect(random(-20,400), random(0,800), random(50,100), random(100,150)); 
  Counter++;
  }
  
  
 image(b,300,415);
 //save("color.jpg");
 if (mousePressed == true) 
  {
    
    color cp = get(mouseX, mouseY);
    SelectedColor = cp;
    randomSeed(7);
    background(cp);
    Counter = 0;
    
  }
}

