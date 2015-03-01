
 
  ///////////////////////////////////////////////////////////////////////////////////////
  //Basic instructions:
 ////////////////////////////////////////////////////////////////////////////////////////
  //To reset custom color: click the lone unlabeled button under the opacity
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
  //To use the color picker: tap c
  //To make it more solid: tap o
  //To make it more see-through: tap p
  //////////////////////////////////////////////////////////////////////////////////////////
  
//Old mouse positions
  float oldX;
  float oldY;

//Color changers
  int r = 0; //Red value
  int g = 0; //Blue value
  int b = 0; //Green value
  int opac = 255; //Opacity
  int d = 0; // Black and white colors

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
  color custom = color(0+r,0+g,0+b,0+opac);
  color choosenColor = color(0);
  color redDisplay = color(0+r,0,0);
  color greenDisplay = color(0,0+g,0);
  color blueDisplay = color(0,0,0+b);
  color darkDisplay = color(d);
  color opacDisplay = color(0,0,0,0+opac);
 
//Image Saving
  PImage Final = loadImage("Final.png");
  PImage MyImage = loadImage("Test.png");
  boolean save = false;
 
  int choosenThickness = 2; //Used for gui
  int pixelCount; //Used to represent the amount of pixels in the window



void setup()
{
  background(255);
  size(800,800);
  smooth();
  pixelCount = calcTotalPixels(pixelCount);
  println("Pixels in window: ");
  println(pixelCount);
}


void draw()
{
  stroke(0);
  erase();
  gui();
  color custom = color(0+r,0+g,0+b,255+opac);
  stroke(choosenColor);
  strokeWeight(choosenThickness);
  //Start of borrowed code (This draws the lines)
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
  saving(save);
  save = false; //Prevents an endless loop
}

//Calculates the number of pixels and passes the answer to setup
int calcTotalPixels(int pixelnum) 
{
  pixelnum = width*height;
  return pixelnum;
}

void gui()  //The gui on the left of the screen
{
  //Main Shape of gui
  fill(gray);
  strokeWeight(2);
  rect(0,0,150,800);
 
  //Current box at the top
  rect(0,0,150,150);
  fill(choosenColor);
  ellipse(50,50,80,80);
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
 
  //Simple Colors selection (grid set up to line up the basic colors)
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
  fill(white);
  for (int i = 0; i < 125; i = i+25)
  {
  rect(0,312.5+i,127.5,15);
  }
  fill(black);
  text("Light",37.5,325);
  text("Redness",37.5,350);
  text("Blueness",37.5,375);
  text("Greenness",37.5,400);
  text("Opacity",37.5,425);
 
  //Moving rectangle that goes with the mouse for each slider:
  if (((mouseX > 0) && (mouseX < 127.5)) && ((mouseY > 312.5) && (mouseY < 327.5)))
  {
    darkDisplay = color(d);
    fill(darkDisplay);
    rect(0,312.5,mouseX,15);
  }
  if (((mouseX > 0) && (mouseX < 127.5)) && ((mouseY > 337.5) && (mouseY < 352.5)))
  {
    redDisplay = color(0+r,0,0);
    fill(redDisplay);
    rect(0,337.5,mouseX,15);
  }
  if (((mouseX > 0) && (mouseX < 127.5)) && ((mouseY > 362.5) && (mouseY < 377.5)))
  {
    blueDisplay = color(0,0,0+b);
    fill(blueDisplay);
    rect(0,362.5,mouseX,15);
  }
  if (((mouseX > 0) && (mouseX < 127.5)) && ((mouseY > 387.5) && (mouseY < 402.5)))
  {
    greenDisplay = color(0,0+g,0);
    fill(greenDisplay);
    rect(0,387.5,mouseX,15);
  }
  if (((mouseX > 0) && (mouseX < 127.5)) && ((mouseY > 412.5) && (mouseY < 427.5)))
  {
    opacDisplay = color(0,0,0,0+opac);
    fill(opacDisplay);
    rect(0,412.5,mouseX,15);
  }
  //Button that resets the custom color to black
  fill(black);
  rect(112.5,437.5,15,15);
 
  //Line thickness choices
  strokeWeight(1);
  line(37.5,462.5,87.5,462.5);
  strokeWeight(2);
  line(37.5,487.5,87.5,487.5);
  strokeWeight(3);
  line(37.5,512.5,87.5,512.5);
  strokeWeight(4);
  line(37.5,537.5,87.5,537.5);
 
 //Line thickness slider
  strokeWeight(2);
  fill(white);
  rect(0,547.5,150,40);
  fill(black);
  text("Thickness",37.5,570);
  //Moving bar
  if (((mouseX > 0) && (mouseX < 150)) && ((mouseY > 547.5) && (mouseY < 587.5)))
  {
    fill(black);
    rect(0,547.5,mouseX,40);
  }
 
  //Custom color value displays
  text("Red:", 12.7, 620);
  text(r, 80, 620);
  text("Blue:", 12.7, 640);
  text(b, 80, 640);
  text("Green:", 12.7, 660);
  text(g, 80, 660);
  text("Opacity:", 12.7, 680);
  text(opac, 80, 680);
  text("Line size:", 12.7, 700);
  text(choosenThickness, 80, 700);
  text("Light:", 12.7, 720);
  text(d, 80, 720);

 
 
  //Eraser
  fill(white);
  rect(120,610,15,15);
 
  //Save button
  fill(teal);
  rect(0,750,100,50);
  fill(black);
  textSize(17.5);
  text("Save",30,780);
  textSize(12.5);
}


//Takes an image of the entire window and crops out the gui bar, to place in a new image.
void saving(boolean save)
{
  if (save == true)
  {
    //Start of borrowed code
    save("Test.png");
    PImage img = loadImage("Test.png");
    PImage myImage = img.get(152,0,648,800); //Get a portion of the loaded image with displaying it
    myImage.save("Final.png"); //Save the portion of the image without displaying it
    //End of borrowed code
  }
}
 


void erase() //Gets rid of all work on canvas
{
  if (keyPressed)
  {
    if (key == 'z')
    {
    background(white);
    }
  }
}
 
 
void keyReleased()
{
 /////Keyboard commands
 
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
  ////Makes it lighter as it increases
   if (key == 'd')
  {
    if ((r>3) && (g>3) && (b>3))
    {
      r = r - 4;
      g = g - 4;
      b = b - 4;
      color custom = color(0+r,0+g,0+b,0+opac);
      choosenColor = custom;
    }
  }
  //Makes it more red as it increases
  if (key == 'r')
  {
    r = r + 4;
    color custom = color(0+r,0+g,0+b,0+opac);
    choosenColor = custom;
  }
  //Makes it more blue as it increases
  if (key == 'b')
  {
    b = b + 4;
    color custom = color(0+r,0+g,0+b,0+opac);
    choosenColor = custom;
  }
  //Makes it more green as it increases
  if (key == 'g')
  {
    g = g + 4;
    color custom = color(0+r,0+g,0+b,0+opac);
    choosenColor = custom;
  }
  //Makes it more transparent as it decreases
  if (key == 'p')
  {
    if (opac>3)
    {
      opac = opac - 4;
      color custom = color(0+r,0+g,0+b,0+opac);
      choosenColor = custom;
    }
  }
    
    
  //Makes it darker as it decreases
  if (key == 'f')
  {
    r = r + 4;
    g = g + 4;
    b = b + 4;
    color custom = color(0+r,0+g,0+b,0+opac);
    choosenColor = custom;
  }
  //Makes it less red as it decreases
  if (key == 't')
  {
    if (r>3)
    {
      r = r - 4;
      color custom = color(0+r,0+g,0+b,0+opac);
      choosenColor = custom;
    }
  }
  //Makes it less blue as it decreases
  if (key == 'n')
  {
    if (b>3)
    {
      b = b - 4;
      color custom = color(0+r,0+g,0+b,0+opac);
      choosenColor = custom;
    }
  }
  //Makes it less green as it decreases
  if (key == 'h')
  {
    if (g>3)
    {
      g = g - 4;
      color custom = color(0+r,0+g,0+b,0+opac);
      choosenColor = custom;
    }
  }
  //Makes it more solid looking as it increases
  if (key == 'o')
  {
    if (opac<252)
    {
      opac = opac + 4;
      color custom = color(0+r,0+g,0+b,0+opac);
      choosenColor = custom;
    }
  }  
  //Color picker
  if (key == 'c')
  {
    custom = get(mouseX,mouseY);
    choosenColor = custom;
    opac = 0;
  }
    

}

void basicColorSelection()
{  
  ////////////////////  COLORS   ///////////////////////////////////////
  if (((mouseX > 0) && (mouseX < 37.5)) && ((mouseY > 150) && (mouseY < 200)))
  {
    choosenColor = black;
    d = 0;
    r = 0;
    g = 0;
    b = 0;
    opac = 255;
  }
  if (((mouseX > 37.5) && (mouseX < 75)) && ((mouseY > 150) && (mouseY < 200)))
  {
    choosenColor = gray;
    d = 200;
    r = 0;
    g = 0;
    b = 0;
    opac = 255;
  }
  if (((mouseX > 75) && (mouseX < 112.5)) && ((mouseY > 150) && (mouseY < 200)))
  {
    choosenColor = white;
    d = 255;
    r = 0;
    g = 0;
    b = 0;
    opac = 255;
  }
  if (((mouseX > 112.5) && (mouseX < 150)) && ((mouseY > 150) && (mouseY < 200)))
  {
    choosenColor = brown;
    r = 100;
    g = 50;
    b = 0;
    d = 0;
    opac = 255;
  }
    
  /////////Next Row//////////
    
  if (((mouseX > 0) && (mouseX < 37.5)) && ((mouseY > 200) && (mouseY < 250)))
  {
    choosenColor = red;
    r = 255;
    g = 0;
    b = 0;
    d = 0;
    opac = 255;
  }
  if (((mouseX > 37.5) && (mouseX < 75)) && ((mouseY > 200) && (mouseY < 250)))
  {
    choosenColor = green;
    g = 255;
    r = 0;
    d = 0;
    opac = 255;
  }
  if (((mouseX > 75) && (mouseX < 112.5)) && ((mouseY > 200) && (mouseY < 250)))
  {
    choosenColor = blue;
    b = 255;
    r = 0;
    g = 0;
    d = 0;
    opac = 255;
  }
  if (((mouseX > 112.5) && (mouseX < 150)) && ((mouseY > 200) && (mouseY < 250)))
  {
    choosenColor = yellow;
    r = 255;
    b = 255;
    g = 0;
    d = 0;
    opac = 255;
  }
    
  /////////Next Row////////////
    
  if (((mouseX > 0) && (mouseX < 37.5)) && ((mouseY > 250) && (mouseY < 300)))
  {
    choosenColor = teal;
    g = 255;
    b = 255;
    r = 0;
    d = 0;
    opac = 255;
  }
  if (((mouseX > 37.5) && (mouseX < 75)) && ((mouseY > 250) && (mouseY < 300)))
  {
    choosenColor = pink;
    r = 255;
    b = 255;
    g = 0;
    d = 0;
    opac = 255;
  }
  if (((mouseX > 75) && (mouseX < 112.5)) && ((mouseY > 250) && (mouseY < 300)))
  {
    choosenColor = orange;
    r = 255;
    g = 200;
    b = 0;
    d = 0;
    opac = 255;
  }
  if (((mouseX > 112.5) && (mouseX < 150)) && ((mouseY > 250) && (mouseY < 300)))
  {
    choosenColor = purple;
    r = 100;
    b = 100;
    g = 0;
    d = 0;
    opac = 255;
  }
    
  //Custom color Selection reset
  if (((mouseX > 112.5) && (mouseX < 127.5)) && ((mouseY > 437.5) && (mouseY < 452.5)))
  {
    r = 0;
    g = 0;
    b = 0;
    opac = 255;
    d = 0;
    color custom = color(0+r,0+g,0+b,0+opac);
    choosenColor = custom;
  }    
}

void basicLineSelection()
{
  ///////////////////// LINE THICKNESS SELECTION /////////////////////////////
    
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
}


 
void mouseClicked()
{
  color custom = color(0+r,0+g,0+b,0+opac);
  basicColorSelection();
  basicLineSelection();
  save = false;

  /////////////////////////////////////////////////////  Sliders  //////////////////////////////////////////////////////////////
  
  //Thickness slider
  if (((mouseX > 0) && (mouseX < 150)) && ((mouseY > 547.5) && (mouseY < 587.5)))
  {
    choosenThickness = mouseX*2;
  }
  
  //Black and white color slider
  if (((mouseX > 0) && (mouseX < 150)) && ((mouseY > 312.5) && (mouseY < 327.5)))   
  {
    d = (mouseX *2);
    if (d<0)
    {
      d = 0;
    }
    if (d> 255)
    {
      d = 255;
    }
    custom = d;
    choosenColor = custom;
  }
  
  //Red color slider
  if (((mouseX > 0) && (mouseX < 127.5)) && ((mouseY > 337.5) && (mouseY < 352.5)))
  {
    r = (mouseX*2);
    choosenColor = custom;
  }
  
  //Blue color slider
  if (((mouseX > 0) && (mouseX < 127.5)) && ((mouseY > 362.5) && (mouseY < 377.5)))
  {
    b = (mouseX*2);
    choosenColor = custom;
  }
  
  //Green color slider
  if (((mouseX > 0) && (mouseX < 127.5)) && ((mouseY > 387.5) && (mouseY < 402.5)))
  {
    g = (mouseX*2);
    choosenColor = custom;
  }
  
  //Opacity slider
  if (((mouseX > 0) && (mouseX < 127.5)) && ((mouseY > 412.5) && (mouseY < 427.5)))
  {
    opac = (mouseX*2);
    choosenColor = custom;
  }
  
  //Eraser button (Clears canvas completely)
  if (((mouseX > 120) && (mouseX < 135)) && ((mouseY > 610) && (mouseY < 625)))
  {
    background(white);
  }
  
  //Save button
  if (((mouseX > 0) && (mouseX < 100)) && ((mouseY > 750) && (mouseY < 800)))
  {
    save = true;
  }
}



                                   



