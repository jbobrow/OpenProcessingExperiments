
/*I wanted to play around with colours again, this time using the position
on screen to determine the Hue and Saturation. But this would just produce the same sort 
of colours after awhile of playing around so to switch it up, I added a colour change
where Brightness was determined by mouseX and the Hue was random. I used lines
coming from the center to really highlight the spectrum and because they are best
to create a litte or colour in a lot of the canvas. */

/*
||||||||||||||||||||CONTROLS||||||||||||||||||||||||||||

- Click mouse to draw a single line from the center to the mouse position
- Hold and drag mouse to keep drawing lines
- s or S to save a screenshot
- ENTER to change how the colour is drawn
*/

//Global Variables
//center of the canvas where the lines get drawn from
float centerX;
float centerY;

int screenshotCount = 0; //so you can save multiple screenshots in one session

boolean switchUpColours = false;



void setup()
{
 size(1000, 700);
 colorMode(HSB, width, height, width); //the brightness is width so I can switch it up later
 
 centerX = width/2;
 centerY = height/2;
 
 background(width);
}


void draw()
{
  //if the mouse is being pressed draw my pretty pretty lines
  if(mousePressed)
  {
    if(switchUpColours) //just to check what colour we're going with
    {
      stroke(mouseX, mouseY, random(width));
    } else
    {
      stroke(random(width), mouseY, mouseX);
    }
    
    line(centerX, centerY, mouseX, mouseY);
   
  }
  
  
}

void keyReleased()
{
 if(key == DELETE || key == BACKSPACE) background(width);
 if(key == 's' || key == 'S')
  {
    saveFrame("screenshot_" + screenshotCount + ".png"); 
    screenshotCount ++;
  }
 
 //when enter is hit, the colour switch boolean swaps to false if true
 //and vice versa
 if(key == ENTER && !switchUpColours)
  { switchUpColours = true;
  println(switchUpColours);
}
 else if(key == ENTER && switchUpColours) 
 {
 switchUpColours = false;
 println(switchUpColours);
 }
}
