
// Code Written By: Chukwudi T. Unonu
// Date Created:  02/28/2012
// Date Finished: 02/28/2012
//
// ARTT489i - Advanced Digital Imaging
// Instructor: Prof. Brandon Morse
// University of Maryland, College Park, MD
//
// Made With: INSPIRON 1521 (Motherboard), INSPIRON 1520 (Screen) 
// 
// SKETCH 2 of 24: "Bounce"
//
// DESCRIPTION: Bouncey Triangles & Squares with random patterns
// Unfortunately "effortless", but an attempt nonetheless to see
// what tweaking certain lines & parameters in the "Processing" 
// text would do. 
// Sketch Items: (Book Example, ppg. 93, ???, 314)
//
////  ----====    START "Sketch"   ====----
//

void setup()
{
  // Screen Resolutions References via Wikiedia
  // (a) <http://en.wikipedia.org/wiki/720p>  
    size(500,500);
  
}

void draw() 
{
//ppg. ???


//fill(0, 12);
//rect(0, 0, width, height);
//fill(255);
//translate(0, y); // Set the y-coordinate of the circle
//ellipse(33, 0, radius, radius);
//y += speed;
//if (y > height+radius) 
// {
//  y = -radius;
//  }

//ppg. 93
noStroke();
for (int y = 0; y < 500; y += 10) //"500"  is the canvas size 4 both x and y
{
 for (int x = 0; x < 500; x += 10) 
 {
  fill((x+y) * 0.456789,500); //tweaking 0.5 to a higher number makes the gradient smalle/shorter
  rect(x, y, 10, 10);
  }
}

//ppg. 314
noFill();
stroke(0,255,0,55);
smooth();
for (int y = -10; y <= 500; y += 10)
 {
  for (int x = -10; x <= 500; x += 10) 
  {
   ellipse(x + y/10, y + x/10, 5 + x/5, 5);
  }
 }
 
}

