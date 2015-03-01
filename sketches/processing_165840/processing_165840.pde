


PImage[] buttons;
int selButton = 0;
PFont font;


void setup() {
   
  size(800, 800);
  // Using an array to store the button images:
  buttons = new PImage[14];
  buttons[0] = loadImage("10.png");
  buttons[1] = loadImage("11.png");
  buttons[2] = loadImage("12.png");
  buttons[3] = loadImage("13.png");
  buttons[4] = loadImage("14.png");
  buttons[5] = loadImage("15.png");
  buttons[6] = loadImage("16.png");
  buttons[7] = loadImage("17.png"); 
  buttons[10] = loadImage("1.png");
  buttons[11] = loadImage("2.png");
  buttons[12] = loadImage("3.png"); 
  buttons[13] = loadImage("4.png");   
  buttons[8] = loadImage("erasercopy.png"); // This is just a white circle to use as an eraser
  background(255);
  font = loadFont("IowanOldStyle-Italic-25.vlw");


  smooth();
}






void draw() {
  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 200) {
      // ...inside menu area, need to check which button is being pressed:


      if (15 < mouseX && mouseX < 70 && 50 < mouseY && mouseY < 120)  selButton = 0;
      else if (10 < mouseX && mouseX < 120 && 140 < mouseY && mouseY < 240) selButton = 1;
      else if (10 < mouseX && mouseX < 120 && 230 < mouseY && mouseY < 300)  selButton = 2;
      else if (10 < mouseX && mouseX < 120 && 320 < mouseY && mouseY < 420)  selButton = 3;
      else if (115 < mouseX && mouseX < 235 && 30 < mouseY && mouseY < 110) selButton = 4;
      else if (115 < mouseX && mouseX < 235 && 120 < mouseY && mouseY < 200)  selButton = 5;
      else if (105 < mouseX && mouseX < 225 && 200 < mouseY && mouseY < 300)  selButton = 6;
      else if (125 < mouseX && mouseX < 246 && 320 < mouseY && mouseY < 400)  selButton = 7;
      
      else if (15 < mouseX && mouseX < 85 && 480 < mouseY && mouseY < 550) selButton = 10;
      else if (105 < mouseX && mouseX < 175 && 480 < mouseY && mouseY <550)  selButton = 11;
      else if (15 < mouseX && mouseX < 85 && 560 < mouseY && mouseY < 630)  selButton = 12;
      else if (105 < mouseX && mouseX < 175 && 480 < mouseY && mouseY < 630)  selButton = 13;
      else if (25 < mouseX && mouseX < 244 && 680 < mouseY && mouseY < 766)  selButton = 8;
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      image(buttons[selButton], mouseX - 50, mouseY - 50);
    }
  }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(180);
  rect(0, 0, 200, height);
  image(buttons[0], 15, 50);
  image(buttons[1], 10, 140);
  image(buttons[2], 10, 230);  
  image(buttons[3], 15, 320);  

  image(buttons[10], 15, 480);
  image(buttons[12], 15, 560);  
  
  image(buttons[4], 115, 30);  
  image(buttons[5], 115, 120);  
  image(buttons[6], 105, 200);  
  image(buttons[7], 125, 320);  

  image(buttons[11], 105, 480);    
  image(buttons[13], 105, 560); 
  
  image(buttons[8], 25, 680); 


  textSize(20) ;
  textFont(font,18);
  fill(50);
  text("Animal brush",15,25);
  text("Pattern brush",15,460);         
  text("Eraser",15,670);    
  fill(20);
  text("200912707 hyeju Kim",15,780); 

  //Draw outline around selected button:
//  noFill();
 // stroke(120);
 // if (selButton == 0) rect(20, 20, 100, 100);
 // else if (selButton == 1) rect(20, 140, 100, 100);
 // else if (selButton == 2) rect(20, 260, 100, 100);
}

 



void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}









