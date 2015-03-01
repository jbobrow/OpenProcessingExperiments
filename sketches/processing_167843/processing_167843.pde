
PImage backImage;
PImage[] buttons;
int selButton = 0;
int a = 80;
int b= 25;
int c= 60;

/* @pjs preload="background.png"; */ 

/* @pjs preload="0.png"; */
/* @pjs preload="1.png"; */ 
/* @pjs preload="2.png"; */ 
/* @pjs preload="3.png"; */ 
/* @pjs preload="4.png"; */
/* @pjs preload="5.png"; */ 
/* @pjs preload="6.png"; */ 
/* @pjs preload="7.png"; */ 
/* @pjs preload="8.png"; */ 
/* @pjs preload="9.png"; */ 
/* @pjs preload="10.png"; */ 
/* @pjs preload="11.png"; */
/* @pjs preload="12.png"; */ 
/* @pjs preload="13.png"; */ 
/* @pjs preload="14.png"; */
/* @pjs preload="eraser.png"; */ 


void setup() {
  size(800, 800);

  // Using an array to store the button images:
  buttons = new PImage[16];
    
  buttons[0] = loadImage("0.png"); 
  buttons[1] = loadImage("1.png"); 
  buttons[2] = loadImage("2.png"); 
  buttons[3] = loadImage("3.png"); 
  buttons[4] = loadImage("4.png"); 
  buttons[5] = loadImage("5.png"); 
  buttons[6] = loadImage("6.png"); 
  buttons[7] = loadImage("7.png"); 
  buttons[8] = loadImage("8.png"); 
  buttons[9] = loadImage("9.png"); 
  buttons[10] = loadImage("10.png"); 
  buttons[11] = loadImage("11.png"); 
  buttons[12] = loadImage("12.png"); 
  buttons[13] = loadImage("13.png"); 
  buttons[14] = loadImage("14.png");
  buttons[15] = loadImage("eraser.png");  // This is just a white circle to use as an eraser
  
  background(255);

  //drawing board 

backImage = loadImage("background.png"); 
image(backImage, 0, 0); 
}

void draw() {

    
  if (mousePressed) { // User is pressing mouse...

    if (mouseX < 200) {
      // ...inside menu area, need to check which button is being pressed:
           if (b < mouseX && mouseX < b+c && a*1 < mouseY && mouseY < a*1+c) selButton = 0;
      else if (b < mouseX && mouseX < b+c && a*2 < mouseY && mouseY < a*2+c) selButton = 1;
      else if (b < mouseX && mouseX < b+c && a*3 < mouseY && mouseY < a*3+c) selButton = 2;
      else if (b < mouseX && mouseX < b+c && a*4 < mouseY && mouseY < a*4+c) selButton = 3;
      else if (b < mouseX && mouseX < b+c && a*5 < mouseY && mouseY < a*5+c) selButton = 4;
      else if (b < mouseX && mouseX < b+c && a*6 < mouseY && mouseY < a*6+c) selButton = 5;
      else if (b < mouseX && mouseX < b+c && a*7 < mouseY && mouseY < a*7+c) selButton = 6;
      
      else if (b*4 < mouseX && mouseX < b*4+c && a*1 < mouseY && mouseY < a*1+c) selButton = 7;
      else if (b*4 < mouseX && mouseX < b*4+c && a*2 < mouseY && mouseY < a*2+c) selButton = 8;
      else if (b*4 < mouseX && mouseX < b*4+c && a*3 < mouseY && mouseY < a*3+c) selButton = 9;
      else if (b*4 < mouseX && mouseX < b*4+c && a*4 < mouseY && mouseY < a*4+c) selButton = 10;
      else if (b*4 < mouseX && mouseX < b*4+c && a*5 < mouseY && mouseY < a*5+c) selButton = 11;
      else if (b*4 < mouseX && mouseX < b*4+c && a*6 < mouseY && mouseY < a*6+c) selButton = 12;
      else if (b*4 < mouseX && mouseX < b*4+c && a*7 < mouseY && mouseY < a*7+c) selButton = 13;
      
      else if (60 < mouseX && mouseX < 60+c && a*8 < mouseY && mouseY < a*8+25+c) selButton = 15;

      
    } 
    
    else
    {
      
            
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:

        image(buttons[selButton], mouseX - 50, mouseY - 50);
      }
    }

  // Draw menu at the end so overwrites drawing going outside the border of the drawing area  
  noStroke();
  fill(0);
  //rect(0, 0, 200, height);
  image(buttons[0], b, a*1);
  image(buttons[1], b, a*2);
  image(buttons[2], b, a*3);  
  image(buttons[3], b, a*4);
  image(buttons[4], b, a*5);
  image(buttons[5], b, a*6);
  image(buttons[6], b, a*7);
  
  image(buttons[7], b*4, a*1);
  image(buttons[8], b*4, a*2);
  image(buttons[9], b*4, a*3);
  image(buttons[10], b*4, a*4);
  image(buttons[11], b*4, a*5);
  image(buttons[12], b*4, a*6);
  image(buttons[13], b*4, a*7);
  
  image(buttons[14], 60 , a*8+25);

  
  //Draw outline around selected button:
  noFill();
  stroke(120);
  if      (selButton == 0) rect(b, a*1, c, c);
  else if (selButton == 1) rect(b, a*2, c, c);
  else if (selButton == 2) rect(b, a*3, c, c);
  else if (selButton == 3) rect(b, a*4, c, c);
  else if (selButton == 4) rect(b, a*5, c, c);
  else if (selButton == 5) rect(b, a*6, c, c);
  else if (selButton == 6) rect(b, a*7, c, c);
  
  else if (selButton == 7) rect(b*4, a*1, c, c);
  else if (selButton == 8) rect(b*4, a*2, c, c);
  else if (selButton == 9) rect(b*4, a*3, c, c);
  else if (selButton == 10) rect(b*4, a*4, c, c);
  else if (selButton == 11) rect(b*4, a*5, c, c);
  else if (selButton == 12) rect(b*4, a*6, c, c);
  else if (selButton == 13) rect(b*4, a*7, c, c);
  
  else if (selButton == 15) rect(60, a*8+25, c, c);
  
  
}

void keyPressed() {
  // Press any key to save 
  PImage img = get(200, 0, width - 200, height);
  img.save("drawing.png");
}



