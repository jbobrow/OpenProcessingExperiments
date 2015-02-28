
float oldX;
float oldY;

//Saving variables?
//      save("Test.png");
////      PImage myImage = img.get(500,500,250,250); //Get a portion of the loaded image with displaying it
////      myImage.save("ghgh.png"); //Save the portion of the image without displaying it

//Color changers
  int r = 0;
  int g = 0;
  int b = 0;
  int opac = 0;

//Colors
  color black = (0);
  color gray = (200);
  color white = (255);
  color red = color(255,0,0);
  color green = color(0,255,0);
  color blue = color(0,0,255);
  color yellow = color(255,255,0);
  color teal = color(0,255,255);
  color pink = color(255,0,255);
  color orange = color(255,200,0);
  color purple = color(100,0,100);
  color brown = color(100,50,0);
  color custom = color(0+r,0+g,0+b,255+opac);
  color choosenColor = color(0);
  
  
  int choosenThickness = 2;
  
  //Basic instructions:
 
  //To activate custom color: click the lone unlabeled button under the opacity
  //To increase redness: tap r
  //To decrease redness: tap t
  //To increase blueness: tap b
  //To decrease blueness: tap n
  //To increase greenness: tap g
  //To decrease greenness: tap h
  //To make darker: tap d
  //To make lighter: tap f
  //To increase line thickness: press e
  //To decrease ling thickness: press q
  //To erase: tap z
  
  
void setup()
{
  background(255);
  size(800,800);
  smooth();
}



void draw()
{
  stroke(0);
  erase();
  gui();
  color custom = color(0+r,0+g,0+b,255+opac);
  stroke(choosenColor);
  strokeWeight(choosenThickness);
  //Start of borrowed code
   if (mousePressed)
   {
     if (mouseX > 150)
       {
         line(mouseX, mouseY, oldX, oldY);
       }
   }
  oldX = mouseX;
  oldY = mouseY;
  //End of borrowed code
  strokeWeight(choosenThickness);
}



void gui()
{
  //Main Tool body
  fill(gray);
  strokeWeight(2);
  rect(0,0,150,800);
  
  //Current box
  rect(0,0,150,150);
  fill(choosenColor);
  ellipse(50,50,80,80);
  fill(custom);
  ellipse(120,50,40,40);
  fill(black);
  text("Current Settings",25,140);
  if (choosenThickness > 55)
    {
      strokeWeight(55);
    }
  else
    {  
      strokeWeight(choosenThickness);
    }
  line(50,120,120,120);
  
  //Simple Color selection
  fill(gray);
  strokeWeight(2);
  rect(0,150,150,150);
  rect(0,150,112.5,150);
  rect(0,150,75,150);
  rect(0,150,37.5,150);
  line(0,200,150,200);
  line(0,250,150,250);
  
  //Basic Color Selection (Colored Squares)
  fill(black);
  rect(0,150,37.5,50);
  fill(gray);
  rect(37.5,150,37.5,50);
  fill(white);
  rect(75,150,37.5,50);
  fill(brown);
  rect(112.5,150,37.5,50);
  fill(red);
  rect(0,200,37.5,50);
  fill(green);
  rect(37.5,200,37.5,50);
  fill(blue);
  rect(75,200,37.5,50);
  fill(yellow);
  rect(112.5,200,37.5,50);
  fill(teal);
  rect(0,250,37.5,50);
  fill(pink);
  rect(37.5,250,37.5,50);
  fill(orange);
  rect(75,250,37.5,50);
  fill(purple);
  rect(112.5,250,37.5,50);
  
  //Sliders
  fill(black);
  text("Darkness",37.5,325);
  text("Redness",37.5,350);
  text("Blueness",37.5,375);
  text("Greenness",37.5,400);
  text("Opacity",37.5,425);
  
  fill(white);
  for (int i = 0; i < 125; i = i+25)
  {
    rect(12.5,312.5+i,15,15);
  }
  
  fill(black);
  rect(112.5,312.5,15,15);
  fill(red);
  rect(112.5,337.5,15,15);
  fill(blue);
  rect(112.5,362.5,15,15);
  fill(green);
  rect(112.5,387.5,15,15);
  fill(black);
  rect(112.5,412.5,15,15);
  fill(custom);
  rect(112.5,437.5,15,15);
  
  //Line thickness
  strokeWeight(1);
  line(37.5,462.5,87.5,462.5);
  strokeWeight(2);
  line(37.5,487.5,87.5,487.5);
  strokeWeight(3);
  line(37.5,512.5,87.5,512.5);
  strokeWeight(4);
  line(37.5,537.5,87.5,537.5);
  
//  fill(black);
  strokeWeight(2);
//  text("Thickness",37.5,570);
//  rect(112.5,557.5,15,15);
//  fill(white);
//  rect(12.5,557.5,15,15);
  
  //Shape Tools
  fill(gray);
  rect(0,580,150,220);
  fill(black);
  ellipse(20,605,20,20);
  rect(12.5,630,20,20);
  triangle(12,685,22,665,32,685);
  fill(white);
  rect(12.5,700,30,15);
  
  //Save button
  fill(teal);
  rect(0,750,100,50);
  fill(black);
  textSize(17.5);
  text("Save",30,780);
  textSize(12.5);
}




void erase() //Works
{
  if (keyPressed)
  {
    if (key == 'z')
    {
    background(white);
    }
  }
}
  
  
  
  
void keyReleased()  //Opacity doesn't work
{
  
  
  /////////Line Thickness selection using q and e
    if (key == 'q')
    {
      if (choosenThickness > 2)
      {
        choosenThickness = choosenThickness - 1;
      }
    }
    if (key == 'e')
    {
      choosenThickness = choosenThickness + 1;
    }
    
    
    
    /////////Color changing via keyboard
    ////Increasing
     if (key == 'd')
    {
      if ((r>3) && (g>3) && (b>3))
      {
        r = r - 4;
        g = g - 4;
        b = b - 4;
        color custom = color(0+r,0+g,0+b,255+opac);
        choosenColor = custom;
      }
    }
    if (key == 'r')
    {
      r = r + 4;
      color custom = color(0+r,0+g,0+b,255+opac);
      choosenColor = custom;
    }
    if (key == 'b')
    {
      b = b + 4;
      color custom = color(0+r,0+g,0+b,255+opac);
      choosenColor = custom;
    }
    if (key == 'g')
    {
      g = g + 4;
      color custom = color(0+r,0+g,0+b,255+opac);
      choosenColor = custom;
    }
    if (key == 'o')
    {
      if (opac>3)
      {
        opac = opac - 4;
        color custom = color(0+r,0+g,0+b,255+opac);
        choosenColor = custom;
      }
    }
    
    
    ////// Decreasing
    if (key == 'f')
    {
      r = r + 4;
      g = g + 4;
      b = b + 4;
      color custom = color(0+r,0+g,0+b,255+opac);
      choosenColor = custom;
    }
    if (key == 't')
    {
      if (r>3)
      {
        r = r - 4;
        color custom = color(0+r,0+g,0+b,255+opac);
        choosenColor = custom;
      }
    }
    if (key == 'n')
    {
      if (b>3)
      {
        b = b - 4;
        color custom = color(0+r,0+g,0+b,255+opac);
        choosenColor = custom;
      }
    }
    if (key == 'h')
    { 
      if (g>3)
      {
        g = g - 4;
        color custom = color(0+r,0+g,0+b,255+opac);
        choosenColor = custom;
      }
    }
    if (key == 'p')
    {
      if (opac<252)
      {
        opac = opac + 4;
        color custom = color(0+r,0+g,0+b,255+opac);
        choosenColor = custom;
      }
    }    
}

  
  
  
void mouseClicked()
{
  color custom = color(0+r,0+g,0+b,255+opac);
  ////////////////////  COLORS   ///////////////////////////////////////
    if (((mouseX > 0) && (mouseX < 37.5)) && ((mouseY > 150) && (mouseY < 200)))
    {
      choosenColor = black;
    }
    if (((mouseX > 37.5) && (mouseX < 75)) && ((mouseY > 150) && (mouseY < 200)))
    {
      choosenColor = gray;
    }
    if (((mouseX > 75) && (mouseX < 112.5)) && ((mouseY > 150) && (mouseY < 200)))
    {
      choosenColor = white;
    }
    if (((mouseX > 112.5) && (mouseX < 150)) && ((mouseY > 150) && (mouseY < 200)))
    {
      choosenColor = brown;
    }
    
    /////////Next Row//////////
    
    if (((mouseX > 0) && (mouseX < 37.5)) && ((mouseY > 200) && (mouseY < 250)))
    {
      choosenColor = red;
    }
    if (((mouseX > 37.5) && (mouseX < 75)) && ((mouseY > 200) && (mouseY < 250)))
    {
      choosenColor = green;
    }
    if (((mouseX > 75) && (mouseX < 112.5)) && ((mouseY > 200) && (mouseY < 250)))
    {
      choosenColor = blue;
    }
    if (((mouseX > 112.5) && (mouseX < 150)) && ((mouseY > 200) && (mouseY < 250)))
    {
      choosenColor = yellow;
    }
    
    /////////Next Row////////////
    
    if (((mouseX > 0) && (mouseX < 37.5)) && ((mouseY > 250) && (mouseY < 300)))
    {
      choosenColor = teal;
    }
    if (((mouseX > 37.5) && (mouseX < 75)) && ((mouseY > 250) && (mouseY < 300)))
    {
      choosenColor = pink;
    }
    if (((mouseX > 75) && (mouseX < 112.5)) && ((mouseY > 250) && (mouseY < 300)))
    {
      choosenColor = orange;
    }
    if (((mouseX > 112.5) && (mouseX < 150)) && ((mouseY > 250) && (mouseY < 300)))
    {
      choosenColor = purple;
    }
    
    //Custom color Selection
    if (((mouseX > 112.5) && (mouseX < 127.5)) && ((mouseY > 437.5) && (mouseY < 452.5)))
    {
      choosenColor = custom;
    }    
    
    
    
    ///////////////////// LINE THICKNESS SELECTION ///////////////////////////// 
    // (Not working)
    
    if (((mouseX > 37.5) && (mouseX < 462.5)) && ((mouseY > 458.5) && (mouseY < 463.5)))
    {
      choosenThickness = 1;   
    }
    if (((mouseX > 37.5) && (mouseX < 487.5)) && ((mouseY > 484.5) && (mouseY < 489.5)))
    {
      choosenThickness = 5;  
    }
    if (((mouseX > 37.5) && (mouseX < 512.5)) && ((mouseY > 510.5) && (mouseY < 515.5)))
    {
      choosenThickness = 10;  
    }
    if (((mouseX > 37.5) && (mouseX < 537.5)) && ((mouseY > 537.5) && (mouseY < 541.5)))
    {
      choosenThickness = 20;  
    }
    
    
    ///////////////////// SLIDER SELECTION   ///////////////////////////////////
    
    ////// Increasing slider
    
    if (((mouseX > 112.5) && (mouseX < 127.5)) && ((mouseY > 312.5) && (mouseY < 327.5)))
    {
      if ((r>3) && (g>3) && (b>3))
      {
        r = r - 4;
        g = g - 4;
        b = b - 4;
        choosenColor = custom;
      }
    }
    if (((mouseX > 112.5) && (mouseX < 127.5)) && ((mouseY > 337.5) && (mouseY < 352.5)))
    {
      r = r + 4;
      choosenColor = custom;
    }
    if (((mouseX > 112.5) && (mouseX < 127.5)) && ((mouseY > 362.5) && (mouseY < 377.5)))
    {
      b = b + 4;
      choosenColor = custom;
    }
    if (((mouseX > 112.5) && (mouseX < 127.5)) && ((mouseY > 387.5) && (mouseY < 402.5)))
    {
      g = g + 4;
      choosenColor = custom;
    }
    if (((mouseX > 112.5) && (mouseX < 127.5)) && ((mouseY > 412.5) && (mouseY < 427.5)))
    {
      if (opac>3)
      {
        opac = opac - 4;
        choosenColor = custom;
      }
    }
    
    
    ////// Decreasing Slider
    if (((mouseX > 12.5) && (mouseX < 27.5)) && ((mouseY > 312.5) && (mouseY < 327.5)))
    {
      r = r + 4;
      g = g + 4;
      b = b + 4;
      choosenColor = custom;
    }
    if (((mouseX > 12.5) && (mouseX < 27.5)) && ((mouseY > 337.5) && (mouseY < 352.5)))
    {
      if (r>3)
      {
        r = r - 4;
        choosenColor = custom;
      }
    }
    if (((mouseX > 12.5) && (mouseX < 27.5)) && ((mouseY > 362.5) && (mouseY < 377.5)))
    {
      if (b>3)
      {
        b = b - 4;
        choosenColor = custom;
      }
    }
    if (((mouseX > 12.5) && (mouseX < 27.5)) && ((mouseY > 387.5) && (mouseY < 402.5)))
    { 
      if (g>3)
      {
        g = g - 4;
        choosenColor = custom;
      }
    }
    if (((mouseX > 12.5) && (mouseX < 27.5)) && ((mouseY > 412.5) && (mouseY < 427.5)))
    {
      if (opac<252)
      {
        opac = opac + 4;
        choosenColor = custom;
      }
    }    
    
    
    //Save
    if (((mouseX > 0) && (mouseX < 100)) && ((mouseY > 750) && (mouseY < 800)))
    {
      save("Test.png");
//      PImage myImage = img.get(500,500,250,250); //Get a portion of the loaded image with displaying it
//      myImage.save("ghgh.png"); //Save the portion of the image without displaying it
     }
}



 




