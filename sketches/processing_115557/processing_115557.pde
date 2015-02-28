
/* @ jps preload ="bullethole.png"; */
float c = 0;
float R = 0;
float G = 0;
float B = 0;
float brush = 1; 
float bRadius1 = 3;
float bRadius2 = 20;
float bRadius3 = 3;
float bRadius4 = 5;
float bSize = 5;
float prevX;
float prevY;
float i;
boolean paint = false;
int selectedBox = 0;
color selectedColor = color(255, 0 ,0);
color deselectedColor = color(100);
String userInputR ="";
String userInputG ="";
String userInputB ="";
int inputNumber = 0;
String currentKey ="";
PImage b = loadImage("bullethole.png");

void setup()
{
  size(500,500);
  background(255);
  frameRate(300);
  

}

void draw()
{
   fill(0);

   
  if (paint == false) // Responsible for displaying initial directions
  {
    directions();
  }
   
  if (paint == true && c == 0) // Responsible for changing brushes and determining brush effects
  {
    if (mousePressed == true)
    {
      if (mouseButton == LEFT)
      {
        if (brush == 1) // Creates Brush 1 specs
        {
          stroke(R,G,B);
          strokeWeight(bRadius1);
          line(mouseX,mouseY,prevX,prevY);
          prevX = mouseX;
          prevY = mouseY;
        }
        if (brush == 2) // Creates Brush 2 specs
        {      
          fill(R + random(75),G + random(75),B + random(75));
          stroke(0);
          strokeWeight(1);
          ellipse(mouseX + random(-(bRadius2),bRadius2),mouseY + random(-(bRadius2),bRadius2),random(1,bSize),random(1,bSize));        
        }
        if (brush == 3) // Creates Brush 3 specs
        {
          pushMatrix();
          scale(random(bRadius3));
          image(b,random(width),random(height));
          popMatrix();
        }
        if (brush == 4) // Creates Eraser Brush specs
        {
          fill(255);
          noStroke();
          ellipse(mouseX,mouseY,bRadius4,bRadius4);
        }
      }
    }
    if (mousePressed == false)
    {
    prevX = mouseX;
    prevY = mouseY;
    }
  }
 
  if (c == 1)
  {
    colorSelector();
    
    if (selectedBox == 0)
    {
      stroke(selectedColor);  
      fill(255);
      rect(width/2 + 45,height/2 - 50,100,25);    
      fill(0);
      text(userInputR, width/2, height/2 -42);           
    }
    else
    {
       stroke(deselectedColor);
       fill(255);
       rect(width/2 + 45,height/2 - 50,100,25); 
       fill(0);
       text(userInputR, width/2, height/2 -42);
    }    
    
    if (selectedBox == 1)
    {
       stroke(selectedColor);
       fill(255);
       rect(width/2 + 45,height/2 - 0,100,25);
       fill(0);
       text(userInputG, width/2, height/2 + 8);
    }
    else
    {
       stroke(deselectedColor);
       fill(255);
       rect(width/2 + 45,height/2 - 0,100,25);
       fill(0);
       text(userInputG, width/2, height/2 + 8);
    }
       
    if (selectedBox == 2)
    {
       stroke(selectedColor);
       fill(255);
       rect(width/2 + 45, height/2 + 50,100,25);
       fill(0);
       text(userInputB, width/2, height/2 + 58);       
    }
    else
    {
       stroke(deselectedColor);
       fill(255);
       rect(width/2 + 45, height/2 + 50,100,25);
       fill(0);
       text(userInputB, width/2, height/2 + 58); 
    }  
  }
}


void keyReleased()
{
  if (key == 'c') // changes the variable that controls whether the color selection box is displayed
  {
    if (c == 0)
    {
      c = 1;
    }
    else if (c == 1)
    {
      background(255);
      c = 0;
    }
  }
  
  if (key == 'p' || key == 'P') // controls whether the directions are shown or not
  {    
      background(255);
      paint = true;         
  }
  if (paint == true && c == 0)
  {
    if (key == '1')
    {
      brush = 1;
    }
    if (key == '2')
    {
      brush = 2;
    }
    if (key == '3')
    {
      brush = 3;
    }
    if (key == '4')
    {
      brush = 4;
    }
    if (key == CODED) // Increases and decreases variables that determine brush sizes
    {
      if (keyCode == UP)
       {
         if (brush == 1)
         {
           bRadius1 += 1;
           println("Brush Size: " + bRadius1);
         }
         if (brush == 2)
          {
            bRadius2 += 1;
            println("Brush Size: " + bRadius2);
          }
          if (brush == 3)
          {
            bRadius3 += .5;
            println("Brush Size: " + bRadius3);
          }
          if (brush == 4)
          {
            bRadius4 += 1;
            println("Brush Size: " + bRadius4);
          }
       }
      if (keyCode == DOWN)
      {
        if (brush == 1 && bRadius1 > 1)
        {
          bRadius1 -= 1;
          println("Brush Size: " + bRadius1);
        }
        if (brush == 2 && bRadius2 > 1)
        {     
          bRadius2 -= 1;
          println("Brush Size: " + bRadius2);          
        }
        if (brush == 3 && bRadius3 > 1)
        {
          bRadius3 -= .5;
          println("Brush Size: " + bRadius3);          
        }
        if (brush == 4 && bRadius4 > 1)
        {
          bRadius4 -= 1;
          println("Brush Size: " + bRadius4);
        }
      }
      if (keyCode == LEFT)
      {
        if (brush == 2 && bSize > 1)
        {
         bSize -= 1;
         println("Circle Size: 1-" + bSize);
        }
      }
      if (keyCode == RIGHT)
      {
        if (brush == 2)
        {
         bSize += 1;
         println("Circle Size: 1-" + bSize);
        }
      }
    }
  }
  
  if (key != CODED && c == 1)   
   {
     if (key >= '0' && key <= '9')
     {
       currentKey = key.toString();
       
       if (selectedBox == 0 && userInputR + currentKey <= 255)
       {
        userInputR += key.toString();     
        R = parseInt(userInputR); 
       }
       if (selectedBox == 1 && userInputG + currentKey <= 255)
       {
        userInputG += key.toString(); 
        G = parseInt(userInputG);
       }
       if (selectedBox == 2 && userInputB + currentKey <= 255)
       {
        userInputB += key.toString();
        B = parseInt(userInputB);
       }   
     }     
   }
}

void mousePressed() // changes input box stroke to indicate selected box
{
  if (c == 1)
  {
    if (mouseX  > (width/2 + 45) - 50 
      && mouseX < (width/2 + 45) + 50 
      && mouseY > (height/2 - 50) - 12.5 
      && mouseY < (height/2 - 50) + 12.5)
    {
      selectedBox = 0;
      userInputR = "";
    }
    if (mouseX > (width/2 + 45) - 50
      && mouseX < (width/2 + 45) + 50
      && mouseY > (height/2 - 0) - 12.5
      && mouseY < (height/2 - 0) + 12.5)
     {
       selectedBox = 1;
       userInputG = "";
     }
    if (mouseX > (width/2 + 45) - 50
      && mouseX < (width/2 + 45) + 50
      && mouseY > (height/2 + 50) - 12.5
      && mouseY < (height/2 + 50) + 12.5)
      {
        selectedBox = 2;
        userInputB = "";
      }
  }
}

void directions() // displays initial directions until the user begins to paint.
{
     background(255);
     textSize(25);
     text("Directions:",10,50);
     textSize(15);
     text("To cycle through brushes 1,2, and 3, press the corresponding key",10,75);
     text("To bring up the color selector press c",10,100);
     text("To increase your brush size press the UP arrow key",10,125);
     text("To decrease your brush size press the DOWN arrow key",10,150);
     text("To switch to the erase brush press 4 key",10,175);
     text("Brush 1: Standard Paintbrush",10,200);
     text("Brush 2: Graffiti Paintbrush",10,225);
     text("Brush 3: Open Fire!",10,250);
     
     text("Warning! Changing colors while painting will clear the canvas!",10,280);
     
     textSize(25);
     text("Press p to begin painting!",10,325);
}

void colorSelector() // generate color selection window
{
    rectMode(CENTER);
    fill(0);
    strokeWeight(3);
    stroke(100);
    rect(width/2,height/2,200,150); 
    textSize(20);
    fill(255,0,0);
    text("RED",width/2 - 85,height/2 - 45);
    fill(0,255,0);
    text("GREEN",width/2 -85, height/2 + 7);
    fill(0,0,255);
    text("BLUE",width/2 -85,height/2 + 57);
    fill(255);
    strokeWeight(3);
}



