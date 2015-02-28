
// Christian Murphy
// Copyright October 2013
// Clock Assignment

int s;
int m;
int h;
int lastSecond;
int x;
int y;

float angle;

// image
PImage img;
float offset = 0;
float easing = 0.05;


void setup()
{
  size(1000, 1000);
  background(125);
  
  
  // actual clock picture
  img = loadImage("clock.png");
 //int radius = min(width, height) / 2;
  

 
  
   fill(x);
   noStroke();
   rect(0, 0, 1000, 75);
   rect(0, 0, 75, 1000);
   rect(925, 0, 1000, 75);
   
   rect(925, 0, 1000, 1000);
   rect(0, 925, 1000, 75);
  smooth();
   
}

void draw()
{
 
   // The antique clock picture
  
  float dx = (mouseX-img.width/2) - offset;
  offset += dx * easing; 
  tint(255, 3);  // Display at half opacity
  //translate(width/2, height/2);
  //rotate(PI);
  image(img, 34, 34, 925, 925);
  //img.resize(750, 750);
  //image(img, 34, 34, 925, 925);
  
  //center of clock
  ellipseMode(CENTER);
  strokeWeight(3);
  ellipse(500, 500, 10, 10);
 
  //border
   fill(x);
   noStroke();
   rect(0, 0, 1000, 75);
   rect(0, 0, 75, 1000);
   rect(925, 0, 1000, 75);
   
   rect(925, 0, 1000, 1000);
   rect(0, 925, 1000, 75);
   
   //reference points for quarters of clock
   fill(y);
   ellipse(500, 75, 20, 35);
   ellipse(500, 925, 20, 35);
   ellipse(75, 500, 20, 35);
   ellipse(925, 500, 20, 35);
  smooth();
  
 
  
  
  //update variables with time and date
  s = second();
  m = minute();
  h = hour();
  
  angle = map(s, 0, 60, 0, 360)-90;

// change based on the minute
  if(m%2 == 0)
    {
      //println("even");
      stroke(255);
      x = 0;
      y = 255;
    }
  else
    {
      //println("odd");
      stroke(0);
      x = 255;
      y = 0;
    }
  
  if (s != lastSecond)
  {
    //println("Time flows on...");
    //update the last second
    lastSecond = s;
    
    //line 
    strokeWeight(2);
   //stroke(255);
    line(500, 500, cos(radians(angle)) * 2000 + 500, sin(radians(angle)) * 2000 + 500); 
    
    
  }
 
   //create canvas
  


 
}


