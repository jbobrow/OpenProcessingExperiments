
String[] headlines = {
  "Geoff's", 
  "Superlative Sandwiches",
  };

PFont f;  // Global font variable
float x;  // horizontal location of headline
int index = 0;

void setup() {
  size(400,200);
  f = createFont("Garamond",40,true);  
  x = width; 
}

void draw() {
  background(255);
  
  //bun
  fill(242, 218, 137);
  rect(125, 45, 150, 35);
  rect(125, 107, 150, 30);
  
  //lettus
  fill(0, 70, 32); 
  rect(130, 80, 140, 2);
  rect(130, 82, 140, 2);
  rect(130, 84, 140, 2);
  rect(130, 86, 140, 2);
  
  //tomatoes
  fill(234, 21, 25);
  rect(133, 88, 65, 10);
  rect(203, 88, 65, 10);
  
  //meat
  fill(242, 245,225);
  rect(130, 98, 140, 3);
  rect(130, 101, 140, 3);
  
  //cheese
  fill(250, 113, 0);
  rect(130, 104, 140, 3);
  
  //text
  fill(0,0,0);
  textFont(f,40);        
  textAlign(LEFT);
  text(headlines[index],x,180); 
  x = x - 2.5;
  // If x is less than the negative width, 
  // then it is off the screen
  float w = textWidth(headlines[index]);
  if (x < -w) {
    x = width; 
    index = (index + 1) % headlines.length;
  }
  
  
  
}

