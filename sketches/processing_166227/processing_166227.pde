
int xpos=75;
int ypos=50;
int s=35;
int h=40;

PImage[] buttons; 
int selButton = 0; 
PImage img1, img2;
PFont font;

void setup() { 
size(800, 600); 
background(0);

//drawing board
img1 = loadImage("bg.png");
//img2 = loadImage("fence.png");
image(img1, 190, 0);

//menu
  noStroke(); 
  fill(255,220,158); 
  rect(0, 0, 190, height); 
  

  buttons = new PImage[8]; 

  buttons[0] = loadImage("1.png"); 
  buttons[1] = loadImage("2.png"); 
  buttons[2] = loadImage("3.png"); 
  buttons[3] = loadImage("4.png"); 
  buttons[4] = loadImage("5.png"); 
  buttons[5] = loadImage("6.png"); 
  buttons[6] = loadImage("7.png"); 
  buttons[7] = loadImage("8.png"); 
  
  ellipseMode(RADIUS);
  
  //erasebutton//
  stroke(255);
  strokeWeight(1);
  fill(250,206,83);
  rect(35,350,121,50);
  textAlign(CENTER);
  font = loadFont("BerlinSansFB-Reg-48.vlw");
  stroke(5);
  textFont(font, 20);
  fill(255);
  text("DELETE", 96, 380);
  
  
} 




void draw() { 

  
  
  if (mousePressed) { 
    
    if (mouseX < 190) { 

      if      (35 < mouseX && mouseX < 93 && 50 < mouseY && mouseY < 103)  selButton = 0; 
      else if (35 < mouseX && mouseX < 93 && 108 < mouseY && mouseY < 161) selButton = 1; 
      else if (35 < mouseX && mouseX < 93 && 166 < mouseY && mouseY < 219)  selButton = 2; 
      else if (98 < mouseX && mouseX < 156 && 50 < mouseY && mouseY < 103)  selButton = 3; 
      else if (98 < mouseX && mouseX < 156 && 108 < mouseY && mouseY < 161) selButton = 4; 
      else if (98 < mouseX && mouseX < 156 && 166 < mouseY && mouseY < 219)  selButton = 5; 
      else if (35 < mouseX && mouseX < 93 && 224 < mouseY && mouseY < 277)  selButton = 6; 
      else if (98 < mouseX && mouseX < 156 && 224 < mouseY && mouseY < 277)  selButton = 7; 
      
    } else {image(buttons[selButton], mouseX - 26, mouseY - 26);   
    }
  
   if (35 < mouseX && mouseX < 156 && 350 < mouseY && mouseY < 400) {
      image(img1, 190, 0);
    
  }
  }
  
  // Draw menu at the end so overwrites drawing going outside the border of the drawing area   
  image(buttons[0], 35, 50); 
  image(buttons[1], 35, 108); 
  image(buttons[2], 35, 166);   
  image(buttons[3], 98, 50);   
  image(buttons[4], 98, 108); 
  image(buttons[5], 98, 166); 
  image(buttons[6], 35, 224);   
  image(buttons[7], 98, 224);   


}


void keyPressed() { 
  PImage img = get(200, 0, width - 200, height); 
  img.save("drawing.png"); 
} 



