



int max_height = 80;
int min_height = 55;
int letter_height = mouseX; 
int letter_width = 40;          

int x = -letter_width;          
int y = 0;                      

boolean newletter;              

int numChars = 26;      
color[] colors = new color[numChars];

void setup()
{
  size(1200, 450);
  noStroke();
   strokeWeight(100);
  stroke(1,0,100,10);
  smooth();
   frameRate(800);
  noCursor();
  
  delay(3000);
  background(30, 13, random(35));
  
  
  float r = random(50);
  for(int i=0; i<numChars; i++) {
    colors[i] = color(i, i);    
    
    
  }
}

void draw()
{
  if(newletter == true) {
    int y_pos;
    if (letter_height == max_height) {
      y_pos = y;
      tint(23, 10, 135, random(234));
      ellipse( mouseX, mouseY-100, random(-23, 52), letter_height );
    } else {
      y_pos = y + min_height;
      tint( random(235), random(23), 245);
      rect( x, y_pos, letter_width, random(23, 362) );
      fill(200, 80, -25);
      ellipse( mouseY+58, y_pos-min_height,letter_width, letter_height );
    }
    newletter = false;
  }
}

void keyPressed()
{
  if( key >= 'A' && key <= 'z') {
    int keyIndex;
    if(key <= 'Z') {
      keyIndex = key-'A';
      letter_height = max_height;
      fill(random(254));
    } else {
      keyIndex = key-'a';
      letter_height = min_height;
      fill(colors[key-'a']);
    }
  } else {
    fill(random(45), random(124), 235);
    letter_height = mouseX-78;
  }
 
  newletter = true;

  x = ( x + letter_width + mouseX); 
  
  if (x > width - letter_width) {
    x = 0;
    y+= max_height;
  }

  if( y > height - letter_height) {
    y = mouseY-200;     
  }
}


