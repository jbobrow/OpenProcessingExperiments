
int width = 1000;
int height = 500;

// Initialize global variables and will set the initial values of these variables in the "re_set()" function.
color background_c;
float rect_x;
float rect_w;
float rect_h;
float y; 
float circle_x;
float w; 
float h;

int box_x; 
int box_y;
int box_w;
int box_h;

float touch_pt_x;
float touch_pt_y;

int speed;

boolean button;

void setup() {
  size(1000, 500);
  smooth();
  frameRate(15);
  
  re_set();
}


String[] text_list = {"         They mean...RED!", "         They mean...GREEN!", "         They mean...BLUE!"};
String[] binary_list = {"01110010 01100101 01100100", "01100111 01110010 \n01100101 01100101 01101110","01100010 01101100 \n01110101 01100101"};
color[] color_list = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)};

int current_binary_index;               

void draw() {
  background(background_c);
  binary_text_circle(binary_list[current_binary_index]);
  text_box();
  rounded_rect(10.0, 20.0, color(100, 25, 25));
  
  if(button) {
    move_rect(); 
  }
  
  // Change the background color to reveal the answer when the rect touches the binary box.
  if(rect_w >= dist(rect_x, y, touch_pt_x, touch_pt_y)) {
    
    // Coordinate the background color with the binary text.
    background(color_list[current_binary_index]);
    
    text_box();
    // Coordinate the text in the binary text circle with the color.
    binary_text_circle(text_list[current_binary_index]);  
      
    rounded_rect(10.0, 20.0, color(background_c));
  }
  
  // Move the rect back to its original point when it moves out of the canvas.
  if(rect_x > width) {
    re_set();
  }

}


// Draw the rounded rectangle that moves across the canvas.
void rounded_rect(float corner_factor, float mid_disp_factor, color c) {
  
                        float corner = rect_w / corner_factor;
                        float midDisp = rect_w / mid_disp_factor;
                        
                        fill(c);
                        
                        beginShape();  
                        curveVertex(rect_x + corner, y);
                        curveVertex(rect_x + rect_w - corner, y);
                        curveVertex(rect_x + rect_w + midDisp, y + rect_h / 2.0);
                        curveVertex(rect_x + rect_w - corner, y + rect_h);
                        curveVertex(rect_x + corner, y + rect_h);
                        curveVertex(rect_x - midDisp, y + rect_h / 2.0);
                        
                        curveVertex(rect_x + corner, y);
                        curveVertex(rect_x + rect_w - corner, y);
                        curveVertex(rect_x + rect_w + midDisp, y + rect_h / 2.0);
                        endShape();
  
}


// Draw the text circle that displays the binary text.
void binary_text_circle(String color_name) {
  stroke(0);
  strokeWeight(2);
  noFill();
  
  ellipse(circle_x, y, w, h);
  
  fill(0);
  textSize(19);
  text(color_name, circle_x - 150, h + 85);

}


// Draw the text button that displays the "Welcome messages" on the canvas.
void text_box() {
  stroke(255);
  strokeWeight(6);
  fill(150);
  
  rect(box_x, box_y, box_w, box_h);
  
  fill(0);
  textSize(25);
  String text_1 = "What do those 0s and 1s mean?";
  String text_2 = "...Did you guess right?";
  
  // Display different messages based on the status of the rounded rect.
  if(button && rect_w - 20 > dist(rect_x, y, touch_pt_x, touch_pt_y)) {
    fill(background_c);
    text(text_2, box_x + 40, box_y + 35);
  } else {
    text(text_1, box_x + 40, box_y + 35);
  }

}


// Move the rounded rectangle.
void move_rect() {
  rect_x += speed; 
}


// Change the boolean button variable once the text button is pressed.
void mousePressed() {
  if(mouseX >= box_x && mouseX <= box_x + box_w && mouseY >= box_y && mouseY <= box_w + box_h) {
    button = !button;
  }
}


// Re-set the little animation.
void re_set() {
   background_c = color(255, 245, 211);
   rect_x = 30;
   rect_w = 150;
   rect_h = 80;
   y = height / 2; 
   circle_x = width * 0.75;
   w = 400; 
   h = 150;

   box_x = width / 4; 
   box_y = height / 8;
   box_w = 450;
   box_h = 60;

   touch_pt_x = circle_x - (w / 2);
   touch_pt_y = height / 2;

   speed = 15;

   button = false;
   
   // The current_binary_index takes in integers, so we need to change the floating point number 
   // result of the random() function to an integer.
   current_binary_index = (int) random(0, 3);
}









// The following function converts the temperature from Fahrenheit to Celsius.
// It's important to know that in order to get a floating point result, we must use 
// 5.0 and 9.0 in the formula, otherwise Processing will just return a result of 0.0.

/*float temp_converter (float x) {
  float y = (x - 32) * (5.0 / 9.0);
  return y;
}

void setup() {
  float celcius = temp_converter(400);
  println(celcius);
}
*/



