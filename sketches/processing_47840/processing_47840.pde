
//  R.A. Robertson 2011.12 "Swatch Maker" ~ www.rariora.org ~
// Generate a color palette from a base color and offsets.

int n;                         // Number of swatches.
color c;                        // Base color.
color ct;                        // String to number conversion.
float h, s, b, bt;                // HSB and text brightness.
int index;                         // UI Mouse Click.
String textInput;                   // UI Keyboard.
char valid[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
                'a', 'b', 'c', 'd', 'e', 'f', 'A', 'B', 'C', 'D', 'E', 'F'};
boolean validated;
PFont font;

void setup() {
  size (900, 170);
  background(0);
  colorMode(HSB, 360, 100, 100);
  font = createFont("arial", 20); 
  textFont(font, 12);
  textInput = "";
  n = 10;  // Initial number of swatches.
}

void draw() {
  
  textFont(font, 12);
  ct = unhex("ff" + textInput);  // Convert text string to color value.
  validated = false;
  if (textInput == "" || textInput.length() == 0 ) {
    c = color(#FF0000);  // Default base color.
  }  
  else
  c = color(ct);  // User input base color.  
  h = hue(c); 
  s = saturation(c); 
  b = brightness(c); // Extract values from base color.

  for (int i = 0; i < n; i++) {      // Generate swatches

    textAlign(LEFT, TOP);

    switch(index) {
    case 0:
      c = color(((i * 360/n) + h) % 360, s, b);      // Default: Hue offsets.
      fill(c);
      stroke(c);
      rect(i * width/n, 0, width/n, 200);
      fill(0, 0, bt);
      text(("h = " + round(hue(c)) + "º"), i * (width/n) + 6, 6);  
      break;
    case 1:
      c = color(h, ((i * 100/n) + s) % 100, b);    // Saturation offsets.
      fill(c);
      stroke(c);
      rect(i * width/n, 0, width/n, 200);  
      fill(0, 0, bt);
      text(("s = " + round(saturation(c))), i * (width/n) + 6, 6);  
      break;
    case 2:
      c = color(h, s, ((i * 100/n) + b) % 100);    // Brightness offsets.
      fill(c);
      stroke(c);
      rect(i * width/n, 0, width/n, 200);
      if (brightness(c) > 50) { bt = 0; }          // Dynamic b, so duplicate here (see below).
      else bt = 100;
      fill(0, 0, bt);
      text(("b = " + round(brightness(c))), i * (width/n) + 6, 6);  
      break;
    }

    if (brightness(c) > 50) { bt = 0; }          // Set text color (bt) to contrast b.
    else bt = 100;
    fill(0, 0, bt);
    textAlign(CENTER, CENTER);                    // Display color value text.
    text("#" + hex(c, 6), (i * (width/n) + (width/n)/2), height/2);
  }
  
  noStroke();                                    // Display UI text.
  fill(0, 0, 0);
  rect(0, 150, width, height);
  fill(0, 0, 100);
  textFont(font, 10);
  textAlign(LEFT, CENTER);
  text(" Type to enter new hex color value: #" + textInput, 6, 159);
  text(" Up / Down arrow keys set number of swatches:  " + n, width/4, 159);
  text(" Left / Right arrow keys cycle HSB offset type.", width/1.9, 159);  
  textAlign(RIGHT, CENTER);
  text("Click any swatch offset for new base color.  ", width, 159);
}

/*                INTERFACE                    */

void mousePressed() {            // Select swatch offset color as new base color.
if (mouseY < 150) { textInput = hex(get(mouseX, mouseY), 6); }
}

void keyPressed() {
  if (key == CODED) {             // Number of swatches.
    if (keyCode == UP) {
      n++ ;
    }  
    if (keyCode == DOWN) {
      n-- ;
      n = (n < 1) ? 1 : n;        // Constrain lower value to 1.
    }
    if (keyCode == RIGHT) {      //  Redundant to Mouse UI.
      index++;
      index = index % 3;
    }
    if (keyCode == LEFT) {      //  Reverse cycle direction.
      index = (index + 2);
      index = index % 3;
    }
  }
  
  if (key != CODED) {              //  Text entry.
    switch(key) {
    case BACKSPACE:    //  tip o' th' hat: Tom Carden http://wiki.processing.org/index.php/Typed_input
      textInput = textInput.substring(0, max(0, textInput.length()-1));
      break;
    case DELETE:
      break;
    default:

      for (int j = 0; j < valid.length; j++) {  // Limit to valid chars.
        if (key == valid[j]) {
          validated = true;
        }
      }

      if (validated == true) {
        if (textInput.length() <= 5) {  // Limit input to 6 chars.
          textInput += key;
          textInput = textInput.toUpperCase();
        }
      }
    }
  }
}      
                                
