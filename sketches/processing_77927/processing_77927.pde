


int arraySize = 100;
char [] chars = new char[arraySize];


void setup() {
  
    size(640, 400);
    mousePressed();
  // Create the font
  textFont(createFont("Helvetica", 8));
  
}
  
void draw() {
  
  background(102);
  fill(0);
  float xpos;
  int index;
  
  // text size increases as mouse moves to the right
  textSize(mouseX / (float)width * 40. + 8);
  // probability of each character being drawn increases as mouse moves up
  float probability = mouseY / (float)height;
  
  for(int i = 0; i < chars.length; i++)
  {
      xpos = (i / (float)chars.length) * width;
       
       for(int j = 0; j < 22; j++)
       {
         //  slightly random chance of being drawn
         if(random(1.) > probability) text(chars[i], xpos, j * 20);
       }
  } 
  
}

void mousePressed() {
  
  for(int i = 0; i < chars.length; i++)
  {
       chars[i] = char((int)random(127));
  } 
  
}


