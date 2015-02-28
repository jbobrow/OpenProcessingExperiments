
boolean button = false;

int x = 200;
int y = 360;
int w = 195;
int h = 35;

float thin_w = 30;
float wide_w = 80;
float thin_h = 45;
float wide_h = 25;

void setup() {
  size(400, 400);
  frameRate(45);
  smooth();
}

void draw() { 
  int cir_x = (3 * width) / 4 ;
  int cir_y = height / 5;
  int cir_size = 80;
  String button_text;
  
  // Draw the different scenarios depending on whether or not the button is pressed. 
  if(button) {
    background(176);
    
    // Draw the sun.
    noStroke();
    fill(255, 230, 0);
    ellipse(cir_x, cir_y, cir_size, cir_size);
    
    // Draw the curvy cloud around the sun.
    fill(255, 0, 0);
    strokeWeight(16);
    curve(cir_x, cir_y, 
    cir_x - 80, cir_y + 25, 
    cir_x + 80, cir_y - 30,
    cir_x + 40, cir_y - 120);
    
    // Color the buildings outline to be green.
    // stroke(0, 211, 12);
    // Draw the buildings outline.
    stroke(255, 0, 0);
    
    // Display the text on the button.
    button_text = "Click to unveil the moon!";
  } else {
    background(0);
    
    // Draw the moon.
    noFill();
    //stroke(255);
    strokeWeight(1);
    ellipse(cir_x, cir_y, cir_size, cir_size);
    stroke(255, 249, 67);
    fill(255, 249, 67);
    arc(cir_x, cir_y - 20, cir_size, cir_size, 0, PI + 5, OPEN);
       
    // Draw the curve around the moon.
    fill(255, 255, 240);
    curve(cir_x, cir_y, 
    cir_x - 50, cir_y - 20,  
    cir_x + 50, cir_y + 20, 
    cir_x + 40, cir_y - 70);
    
    // Color the buildings outline to be white.
    stroke(255);
    
    // Display the text on the button.
    button_text = "Click to unveil the sun!";
  }
  
    // Draw the buildings outline.
    strokeWeight(3);
    line(0, height / 2, thin_w, height / 2);
    line(thin_w, height / 2, thin_w, height / 2 + thin_h);
    line(thin_w, height / 2 + thin_h, 2 * thin_w, height / 2 + thin_h);
    line(2 * thin_w, height / 2 + thin_h, 2 * thin_w, height / 2 - thin_h);
    line(2 * thin_w, height / 2 - thin_h, 3 * thin_w, height / 2 - thin_h);
    line(3 * thin_w, height / 2 - thin_h, 3 * thin_w, height / 2 + thin_h / 2);
    line(3 * thin_w, height / 2 + thin_h / 2, 3 * thin_w + thin_w / 2, height / 2 + thin_h / 2);
    line(3 * thin_w + thin_w / 2, height / 2 + thin_h / 2, 3 * thin_w + thin_w / 2, height / 2);
    line(3 * thin_w + thin_w / 2, height / 2, 3 * thin_w + thin_w / 2 + wide_w, height / 2);
    line(3 * thin_w + thin_w / 2 + wide_w, height / 2, 3 * thin_w + thin_w / 2 + wide_w, height / 2 + thin_h / 2);
    line(3 * thin_w + thin_w / 2 + wide_w, height / 2 + thin_h / 2, 4 * thin_w + thin_w / 2 + wide_w, height / 2 + thin_h / 2);
    line(4 * thin_w + thin_w / 2 + wide_w, height / 2 + thin_h / 2, 4 * thin_w + thin_w / 2 + wide_w, height / 2 - thin_h / 2);
    line(4 * thin_w + thin_w / 2 + wide_w, height / 2 - thin_h / 2, 5 * thin_w + thin_w / 2 + wide_w, height / 2 - thin_h / 2);
    line(5 * thin_w + thin_w / 2 + wide_w, height / 2 - thin_h / 2, 5 * thin_w + thin_w / 2 + wide_w, height / 2);
    line(5 * thin_w + thin_w / 2 + wide_w, height / 2, 6 * thin_w + thin_w / 2 + wide_w, height / 2);
    line(6 * thin_w + thin_w / 2 + wide_w, height / 2, 6 * thin_w + thin_w / 2 + wide_w, height / 2 - thin_h - 10);
    line(6 * thin_w + thin_w / 2 + wide_w, height / 2 - thin_h - 10, 6 * thin_w + thin_w / 2 + 2 * wide_w, height / 2 - thin_h - 10);
    line(6 * thin_w + thin_w / 2 + 2 * wide_w, height / 2 - thin_h - 10, 6 * thin_w + thin_w / 2 + 2 * wide_w, height / 2 - thin_h / 2);
    line(6 * thin_w + thin_w / 2 + 2 * wide_w, height / 2 - thin_h / 2, 7 * thin_w + thin_w / 2 + 2 * wide_w + 12, height / 2 - thin_h / 2); 

    thin_w += 0.4;
    thin_h += 0.8;
    
    thin_w = constrain(thin_w, 30, 70);
    thin_h = constrain(thin_h, 45, 85);
      
  // Draw the button and the text characteristics.
  fill(175);
  noStroke();
  rect(x, y, w, h);
  fill(18, 250, 248);
  textSize(15);
  text(button_text, x + 8, y + h / 2 + 5);

}

// By changing the "trueness" of the button in the mousePressed event, we can keep the effect of when 
// the mouse is pressed unchanged until the button is pressed again.
void mousePressed() {
  if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
    button = !button;
    thin_w = 30;
    thin_h = 45;
  } 
}


// Check if the mouse is inside of the button and whether or not the mouse is pressed. Only when 
  // both of these criteria are met then the button is truly "pressed".
  /*if(mouseX >= x 
  && mouseX <= x + w 
  && mouseY >= y 
  && mouseY <= y + h 
  && mousePressed) {
    button = true; 
  } else {
    button = false;
  }*/



