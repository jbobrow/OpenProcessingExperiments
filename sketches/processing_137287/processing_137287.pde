
//A dynamic sketch with 3 eliipses always rotating within confinement 
//of the 3 rectangle.
//a stream of ellipses on moving a mouse across the canvas
//a flicker on the screen when you press a key 

Eye e1, e2, e3;
int rectWidth;
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];

int maxHeight = 40;
int minHeight = 20;
int letterHeight = maxHeight; // Height of the letters
int letterWidth = 20;          // Width of the letter

int x = -letterWidth;          // X position of the letters
int y = 0;                      // Y position of the letters

boolean newletter;              

int numChars = 26;      // There are 26 characters in the alphabet
color[] colors = new color[numChars];


void setup() {
  size(640, 360);
  noStroke();
  e1 = new Eye( 250,  16, 120);
  e2 = new Eye( 164, 185,  80);  
  e3 = new Eye( 420, 230, 220);
   rectWidth = width/4;
   for(int i = 0; i < numChars; i++) {
    colors[i] = color(i, numChars, numChars);
   }
}

void draw() {
  background(102);
  
  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);
  e3.update(mouseX, mouseY);

  e1.display();
  e2.display();
  e3.display();
  if(newletter == true) {
    // Draw the "letter"
    int y_pos;
    if (letterHeight == maxHeight) {
      y_pos = y;
      rect( x, y_pos, letterWidth, letterHeight );
    } else {
      y_pos = y + minHeight;
      rect( x, y_pos, letterWidth, letterHeight );
      fill(numChars/2);
      rect( x, y_pos-minHeight, letterWidth, letterHeight );
    }
    newletter = false;
  }
}

class Eye {
  int x, y;
  int size;
  float angle = 0.0;
  
  Eye(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
 }


  void update(int mx, int my) {
    angle = atan2(my-y, mx-x);
  }

  
  void display() {
    pushMatrix();
    translate(x, y);
    fill(255);
    rect(0, 0, size, size);
    rotate(angle);
    fill(153, 204, 0);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
    
     int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num; i++) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    ellipse(mx[index], my[index], i, i);
  }
    
  }
}
  void keyPressed() {
    
    if((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) {
    int keyIndex;
    if(key <= 'Z') {
      keyIndex = key-'A';
      letterHeight = maxHeight;
      fill(colors[key-'A']);
    } else {
      keyIndex = key-'a';
      letterHeight = minHeight;
      fill(colors[key-'a']);
    }
  } else {
    fill(0);
    letterHeight = 10;
  }

  newletter = true;

  // Update the "letter" position
  x = ( x + letterWidth ); 

  // Wrap horizontally
  if (x > width - letterWidth) {
    x = 0;
    y+= maxHeight;
  }

  // Wrap vertically
  if( y > height - letterHeight) {
    y = 0;      // reset y to 0
  }
  }
