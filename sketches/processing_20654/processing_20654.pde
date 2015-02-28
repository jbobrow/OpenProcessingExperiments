
/**
 * Scale Shape.  
 * Illustration by George Brower. 
 * 
 * Move the mouse left and right to zoom the SVG file.
 * This shows how, unlike an imported image, the lines
 * remain smooth at any size.
 */

PShape bot, bot1, bot2;
float x; 

void setup() {
  size(640,380);
  smooth();
  // The file "bot1.svg" must be in the data folder
  // of the current sketch to load successfully
  bot = loadShape("bot1.svg");
  bot1 = loadShape("2.svg");
  bot2 = loadShape("3.svg");
} 

void draw() {
  background(0);
  translate(width/2, height/2);

  float s1 = second();

  float zoom = map(mouseX, 0, width, 0.1, 4.5);
  if(s1%2 == 0){
    scale(1.5);
  }
  else if(s1%2 == 1){
    scale(1);
  }

    shape(bot, -140,-140);
  //shape(bot1, -300,-200);
  //shape(bot2, -300,-200);
    float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  stroke(255);
  strokeWeight(1);
  stroke(35);
  line(5, 30, cos(s) * 72 + 10, sin(s) * 72 + 10);
  strokeWeight(2);
  line(5,30, cos(m) * 60 + 10, sin(m) * 60 + 10);
  strokeWeight(4);
  line(5,30, cos(h) * 50 + 10, sin(h) * 50 + 10);
  
  if(s%59 == 0){
    stroke(45); 
    fill(99);
    ellipse(101,-50, 30, 30);
    ellipse(-101,-50, 30, 30);
  }
  else{
    stroke(45); 
    ellipse(101,-50, 30, 30);
    ellipse(-101,-50, 30, 30);
  }
  
  if(m%59 ==0){
    print("TOP OF THE HOUR!!!");
  }
}

