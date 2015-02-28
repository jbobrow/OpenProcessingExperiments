
// October 2, 2011
// Ben Light
// bl1236@nyu.edu
// ICM Week 4

float x, y, a, b, c, d, e, f, g, h;
float growSpeed;
float shrinkSpeed;

// Button poisiton variables
int button1X, button1Y;
int button2X, button2Y;
int button3X, button3Y;
int button4X, button4Y;
int button5X, button5Y;

// Button size variable
int button1W, button1H, button1MaxH;
int button2W, button2H, button2MaxH;
int button3W, button3H, button3MaxH;
int button4W, button4H, button4MaxH;
int button5W, button5H, button5MaxH;

// Button Color Variables
float button1Color;
float button2Color;
float button3Color;
float button4Color;
float button5Color;

// Button Base Dimension Variables
int buttonWidth;
int buttonHeight;
int buttonSpace;

void setup(){
  size(400,600);
  smooth();
  
  x = 0;  // Button1's growing rect x
  y = 0;  // Button1's growing rect y
  a = 0;  // Button2's growing rect x
  b = 0;  // Button2's growing rect y
  c = 0;  // Button3's growing rect x
  d = 0;  // Button3's growing rect y
  e = 0;  // Button4's growing rect x
  f = 0;  // Button4's growing rect y
  g = 0;  // Button5's growing rect x
  h = 0;  // Button5's growing rect y
  
  growSpeed = 1;
  shrinkSpeed = 2;
  
  buttonWidth = 50;
  buttonHeight = 150;
  buttonSpace = 33;
  
  button1X = 50;
  button2X = button1X + buttonWidth + buttonSpace;
  button3X = button2X + buttonWidth + buttonSpace;
  button4X = button3X + buttonWidth + buttonSpace;
  button5X = button4X + buttonWidth + buttonSpace;
  
  button1Y = height - buttonHeight - 20;
  button2Y = height - buttonHeight - 20;
  button3Y = height - buttonHeight - 20;
  button4Y = height - buttonHeight - 20;
  button5Y = height - buttonHeight - 20;
  
  button1H = 100;
  button2H = 200;
  button3H = 300;
  button4H = 400;
  button5H = 500;
  
  button1Color = 235;
  button2Color = 235;
  button3Color = 235;
  button4Color = 235;
  button5Color = 235;
  
  
}

void draw(){
  background(255);
  
  
 // Button 1
  fill(button1Color, 0, 0);  // Color 1A
  if(mouseX >= button1X && mouseX <= button1X + buttonWidth &&
     mouseY >= button1Y && mouseY <= button1Y + buttonHeight){
       // If you are on Button 1 then
       if(mousePressed && x <= button1H){  // Height of new rectangle
         // If you click mouse while in the rect, new rectangle grows
         //fill(255,0,0);  // Color 1B
         x = x + growSpeed;
         y = y - growSpeed;
         fill(button1Color-(x*.4),0,0);    // Color 1B
         rect(button1X, button1Y+y, buttonWidth, buttonHeight+x);
        
       }
       else {
         if(x >= 0){
         // If you un click mouse while in rectangle, new rectangle shrinks
         //fill(255,0,0);  // Color 1B
         x = x - growSpeed;
         y = y + growSpeed;
         fill(button1Color-(x*.4),0,0);    // Color 1B
         rect(button1X, button1Y+y, buttonWidth, buttonHeight+x);
         }
       }
    // Button Hover Color
    //fill(255,0,0);}    //Color 1B
    fill(button1Color-(x*.4),0,0);   } // Color 1B
    else {
         if(x >= 0){
         // new rectangle will still shrink if you are no longer on button
         x = x - shrinkSpeed;  // Shrinks a bit quicker
         y = y + shrinkSpeed;  // Shrinks a bit quicker
         rect(button1X, button1Y+y, buttonWidth, buttonHeight+x);
         }
  }
  
  rect(button1X, button1Y, buttonWidth, buttonHeight);
  
  
  // Button 2
  fill(0, button2Color, 0);  // Color 2A
  if(mouseX >= button2X && mouseX <= button2X + buttonWidth &&
     mouseY >= button2Y && mouseY <= button2Y + buttonHeight){
       // If you are on Button 2 then
       if(mousePressed && a <= button2H){  // Height of new rectangle
         // If you click mouse while in the rect, new rectangle grows
         //fill(0,255,0);  // Color 2B
         a = a + growSpeed;
         b = b - growSpeed;
         fill(0, button2Color-(a*.3),0);  // Color 2B
         rect(button2X, button2Y+b, buttonWidth, buttonHeight+a);
        
       }
       else {
         if(a >= 0){
         // If you un click mouse while in rectangle, new rectangle shrinks
         //fill(0,255,0);  // Color 2B
         a = a - growSpeed;
         b = b + growSpeed;
         fill(0, button2Color-(a*.3),0);  // Color 2B
         rect(button2X, button2Y+b, buttonWidth, buttonHeight+a);
         }
       }
    // Button Hover Color
    //fill(0,255,0);}    //Color 2B
    fill(0, button2Color-(a*.3),0);   } // Color 2B
    else {
         if(a >= 0){
         // new rectangle will still shrink if you are no longer on button
         a = a - shrinkSpeed;  // Shrinks a bit quicker
         b = b + shrinkSpeed;  // Shrinks a bit quicker
         rect(button2X, button2Y+b, buttonWidth, buttonHeight+a);
         }
  }
  
  rect(button2X, button2Y, buttonWidth, buttonHeight);
  
  
  // Button 3
  fill(0, 0, button3Color);  // Color 3A
  if(mouseX >= button3X && mouseX <= button3X + buttonWidth &&
     mouseY >= button3Y && mouseY <= button3Y + buttonHeight){
       // If you are on Button 3 then
       if(mousePressed && c <= button3H){  // Height of new rectangle
         // If you click mouse while in the rect, new rectangle grows
         //fill(0,0,255);  // Color 3B
         c = c + growSpeed;
         d = d - growSpeed;
         fill(0, 0, button3Color-(c*.25));  // Color 3B
         rect(button3X, button3Y+d, buttonWidth, buttonHeight+c);
        
       }
       else {
         if(c >= 0){
         // If you un click mouse while in rectangle, new rectangle shrinks
        // fill(0,0,255);  // Color 3B
         c = c - growSpeed;
         d = d + growSpeed;
         fill(0, 0, button3Color-(c*.25));  // Color 3B
         rect(button3X, button3Y+d, buttonWidth, buttonHeight+c);
         }
       }
    // Button Hover Color
    //fill(0,0,255);}    //Color 3B
    fill(0, 0, button3Color-(c*.25)); } // Color 3B
    else {
         if(c >= 0){
         // new rectangle will still shrink if you are no longer on button
         c = c - shrinkSpeed;  // Shrinks a bit quicker
         d = d + shrinkSpeed;  // Shrinks a bit quicker
         rect(button3X, button3Y+d, buttonWidth, buttonHeight+c);
         }
  }
  
  rect(button3X, button3Y, buttonWidth, buttonHeight);
  
  // Button 4
  fill(0, button4Color, button4Color);  // Color 4A
  if(mouseX >= button4X && mouseX <= button4X + buttonWidth &&
     mouseY >= button4Y && mouseY <= button4Y + buttonHeight){
       // If you are on Button 4 then
       if(mousePressed && e <= button4H){  // Height of new rectangle
         // If you click mouse while in the rect, new rectangle grows
         
         e = e + growSpeed;
         f = f - growSpeed;
         fill(0, button4Color-(e*.125), button4Color-(e*.125));  // Color 4B
         rect(button4X, button4Y+f, buttonWidth, buttonHeight+e);
        
       }
       else {
         if(e >= 0){
         // If you un click mouse while in rectangle, new rectangle shrinks
         //fill(0,255,255);  // Color 4B
         e = e - growSpeed;
         f = f + growSpeed;
         fill(0, button4Color-(e*.125), button4Color-(e*.125));  // Color 4B
         rect(button4X, button4Y+f, buttonWidth, buttonHeight+e);
         }
       }
    // Button Hover Color
    //fill(0,255,255);}    //Color 4B
    fill(0, button4Color-(e*.125), button4Color-(e*.125)); } // Color 4B
    else {
         if(e >= 0){
         // new rectangle will still shrink if you are no longer on button
         e = e - shrinkSpeed;  // Shrinks a bit quicker
         f = f + shrinkSpeed;  // Shrinks a bit quicker
         rect(button4X, button4Y+f, buttonWidth, buttonHeight+e);
         }
  }
  
  rect(button4X, button4Y, buttonWidth, buttonHeight);
  
  //Button 5
  //rect(button5X, button5Y, buttonWidth, buttonHeight);
}

