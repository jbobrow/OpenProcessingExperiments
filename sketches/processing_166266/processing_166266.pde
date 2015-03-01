

PImage[] buttons; 
int selButton = 0; 

void setup() { 


  size(900, 750); 


buttons = new PImage[6]; 
  buttons[0] = loadImage("Pinocho.png"); 
  buttons[1] = loadImage("Bamby.png"); 
  buttons[2] = loadImage("Blanca.png"); 
  buttons[3] = loadImage("Alicia.png"); 
  buttons[4] = loadImage("Daisy.png"); 
  buttons[5] = loadImage("Eraser.png");


  background(230,211,234); 
  smooth(); 
} 

void draw() { 
  if (mousePressed) { 
  if (mouseX < 200) { 
  if (20 < mouseX && mouseX < 120 && 20 < mouseY && mouseY < 120)  selButton = 0; 
  else if (20 < mouseX && mouseX < 120 && 140 < mouseY && mouseY < 240) selButton = 1; 
  else if (20 < mouseX && mouseX < 120 && 260 < mouseY && mouseY < 360)  selButton = 2; 
  else if (20 < mouseX && mouseX < 120 && 380< mouseY && mouseY < 480)  selButton = 3; 
  else if (20 < mouseX && mouseX < 120 && 500< mouseY && mouseY < 600)  selButton = 4; 
  else if (20 < mouseX && mouseX < 120 && 500< mouseY && mouseY < 720)  selButton = 5; 
  } 
  else { 
  image(buttons[selButton], mouseX - 50, mouseY - 50); 
  } 
  } 

  noStroke(); 
  fill(190,195,247); 
  rect(0, 0, 200, height); 
  image(buttons[0], 20, 20); 
  image(buttons[1], 20, 140); 
  image(buttons[2], 20, 260);  
  image(buttons[3], 20, 380);   
  image(buttons[4], 20, 500);   
  image(buttons[5], 20, 620);   

  noFill(); 
  if (selButton == 0) rect(20, 20, 120, 120); 
  else if (selButton == 1) rect(20, 140, 120, 120); 
  else if (selButton == 2) rect(20, 260, 120, 120); 
  else if (selButton == 3) rect(20, 380, 120, 120); 
  else if (selButton == 4) rect(20, 500, 120, 120); 
  else if (selButton == 5) rect(20, 620, 120, 120); 
} 


  


void keyPressed() { 
  // Press any key to save  
  PImage img = get(200, 0, width - 200, height); 
  img.save("drawing.png"); 
} 



