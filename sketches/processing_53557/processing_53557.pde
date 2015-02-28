


// Homework #8 :: 51-257 Sec A :: Michael Loffredo :: mlloffre 
// copyright michael loffredo 2012

//////////////////////////////////////INSTRUCTIONS//////////////////////////////////////////////

// 1) Press any key except for the space bar to start creating spiderweb-like designs over the image
// 2) Press the space bar to clear what you've made and to start the loop over again 
// 3) Click the mouse to stop the loop
// 4) Release the mouse to continue the loop 

///////////////////////////////////////////////////////////////////////////////////////////////

void setup ()
{ 
  size (400,400); 
  smooth ();
  background (0);
  rectMode (CENTER);
}


void draw ()
{ 
  whileRadial (); 
}



void whileRadial ()
{
  float c = random (0, 50);
  float x = 0;
  float z = random (height);
  
  while (x < width*1.5)
  {
     stroke (250, 28, 158, c);
     line (0, height, pmouseX, pmouseY);
     line (width, height, pmouseX, pmouseY); 
     line (width, 0, pmouseX, pmouseY);
     line (0, 0, pmouseX, pmouseY); 
     stroke (173, 224, 23, c);  
     noFill();
     line (width/2, height/2, x, z);
     x += 10; 
  } 
} 



// User interaction with mouse (stopping the loop and continuing the loop)

void mousePressed ()
{
  noLoop (); //code from class 
}

void mouseReleased ()
{
  loop();
}



// User interaction with keyboard (adding another loop and clearing the screen)

void keyPressed ( ) 
  { 
    if (keyPressed == true)
    {
    float c = random (0, 70);
    float x = 0;
    float z = random (height);
    while (x < width)
    {
     stroke (255, 255, 255, c);
     line (width/2, height/2, x, z);
     stroke (29, 222, 168, c);
     line (0, 0, x, z);
     line (width, 0, x, z);
     line (0, height, x, z);
     line (width, height, x, z);
     x += 10; 
     }
    }
    
    if (key == ' ') 
    {
      fill (0);
      rect (width/2, height/2, width, height);
    }
    
  } 
  
  // END

  

